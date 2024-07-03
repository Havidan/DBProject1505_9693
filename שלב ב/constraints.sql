--constraint 1
 ALTER TABLE packeges ADD CONSTRAINT chk_weight_positive CHECK (weight > 0);
 insert into packeges values (999,0501234567,'mom',-3,54,67,4,7,2,5,4)

--constraint 2
ALTER TABLE Job ADD CONSTRAINT unique_jobName UNIQUE (jobName);
insert into Job (Jobnum, Jobname, Salaryperhour) values (1, 'פקיד', 40)

--constraint 3
ALTER TABLE packages MODIFY (price DEFAULT 5);
 insert into packages (idpackege, deliveryphone, recipientname, weight, packsize, buildingnumber, housenumber, id_sender, wid, streetnum)
 values(420,0501234567,'mom',3,54,67,4,7,19,5)
 
--some more two constraints
ALTER TABLE TrackingShipments ADD CONSTRAINT check_dates 
CHECK (orderDate <= sortDate AND sortDate <= sendingDate AND sendingDate <= deliveryDate);

ALTER TABLE trackingshipments MODIFY (Statusnum DEFAULT 1);
