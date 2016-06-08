---Cheque Book

--Listing

SELECT * FROM 
( 
SELECT C.Cheque_Number AS [Cheque No.]
, C.Description as Cheque_Book_Description
,C.Issue_Date as Bank_Issue_Date
, P.Voucher_No AS [Voucher No.]
, C.[Date] as Cheque_Date
, C.Cheque_Amount 
, Void = CONVERT(BIT,CASE WHEN C.Cancel='Y' THEN 1 ELSE 0 END)
, Bank_Name = ISNULL(C.Account_Code + ' ' + C.Bank_Name,'') 
, C.ID, C.Account_Code 
, '' as RecordID
, Cheque_No = CONVERT(NUMERIC,C.Cheque_Number) 
FROM FIN_Cheque_Book C 
LEFT JOIN FIN_Cash_Book P ON P.CoID IN 
	(
	SELECT IAP_CoID FROM dbo._fGetParentChildPropertyList('36.ABU')
	) AND C.By_Who=P.Document_No WHERE C.CoID='36.ABU'
) TBL ORDER BY [Bank_Name],[Cheque_No] ASC 


select * From FIN_Cheque_Book
 
 SELECT * FROM dbo._fGetParentChildPropertyList('36.ABU')


 select distinct Bank_Name FROM FIN_Cheque_Book

 ------------------------
 --PRINT

 SELECT C.Bank_Name, C.Description as Cheque_Book_Description
 , C.Issue_Date as Bank_Issue_Date , C.Cheque_Number as [Cheque_No.]
 , Void = CASE WHEN C.Cancel='Y' THEN 'Yes' ELSE 'No' END 
 , C.Last_Updated_By, C.Last_Updated_On, P.Voucher_No 
 FROM FIN_Cheque_Book C 
 LEFT JOIN FIN_Cash_Book P 
 ON LEFT(P.CoID, CHARINDEX('.', P.CoID) - 1)=36 
 AND C.By_Who=P.Document_No 
 WHERE C.ID=4509

 select C.Bank_Name, C.Description as Cheque_Book_Description
 , C.Issue_Date as Bank_Issue_Date , C.Cheque_Number as [Cheque_No.]
 , Void = CASE WHEN C.Cancel='Y' THEN 'Yes' ELSE 'No' END 
 , C.Last_Updated_By, C.Last_Updated_On, P.Voucher_No 
 From FIN_Cheque_Book C
 Left join FIN_Cash_Book P
 ON P.Coid LIKE '36%'
  AND C.By_Who = P.Document_No
  where C.ID = 4509

  select * from FIN_Cheque_Book WHERE Bank_Name = 'HSBC'
  Select * From FIN_Cash_Book WHERE Coid LIKE '36%'
  and Document_No = 'D2013100014'

  select * From FIN_Cash_Book where Voucher_No = 'CI201310006-ABKK'
  



  Select Account_Code, Account_Number + ' ' + Bank_Name  AS Bank_Account FROM FIN_Bank_Account 
WHERE CoID = '36.ABU' AND Active=1 
ORDER BY Account_Code


-----------------------
--Validation

SELECT * FROM FIN_Cheque_Book 
 WHERE CoID=N'36.ABU' 
AND Account_Code=N'1000001'
AND ISNUMERIC(Cheque_Number)=1
AND 
Cheque_Number
BETWEEN 100000 AND 100001
ORDER BY Cheque_Number


select * FROM FIN_Cheque_Book 
 WHERE CoID=N'36.ABU' 
AND Account_Code=N'1000001'

SELECT Parent_Property_ID FROM SYS_tblProperty WHERE CoID='36'
AND Property_ID='ABU' AND Parent_Property_ID<>'' 

select * from SYS_tblProperty

SELECT * FROM FIN_Cash_Book
WHERE CoID=N'36.ABU'
AND Account_Code=N'1000001'
AND Cheque_Number=N'01'
AND Cancel=0

SELECT Bank_Name
FROM FIN_Bank_Account 
WHERE CoID=N'36.ABU'
 AND Account_Code=N'1000001' 

 SELECT *
FROM FIN_Bank_Account 

-------------------


select * from SYS_tblAuditLog 
where Event_Detail LIKE '%Delete Cheque Number%'
order by ID desc

select  * from FIN_Cheque_Book
where Cheque_Number = '10'



select * FROM FIN_Cheque_Book 
 WHERE CoID=N'36.ABU' 
AND Account_Code=N'BL'


select top 2 * FROM MFA_FOMS_3T..FIN_Cheque_Book 
order by ID desc


select top 2 * FROM MFA_FOMS..FIN_Cheque_Book 
order by ID desc

