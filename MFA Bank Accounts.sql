---MFA Bank Accounts

--		sqlstr	"validaton
SELECT --TOP 1 
L.Account_Code,L.By_Who,L.Currency_Sign FROM FIN_General_Ledger L WHERE L.CoID=N'36.ABU' AND L.Currency_Sign<>'' AND L.Currency_Sign<>'AED' 
AND L.Account_Code='A200012' ORDER BY L.[Date]

-- update record

--		sqlstr	"
SELECT * FROM FIN_Bank_Account WHERE CoID='36.ABU' AND Account_Code=N'1000002'

SELECT * FROM FIN_Bank_Account ORDER BY Last_Updated_On DESC


SELECT * FROM MFA_FOMS..FIN_Bank_Account 

SELECT * FROM FIN_Chart_Of_Account WHERE
 ---Account_Code = '11119999' AND 
 CoID = '36.ABU'

SELECT * FROM SYS_tblApprovalStatus

-- Update Account Setting

--		sqlstr	"
SELECT * FROM FIN_Account_Setting WHERE CoID = '36.ABU' AND Account_Code = N'11119999' AND Account_Type=N'Bank Account'
SELECT * FROM FIN_Account_Setting WHERE CoID = '36.ABU' ORDER BY ID DESC

--		sqlstr	"
--Update FIN_Chart_of_Account SET Currency_Sign='AED' WHERE CoID='36.ABU' AND Account_Code=N'A200012'

--Update FIN_Bank_Account SET Decimal_Place = 3 

-- update Child OM

--		sqlstr	"
select cast(CoID as nvarchar) + '.' + Property_ID as IAPCOID  from SYS_tblProperty 
where CAST(coid as nvarchar) + '.' + Parent_Property_ID = '36.ABU' and Active = 1 

SELECT * FROM SYS_tblProperty


--UPDATE SYS_tblProperty 
--SET Parent_Property_ID = '' , Active = 1
--WHERE Property_ID = 'ABC'
----------------------------------
---FORM

SELECT     C.*
,A.* 
FROM 
(
SELECT Account_Code, Account_Code + ' ' + Account_Name as Account_Name, CoID 
FROM FIN_Chart_of_Account 
WHERE CoID=N'36.ABU' AND Account='Bank Account'  
AND Account_Code NOT IN ( SELECT Account_Code FROM FIN_Bank_Account WHERE CoID=N'36.ABU')
) C 
LEFT OUTER JOIN SYS_tblApprovalStatus AS A ON A.CoID = N'36' AND A.Form_Name = 'Chart of Account' AND C.Account_Code = A.RecordID 
WHERE     (C.CoID = N'36.ABU') AND (A.Approval_Status = 'Approved' OR A.Approval_Status IS NULL)


SELECT * FROM SYS_tblApprovalStatus WHERE Form_Name = 'Chart of Account' AND Approval_Status = 'Approved'

SELECT * FROM FIN_Chart_of_Account WHERE Account = 'Bank Account'

---------------------------------------------------

SELECT * FROM SYS_tblProperty
WHERE COID = '36' AND Property_ID = 'ABU'

--UPDATE SYS_tblProperty 
--SET Single_Imprest = 1
--WHERE CoID = '36' AND Property_ID = 'ABU'
----------------------------
--Print 

--		FormSQL	"
SELECT B.*, C.Currency_Sign  FROM FIN_Bank_Account B  
INNER JOIN FIN_Chart_of_Account C ON B.CoID = C.CoID AND B.Account_Code = C.Account_Code 
WHERE B.CoID=N'36.ABU' 
AND B.Account_Code='1000002'




SELECT * FROM FIN_Bank_Account WHERE Account_Code = '1000001' AND CoID = '36.ABU'
SELECT * FROM FIN_Chart_of_Account WHERE CoID = '36.ABU' AND Account_Code = '1000002'


SELECT * FROM SYS_tblDPSetup_History WHERE CoID = '36.ABU'



----------------------------------
---Listing


--		FormSQL	"
SELECT C.Account_Code + ' ' + C.Account_Name AS Account_Code,C.Currency_Sign as Curr, B.Account_Number AS [Bank_Account_No.], B.Account_Name AS Bank_Account_Name
, B.Bank_Name  , B.Active, B.ID, B.Account_Code as Account  
FROM FIN_Bank_Account B  
LEFT JOIN FIN_Chart_of_Account C ON B.CoID = C.CoID AND B.Account_Code = C.Account_Code 
WHERE B.CoID='36.ABU'  


---------------------------------------
---Update

  --ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Bank_Account ADD Decimal_Place INT NULL

  --ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Bank_Account ADD DP_Effective_Date NVARCHAR(10) NULL

  --UPDATE [MFA_FOMS_3T].[dbo].FIN_Bank_Account 
  --SET Decimal_Place = 2 , DP_Effective_Date = 'Mar 2013' 


-----------------------------------
----Add on Client Time zone and Server Time zone

  --ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Bank_Account ADD [ServerTimeZone] INT NOT NULL DEFAULT '-480'
  --ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Bank_Account ADD [ClientTimeZone] INT NOT NULL DEFAULT '-480'



--------------------------------------------------------------------------------------------
---Delete

--		Source	"
SELECT Account_Name, Account_Code FROM FIN_Bank_Account WHERE Account_Code= N'11119999' AND Coid = N'36.ABU'

--		Bank_Account	"11119999"	String

--		LstIAPCoID	"36.ABU"	String

--		sqlstr	"
select cast(CoID as nvarchar) + '.' + Property_ID as IAPCOID  from SYS_tblProperty where CAST(coid as nvarchar) + '.' + Parent_Property_ID = '36.ABU' and Active = 1 

--		sqlstr	"
SELECT Voucher_No FROM FIN_Cash_Book  WHERE CoID IN ('36.ABU')  AND Account_Code= N'11119999' and cancel = 0

--		sqlstr	"
SELECT Receipt_Number FROM FIN_Receipt  WHERE CoID in ('36.ABU')  AND Account_Code= N'11119999' and cancel = 0 


select * from FIN_Receipt


SELECT * FROM FIN_Cheque_Book

----------------------------------------------------

---GetUserType

--		sqlstr	"
select E.*,Grp.User_Group from vw_Users as E 
left join SYS_tblUserGroup as Grp  ON E.CoID = Grp.CoID and E.groupID = Grp.GroupID  
where E.UserID = 'HRS2016010001' and E.CoID  = '36' 


SELECT * FROM vw_Users order by Last_Updated_Date desc

select * From SYS_tblUserGroup




SELECT * FROM [MFA_FOMS].[dbo].FIN_Bank_Account WHERE Account_Number = '12345' AND CoID = '36.ABU'



select * from FIN_Bank_Account WHERE Account_Code = '1000001'


select * from SYS_tblAuditLog 
where Event_Detail = 'Update MFA Bank Account'
AND RecordID = '1000001'
order by ID desc