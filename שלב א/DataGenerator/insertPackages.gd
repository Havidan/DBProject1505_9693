
[General]
Version=1

[Preferences]
Username=
Password=2577
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=PACKAGES
Count=417

[Record]
Name=IDPACKEGE
Type=NUMBER
Size=3
Data=Sequence(318)
Master=

[Record]
Name=DELIVERYPHONE
Type=NUMBER
Size=10
Data='05'[11111111]
Master=

[Record]
Name=RECIPIENTNAME
Type=VARCHAR2
Size=15
Data=FirstName+' ' + LastName
Master=

[Record]
Name=WEIGHT
Type=FLOAT
Size=22
Data=Random(0.5, 20)
Master=

[Record]
Name=PACKSIZE
Type=FLOAT
Size=22
Data=Random(5.5,50)
Master=

[Record]
Name=PRICE
Type=FLOAT
Size=22
Data=List(5.9,10.9,15.9,20,25,50)
Master=

[Record]
Name=BUILDINGNUMBER
Type=NUMBER
Size=2
Data=Random(1,100)
Master=

[Record]
Name=HOUSENUMBER
Type=NUMBER
Size=2
Data=Random(1,50)
Master=

[Record]
Name=ID_SENDER
Type=NUMBER
Size=3
Data=List(select id_sender from costumer)
Master=

[Record]
Name=WID
Type=NUMBER
Size=3
Data=List(select wid from workers)
Master=

[Record]
Name=STREETNUM
Type=NUMBER
Size=3
Data=List(select streetnum from street)
Master=

