--select 1
select streetname,avg_size,avg_weight,sum_price,num_packages
from street s natural join( 
                      select streetnum ,round(avg(packsize),2) as avg_size,round(avg(weight),2) as avg_weight,
                             sum(price) as sum_price, count(*) as num_packages
                      from street s 
                      natural join  
                         packages p 
                      natural join 
                         trackingshipments t 
                      group by streetnum) 



--select 2
select wid, firstname, lastname, bonus+j.hourorpackagesalary*w.workhours+10*(
                                                          select count(p.idpackege)
                                                          from packages p join trackingshipments t on p.idpackege=t.idpackege
                                                          where w.wid=p.wid 
                                                          and EXTRACT(YEAR from t.orderdate)=2024
                                                          group by p.wid
                                                          ) as finalSalary, j.jobname
from job j natural join workers w
where j.jobname='משלוחן'
UNION
select wid,firstname, lastname, w.bonus+j.hourorpackagesalary*w.workhours as finalSalary, j.jobname
from job j natural join workers w
where j.jobname!='משלוחן'

--select 3
WITH WorkerAppointmentCount AS (
    SELECT Wid, COUNT(AppID) AS totalAppointments
    FROM Appointments
    GROUP BY Wid
),
MaxAppointments AS (
    SELECT MAX(totalAppointments) AS maxAppointments
    FROM WorkerAppointmentCount
)
SELECT W.wID, W.firstName, W.lastName, COUNT(A.AppID) AS appointmentCount
FROM Workers W
JOIN Appointments A ON W.wID = A.wID
WHERE W.wID IN (
    SELECT wID
    FROM WorkerAppointmentCount WAC, MaxAppointments MA
    WHERE WAC.totalAppointments = MA.maxAppointments
) 
GROUP BY W.wID, W.firstName, W.lastName
ORDER BY appointmentCount DESC;
  

select *
from appointments
where wid=51


--select 4
WITH RecentAppointments AS (
    SELECT w.wID, w.firstName, w.lastName, 'פקיד' AS activity_type, COUNT(a.AppID) AS activity_count
    FROM Workers w
    JOIN Appointments a ON w.wID = a.wID
    WHERE a.App_date >= ADD_MONTHS(SYSDATE, -6) and jobnum=67  
    GROUP BY w.wID, w.firstName, w.lastName
),

RecentPackages AS (
    SELECT w.wID, w.firstName, w.lastName, 'שליח' AS activity_type, COUNT(p.idpackege) AS activity_count
    FROM Workers w
    JOIN packeges p ON w.wID = p.wID
    join trackingshipments t ON t.idpackege = p.idpackege
    WHERE t.sendingdate >= ADD_MONTHS(SYSDATE, -6) and jobnum= 69
    GROUP BY w.wID, w.firstName, w.lastName
),
SELECT *
FROM RecentAppointments
UNION ALL
SELECT *
FROM RecentPackages

--select 5
SELECT c.id_Sender,c.phone,c.email,p.total_packages,p.avg_package_price
FROM Costumer c
JOIN (  SELECT
        id_Sender,
        COUNT(*) AS total_packages, AVG(price) AS avg_package_price
        FROM packages
        GROUP BY id_Sender
     ) p ON c.id_Sender = p.id_Sender
WHERE 
    p.total_packages > (
                       SELECT AVG(package_count)
                       FROM (
                             SELECT COUNT(*) AS package_count
                             FROM packages
                             GROUP BY id_Sender
                             )
                        )
    AND p.avg_package_price > (
                               SELECT AVG(subquery2.price)
                               FROM (
                                     SELECT id_Sender, COUNT(*) AS package_count, AVG(price) AS price
                                     FROM packages
                                     GROUP BY id_Sender
                                     ) subquery2
                               WHERE subquery2.package_count = p.total_packages
                               )
                               
--select 6
select 
         p.wid,p.idpackege,p.recipientname,p.weight,c.id_sender,c.email,c.phone,t.orderdate, t.sortdate,t.sendingdate,t.deliverydate
from 
         packages p join costumer c on p.id_sender=c.id_sender join trackingshipments t on p.idpackege=t.idpackege
where    
         t.sendingdate>=ADD_MONTHS(SYSDATE,-1) AND T.DELIVERYDATE IS NULL
ORDER BY 
         t.orderdate desc

--update 1
ALTER TABLE workers
ADD bonus number(3);

UPDATE workers
SET bonus = 0

UPDATE workers w
SET bonus = bonus + 500
where w.wid IN(
             select p.wid
             from packages p 
             group by p.wid
             having count(*)>=ALL(
                                  select count(*)
                                  from packages p
                                  group by p.wid)
             )
             or w.wid in (
                        select a.wid
                        from appointments a 
                        group by a.wid
                        having count(*)>=ALL(
                                             select count(*)
                                             from appointments a
                                             group by a.wid)
                        )






--update 2
select jobnum,wid,jobname
from workers natural join job
where wid=89
update workers
set jobnum=67
where wid=89

UPDATE workers w
SET w.jobnum = (
    SELECT jobnum
    FROM job
    WHERE jobname = 'מנהל'
)
WHERE w.wid = (
    SELECT wid
    FROM (
        SELECT w.wid, COUNT(*) AS appointment_count
        FROM appointments a
        JOIN workers w ON a.wid = w.wid
        JOIN job j ON w.jobnum = j.jobnum
        WHERE j.jobname = 'פקיד'
        GROUP BY w.wid
        ORDER BY appointment_count DESC
    )
     WHERE ROWNUM = 1
);


--delete 1
DELETE FROM appointments 
WHERE  appid IN(
      SELECT a.appid
      FROM appointments a
      Join costumer c ON c.id_sender = a.id_sender
      where a.app_date <= ADD_MONTHS(SYSDATE, -16) and a.id_sender not in (select a1.id_sender
                                                                       from appointments a1
                                                                       where a1.app_date>=ADD_MONTHS(SYSDATE, -12)))
      


--delete 2
delete
from workers w
wherew.wid in (
      select wid
      from appointments 
      minus
      select distinct wid
      from appointments a
      where a.app_date>=ADD_MONTHS(SYSDATE, -6)
      union
      select wid
      from packages
      minus
      select distinct wid
      from packages p join trackingshipments t on t.idpackege=p.idpackege
      where t.sendingdate>=ADD_MONTHS(SYSDATE, -12)
      )
