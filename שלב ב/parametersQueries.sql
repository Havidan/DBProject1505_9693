--parameters 1
select p.idpackege,p.deliveryphone,p.recipientname,p.buildingnumber,p.housenumber,p.streetnum,t.orderdate,t.sortdate,t.sendingdate,t.deliverydate,t.statusnum
from packages p join trackingshipments t on p.idpackege=t.idpackege
where id_sender=20 

update packages p
set p.streetnum=&<name=streetNum list="select streetNum, streetName  from street" description=true type=integer restricted=true hint="choose the name of the street">
  , p.buildingnumber=&<name=buildingnumber type=integer required=true hint="enter the building number">
  , p.housenumber=&<name=housenumber type=integer required=true hint="enter the house number">
  , p.deliveryphone=(
                     select c.phone
                     from costumer c 
                     where c.id_sender=&<name=idSender type=integer required=true>)
where p.id_sender in (
                     select c.id_sender
                     from costumer c 
                     where c.id_sender=&<name=idSender type=integer required=true>
                     ) 
                     and p.idpackege in (
                                         select t.idpackege
                                         from trackingshipments t
                                         where t.deliverydate is null
                                         ) 
                      and p.idpackege = COALESCE(&<name=idPackage type=integer>, (
                                                               select p.idpackege
                                                               from packages p join trackingshipments t on p.idpackege = t.idpackege
                                                               where p.id_sender = &<name=idSender type=integer required=true>
                                                                     and
                                                                     t.orderdate = (
                                                                       select max(t2.orderdate)
                                                                       from trackingshipments t2 join packages p2 on t2.idpackege = p2.idpackege   
                                                                       where p2.id_sender = &<name=idSender type=integer required=true>
                                                                       )
                                                               ));

 
select p.idpackege,p.id_sender,t.deliverydate
from packages  p join trackingshipments t on p.idpackege=t.idpackege join costumer c on p.id_sender=c.id_sender
where t.deliverydate is null





--parameters 2
select p.idpackege,p.weight,p.recipientname,p.packsize,p.streetnum,p.wid,w.firstname,w.lastname,t.orderdate,t.sortdate,t.sendingdate,t.deliverydate
from packages p join workers w on w.wid=p.wid join trackingshipments t on t.idpackege=p.idpackege join orderstatus o on t.statusnum=o.statusnum
where p.idpackege in (
                      select t.idpackege
                      from trackingshipments t
                      where EXTRACT(YEAR from t.orderdate) = 
                      &<name="Yeardate" type=integer required=false ifempty=2024 hint="enter the year date you want to see the pakages from this date">
                     )
                   and w.wid=&<name="id" type=integer required=false>
                   and w.firstname = &<name="firstName" type=string hint="enter the first name of the worker">
                   and w.lastname = &<name="lastName" type=string hint="enter tha last name of the worker">
                   and o.statusnum = &<name="status" list="select statusnum, statusName from orderstatus" description=true type=integer restricted=true>


--parameters 3
DELETE
from packeges
 WHERE idPackege IN (
    SELECT p.idPackege 
    FROM Packeges p
    JOIN TrackingShipments ts ON p.idPackege = ts.idPackege
    JOIN OrderStatus os ON ts.statusNum = os.statusNum
    WHERE os.statusName <> 'נמסר'
    AND p.id_sender = &<name=id_sender type=Integer hint="Enter the sender's ID number" required=true>
    AND p.idpackege = &<name=idpackege type=Integer hint= "Enter the ID number of the package" required=true>
    );
    
    
--parameters 4
select avg(t.deliverydate-t.orderdate) 
from workers w join packages p on w.wid=p.wid join trackingshipments t on p.idpackege=t.idpackege
where w.wid=&<name=numOfWorker hint="enter id of worker" type=integer required=true>
and orderdate > &<name=startdate type=date hint="format dd/mm/yyyy">
and deliveryDate is not null
