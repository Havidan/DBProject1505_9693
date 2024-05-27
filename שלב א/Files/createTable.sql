CREATE TABLE Job
(
  jobNum NUMERIC(2) NOT NULL,
  jobName VARCHAR(15) NOT NULL,
  salaryPerHour FLOAT NOT NULL,
  PRIMARY KEY (jobNum)
);

CREATE TABLE Costumer
(
  id_sender NUMERIC(3) NOT NULL,
  email VARCHAR(15),
  phone NUMERIC(10) NOT NULL,
  PRIMARY KEY (id_sender)
);

CREATE TABLE OrderStatus
(
  statusNum NUMERIC(3) NOT NULL,
  statusName VARCHAR(15) NOT NULL,
  chronoOrder NUMERIC(1) NOT NULL,
  PRIMARY KEY (statusNum)
);

CREATE TABLE city
(
  cityName VARCHAR(15) NOT NULL,
  cityNum NUMERIC(3) NOT NULL,
  PRIMARY KEY (cityNum)
);

CREATE TABLE street
(
  streetNum NUMERIC(3) NOT NULL,
  streetName VARCHAR(15) NOT NULL,
  PRIMARY KEY (streetNum)
);

CREATE TABLE Workers
(
  wID NUMERIC(3) NOT NULL,
  firstName VARCHAR(15) NOT NULL,
  lastName VARCHAR(15) NOT NULL,
  email VARCHAR(15),
  phone NUMERIC(10) NOT NULL,
  jobNum NUMERIC(2) NOT NULL,
  cityNum NUMERIC(3),
  streetNum NUMERIC(3),
  PRIMARY KEY (wID),
  FOREIGN KEY (jobNum) REFERENCES Job(jobNum),
  FOREIGN KEY (cityNum) REFERENCES city(cityNum),
  FOREIGN KEY (streetNum) REFERENCES street(streetNum)
);

CREATE TABLE Appointments
(
  App_date DATE NOT NULL,
  AppID NUMERIC(3) NOT NULL,
  lengthApp NUMERIC(2) NOT NULL,
  id_sender NUMERIC(3) NOT NULL,
  wID NUMERIC(3) NOT NULL,
  PRIMARY KEY (AppID),
  FOREIGN KEY (id_sender) REFERENCES Costumer(id_sender),
  FOREIGN KEY (wID) REFERENCES Workers(wID)
);

CREATE TABLE packeges
(
  idPackege NUMERIC(3) NOT NULL,
  deliveryPhone NUMERIC(10) NOT NULL,
  recipientName VARCHAR(15),
  weight FLOAT,
  packsize FLOAT,
  price FLOAT,
  buildingNumber NUMERIC(2) NOT NULL,
  houseNumber NUMERIC(2),
  id_sender NUMERIC(3) NOT NULL,
  wID NUMERIC(3) NOT NULL,
  streetNum NUMERIC(3) NOT NULL,
  PRIMARY KEY (idPackege),
  FOREIGN KEY (id_sender) REFERENCES Costumer(id_sender),
  FOREIGN KEY (wID) REFERENCES Workers(wID),
  FOREIGN KEY (streetNum) REFERENCES street(streetNum)
);

CREATE TABLE TrackingShipments
(
  idTracShip NUMERIC(3) NOT NULL,
  orderDate DATE NOT NULL,
  sortDate DATE,
  sendingDate DATE,
  deliveryDate DATE,
  statusNum NUMERIC(3) NOT NULL,
  idPackege NUMERIC(3) NOT NULL,
  PRIMARY KEY (idTracShip),
  FOREIGN KEY (statusNum) REFERENCES OrderStatus(statusNum),
  FOREIGN KEY (idPackege) REFERENCES packeges(idPackege)
);
