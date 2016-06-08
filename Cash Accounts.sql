----Cash Accounts

--		CashSQL	"
SELECT A.*, ISNULL(T.Account_Code,'') AS Used_Account  FROM 
(
 SELECT Overseas_Mission = P.Property_ID + ' ' + P.Property_Name         
, Mission_Code = P.Property_ID, Account = A.Account_Name, A.Account_Code, Amount = A.Opening_Balance, Cash_Currency_Sign = A.Currency_Sign, A.CoID        
,Equivalent_Imprest_Currency ,Petty_Cash_Float,A.Active,A.Effective_Date_From,A.Effective_Date_To        
FROM FIN_Account_Setting A        
INNER JOIN FIN_Chart_of_Account C ON A.CoID=C.CoID AND A.Account_Code=C.Account_Code        
INNER JOIN SYS_tblProperty P ON CONVERT(nvarchar,P.CoID)+'.'+P.Property_ID=A.CoID       
 WHERE P.CoID=36 AND A.Account_Type='Cash Account'  
) A  
 	LEFT JOIN 
	 ( 
	 	SELECT CoID, Account_Code 
	 	FROM 
	 	(                
		 SELECT     CoID, Account_Code                
		 FROM  FIN_Cash_Book AS F WHERE Type_of_Payment = 0 AND Type NOT IN ('O') GROUP BY CoID, Account_Code                
		 UNION ALL                 
		 SELECT     CoID, Account_Code                
		 FROM  FIN_Receipt AS F WHERE Type_of_Receipt = 0 AND Type NOT IN ('O') GROUP BY CoID, Account_Code 
	 	) TBL 
	 GROUP BY CoID, Account_Code
	 ) T ON A.CoID=T.CoID AND A.Account_Code=T.Account_Code  
 WHERE 1=1  --AND A.Active = 1  
 ORDER BY A.Overseas_Mission

 --------------------------------


 select * From FIN_Cash_Book


 	SELECT     CoID, Account_Code                
FROM  FIN_Cash_Book AS F WHERE Type_of_Payment = 0 AND Type NOT IN ('O') GROUP BY CoID, Account_Code    


 
		SELECT     CoID, Account_Code                
FROM  FIN_Receipt AS F WHERE Type_of_Receipt = 0 AND Type NOT IN ('O') GROUP BY CoID, Account_Code 


 SELECT Overseas_Mission = P.Property_ID + ' ' + P.Property_Name         
, Mission_Code = P.Property_ID, Account = A.Account_Name, A.Account_Code, Amount = A.Opening_Balance, Cash_Currency_Sign = A.Currency_Sign, A.CoID        
,Equivalent_Imprest_Currency ,Petty_Cash_Float,A.Active,A.Effective_Date_From,A.Effective_Date_To        
FROM FIN_Account_Setting A        
INNER JOIN FIN_Chart_of_Account C ON A.CoID=C.CoID AND A.Account_Code=C.Account_Code        
INNER JOIN SYS_tblProperty P ON CONVERT(nvarchar,P.CoID)+'.'+P.Property_ID=A.CoID       
 WHERE P.CoID=36 AND A.Account_Type='Cash Account'  AND A.Active = 0



 --GetLastUpdated("Finance Setup","Cash Accounts","")
 --GetLastUpdated (byval EventType, byval EventDetail, byval DocRef)
 SELECT TOP 1 ISNULL(U.Initial,A.UserName) AS UserName, A.Event_Date
		 FROM SYS_tblAuditLog A
		 LEFT JOIN vw_Users U ON U.CoID=A.CoID AND U.UserID=A.UserID
		 WHERE A.CoID='36'
		 AND A.Event_Type='Finance Setup'
		 AND Event_Detail LIKE '%Cash Accounts%'
		 AND A.Document_Ref=N''
		 ORDER BY A.Event_Date DESC

		 select * From SYS_tblAuditLog where Event_Type = 'Finance Setup' AND Event_Detail LIKE '%Cash Accounts%' AND Document_Ref = ''
		 order by Event_Date desc


		 select * from FIN_Account_Setting

















 select * From FIN_Account_Setting

 select * From FIN_Cash_Book

  SELECT Overseas_Mission = P.Property_ID + ' ' + P.Property_Name         
