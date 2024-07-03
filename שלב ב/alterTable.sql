--Update dates in logical order
update trackingshipments 
set sendingdate=null, deliverydate=null
where sortdate is null

update trackingshipments 
set deliverydate=null
where sendingdate is null

update trackingshipments
set deliverydate=sendingdate+1
where sendingdate is not null and deliverydate<sendingdate
             
update trackingshipments
set sendingdate=sortdate+1
where sortdate is not null and sendingdate<sortdate


--Correct status number update
update trackingshipments t
set t.statusnum=33
where t.orderdate is not null

update trackingshipments t
set t.statusnum=34
where t.sortdate is not null

update trackingshipments t
set t.statusnum=35
where t.sendingdate is not null

update trackingshipments t
set t.statusnum=36
where t.deliverydate is not null


--adding a column and initializition
ALTER TABLE workers
ADD WorkHours float;

UPDATE workers
SET WorkHours = 0

update workers
set workHours=ROUND(DBMS_RANDOM.VALUE(50.0,180.0),2)
