
[General]
Version=1

[Preferences]
Username=
Password=2580
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=WORKERS
Count=10..20

[Record]
Name=WID
Type=NUMBER
Size=3
Data=Sequence(1)
Master=

[Record]
Name=FIRSTNAME
Type=VARCHAR2
Size=15
Data=FirstName
Master=

[Record]
Name=LASTNAME
Type=VARCHAR2
Size=15
Data=LastName
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=15
Data=Email
Master=

[Record]
Name=PHONE
Type=NUMBER
Size=10
Data='05'[1]'-'[1111111]
Master=

[Record]
Name=JOBNUM
Type=NUMBER
Size=2
Data=List(select jobNum from Job)
Master=

[Record]
Name=CITYNUM
Type=NUMBER
Size=3
Data=List(select cityNum from City)
Master=

[Record]
Name=STREETNUM
Type=NUMBER
Size=3
Data=List(select streetNum from Street)
Master=