, Mission_Code = P.Property_ID, Account = A.Account_Name, A.Account_Code, Amount = A.Opening_Balance, Cash_Currency_Sign = A.Currency_Sign, A.CoID        
,Equivalent_Imprest_Currency ,Petty_Cash_Float,A.Active,A.Effective_Date_From,A.Effective_Date_To        
FROM FIN_Account_Setting A        
INNER JOIN FIN_Chart_of_Account C ON A.CoID=C.CoID AND A.Account_Code=C.Account_Code        
INNER JOIN SYS_tblProperty P ON CONVERT(nvarchar,P.CoID)+'.'+P.Property_ID=A.CoID       
 WHERE P.CoID=36 AND A.Account_Type='Cash Account'  

 ------------------------------

 select distinct * From FIN_Cash_Book





 select * From FIN_Chart_of_Account

 select * FROM SYS_tblProperty

 ---This is OverMission Lookup
 SELECT Property_ID as [Overseas Mission Code]
 , Property_Name as [Overseas Mission Name] 
 FROM SYS_tblProperty WHERE CoID='36'

 select *  FROM SYS_tblProperty WHERE CoID='36'


 ------------------
 ---this is account code Lookup
 select * FROM  FIN_Chart_of_Account

 SELECT     Account_Code, Account_Name,ID as Account_ID,Currency_Sign as Curr, Account AS Account_Type 
FROM  FIN_Chart_of_Account
 WHERE CoID='36.' AND Account='Cash Account'


 -----------------
---this is Account Currency -- currency code

select * From SYS_tblLookup

SELECT C.LookupValue1 as Currency_Sign, C.LookupValue2 as Currency_Name
FROM SYS_tblLookup C
WHERE C.CoID = 'ABU'
AND C.LookupID = 'Currency' 

--------------------------

SELECT C.LookupValue1 as Currency_Sign, C.LookupValue2 as Currency_Name
 FROM SYS_tblLookup C 
WHERE C.CoID IN ('36','') AND C.LookupID = 'Currency'  
and C.LookupValue1 IN ( SELECT Operating_Currency FROM SYS_tblProperty_Operate_Currency WHERE CoID=36  AND Property_ID='ABU' ) 

-----------------------------------------------

SELECT TOP 1 L.Account_Code,L.By_Who,L.Currency_Sign FROM FIN_General_Ledger L
WHERE L.CoID=N'36.ABU'
AND L.Currency_Sign<>'' AND L.Currency_Sign<>''				
AND L.Account_Code=''
ORDER BY L.[Date]

select * from FIN_General_Ledger where 


----------------------------------
---UPDATE SQL

--		TmpCoID	"36."	String

 WHERE LEFT(CoID,LEN('36.'))=N'36.' AND Account_Type='Cash Account'

--		sqlstr	"DELETE FROM FIN_Account_Setting WHERE LEFT(CoID,LEN('36.'))=N'36.' AND Account_Type='Cash Account'"	String

--		sqlstr	"DELETE FROM FIN_Account_Setting WHERE LEFT(CoID,LEN('36.'))=N'36.' AND Account_Type='Cash Account' AND Active=1 "	String

--		sqlstr	"UPDATE FIN_Chart_of_Account SET Currency_Sign='AED' WHERE CoID=N'36.ABU' AND Account_Code='PCL'"	String


select * From FIN_Chart_of_Account
WHERE CoID=N'36.ABU' AND Account_Code='PCL'


------------------------------
---validation

select * From FIN_General_Ledger WHERE CoID ='36.ABU' AND Currency_Sign = '' AND Currency_Sign <> 'SGD' 
AND Account_Code = 'PCL' 


select *  FROM MFA_FOMS..FIN_Account_Setting where Account_Type = 'Cash Account'

select *  FROM FIN_Account_Setting where Account_Type = 'Cash Account'


update FIN_Account_Setting
set Active = 1
Where Account_Type = 'Cash Account'

delete FROM MFA_FOMS_3T..FIN_Account_Setting 

select * into #tempFIN_Account_Setting from FIN_Account_Setting


select * from #tempFIN_Account_Setting

insert into MFA_FOMS_3T..FIN_Account_Setting
(CoID, Account_Type, Account_Code, Account_Name, Opening_Balance,Equivalent_Imprest_Currency,Petty_Cash_Float,Effective_Date_From,Effective_Date_To,Active,Currency_Sign)
 (select CoID, Account_Type, Account_Code, Account_Name, Opening_Balance,Equivalent_Imprest_Currency,Petty_Cash_Float,Effective_Date_From,Effective_Date_To,Active,Currency_Sign 
  from #tempFIN_Account_Setting
)


select * From SYS_tblAuditLog 
where Event_Detail LIKE '%Cash Account%'
order by Event_Date desc