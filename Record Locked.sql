--Record Locked

SELECT R.Record_Type, R.Record_ID, R.Time_Stamp as Record_Locked_On, E.Employee_ID + ' ' + E.Employee_Name as Record_Locked_By 
, R.ID 
FROM SYS_tblRecordLocked R 
LEFT JOIN vw_Employee E ON R.CoID=E.CoID AND R.UserID=E.Employee_ID 
WHERE R.CoID= '36'

SELECT * FROM ( 
SELECT R.Record_Type, R.Record_ID, R.Time_Stamp as Record_Locked_On, E.Employee_ID + ' ' + E.Employee_Name as Record_Locked_By , R.ID 
FROM SYS_tblRecordLocked R 
LEFT JOIN vw_Employee E ON R.CoID=E.CoID AND R.UserID=E.Employee_ID 
WHERE R.CoID=36) TBL 
ORDER BY [Record_Locked_On] DESC 
 
 select * from MFA_FOMS_3T..SYS_tblRecordLocked
 
 select * from MFA_FOMS..SYS_tblRecordLocked


select * from SYS_tblRecordLocked

select * into #temprecordlocked1 from SYS_tblRecordLocked


select * from #temprecordlocked1

insert into MFA_FOMS_3T..SYS_tblRecordLocked
(CoID, Record_Type, Record_ID, UserID, Time_Stamp)
 (select CoID, Record_Type, Record_ID, UserID, Time_Stamp  from #temprecordlocked1)