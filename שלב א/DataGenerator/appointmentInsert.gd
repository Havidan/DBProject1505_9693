
[General]
Version=1

[Preferences]
Username=
Password=2616
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=APPOINTMENTS
Count=999

[Record]
Name=APP_DATE
Type=DATE
Size=
Data=Random(1/1/23, 26/5/24)
Master=

[Record]
Name=APPID
Type=NUMBER
Size=3
Data=Sequence(1)
Master=

[Record]
Name=LENGTHAPP
Type=NUMBER
Size=2
Data=List(5, 10, 15)
Master=

[Record]
Name=ID_SENDER
Type=NUMBER
Size=3
Data=List(select ID_SENDER from COSTUMER)
Master=

[Record]
Name=WID
Type=NUMBER
Size=3
Data=List(select WID from WORKERS)
Master=

