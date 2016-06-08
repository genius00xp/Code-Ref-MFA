---FIN_Exchange_Rate

select * from _tblImportFile

select * from _tblCodes


SELECT  L.LookupValue2 as Import_Code,L.LookupValue1 as Import_Type,L.LookupValue4 as Submit_Link
FROM         _tblLookup L
WHERE     (L.LookupID = 'ImportType') 
AND L.LookupValue2='" & ImportCode & "'")


--		sqlstr	"
INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('ADF','18 May 2012','0.2456','4.0728','22/4/2016 10:55:51 AM'); 
INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('AED','18 May 2012','0.345','2.9011','22/4/2016 10:55:54 AM'); 
INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('AFA','18 May 2012','0.0253','39.704','22/4/2016 10:55:54 AM'); 
INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('ALL','18 May 2012','0.0118','87.7865','22/4/2016 10:55:54 AM'); 
INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('AMD','18 May 2012','0.0032','313.518','22/4/2016 10:55:54 AM'); 
INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('ANG','18 May 2012','0.7117','1.4372','22/4/2016 10:55:54 AM'); 
INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('AUD','18 May 2012','1.2579','0.7953','22/4/2016 10:55:54 AM'); 

INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('AUD','18 May 2018','1.2579','0.7953',null); 

INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('AUD','18/5/2012','1.2579','0.7953',null); 


INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES ('AUD','2017-01-31','1.2579','0.7953','2012-01-31 10:55:54 AM'); 

Delete From FIN_Exchange_Rate WHERE Code = 'AUD' AND Date = '2017-01-31'