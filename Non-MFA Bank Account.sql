---Non-MFA Bank Account

SELECT * FROM 
(
SELECT B.Currency as Curr,B.Account_Number AS [Bank_Account_No.], B.Account_Name AS Bank_Account_Name
, B.Bank_Name , B.Active, B.ID, B.Account_Number as _RecordTitle 
FROM FIN_Non_Bank_Account B 
WHERE B.CoID='36.ABU' 
) TBL ORDER BY [Curr] ASC


SELECT * FROM FIN_Non_Bank_Account


select * From SYS_tblAuditLog 
WHERE
Event_Detail LIKE '%Non%' AND Document_Action = 'Delete'
 order by ID desc

 select * From MFA_FOMS..SYS_tblAuditLog 
WHERE
Event_Detail LIKE '%Non%' 
 order by ID desc

 select * From SYS_tblAuditLog 
WHERE
 RecordID = '4'
 order by ID desc

 
 select * From MFA_FOMS..SYS_tblAuditLog 
WHERE
 RecordID = '4'
 order by ID desc


-----Account Currency

select Operating_Currency, Operating_Currency + ' ' + C.LookupValue2 as Name
FROM SYS_tblProperty_Operate_Currency O 
INNER JOIN (select * from SYS_tblLookup L WHERE L.LookupID = 'Currency') C
ON C.LookupValue1 = O.Operating_Currency
WHERE O.CoID = '36' AND O.Property_ID = 'ABU'



select * from SYS_tblLookup L WHERE L.LookupID = 'Currency'
select * from SYS_tblProperty_Operate_Currency A 
WHERE A.Operating_Currency = 'BEF' AND A.CoId = '36' AND A.Property_ID = 'ABU'

select * from SYS_tblLookup L WHERE L.LookupID = 'Currency'