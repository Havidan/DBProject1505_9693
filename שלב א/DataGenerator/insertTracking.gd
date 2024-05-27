
[General]
Version=1

[Preferences]
Username=
Password=2802
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=TRACKINGSHIPMENTS
Count=413

[Record]
Name=IDTRACSHIP
Type=NUMBER
Size=3
Data=Sequence(1)
Master=

[Record]
Name=ORDERDATE
Type=DATE
Size=
Data=Random(1/1/22, 1/1/23) 
Master=

[Record]
Name=SORTDATE
Type=DATE
Size=
Data=Random(1/1/23, 1/5/23) 
Master=

[Record]
Name=SENDINGDATE
Type=DATE
Size=
Data=Random(1/5/23, 1/1/24) 
Master=

[Record]
Name=DELIVERYDATE
Type=DATE
Size=
Data=Random(1/1/24, 26/5/25) 
Master=

[Record]
Name=STATUSNUM
Type=NUMBER
Size=3
Data=List(select STATUSNUM from orderstatus)
Master=

[Record]
Name=IDPACKEGE
Type=NUMBER
Size=3
Data=Sequence(1)
Master=

