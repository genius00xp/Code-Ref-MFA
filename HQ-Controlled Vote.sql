----HQ-Controlled Vote

--Listing
SELECT * FROM
 (
 SELECT R.Account_Code,COA.Account_Name,R.SubAccount_Code AS [Sub-Account Code], S.SubAccount_Name AS [Sub-Account Name]
, Sheet_Name as Excel_Worksheet_Tab_Name
, CASE 
WHEN R.Budget_Check = 1 THEN 'Account Pool' 
WHEN R.Budget_Check = 2 THEN 'Account Code' 
WHEN R.Budget_Check = 3 THEN 'Sub-Account Code' 
END AS Budget_Allocation_Check_Level
, R.Active,R.ID,R.Last_Updated_By,R.Last_Updated_On 
FROM FIN_HQ_Controlled_Vote as R 
LEFT JOIN FIN_Chart_of_Account as COA ON R.CoId=COA.CoID and R.Account_Code = COA.Account_Code 
LEFT JOIN FIN_Sub_Account as S ON R.COID = S.CoID AND R.SubAccount_Code = S.SubAccount_Code 
WHERE R.CoID = N'36.ABU' AND R.Active=1
) TBL ORDER BY [Account_Code],[Sub-Account Code] ASC 

select * from FIN_HQ_Controlled_Vote

select * From FIN_Chart_of_Account

select * from FIN_Sub_Account

---------------------------------------------
--Print

SELECT R.Account_Code,COA.Account_Name,ISNULL(R.SubAccount_Code,'') AS SubAccount_Code,S.SubAccount_Name, R.Active,R.Budget_Check AS Budget_Check_Level,R.ID,R.Last_Updated_By,R.Last_Updated_On, ISNULL(Sheet_Name,CASE WHEN R.SubAccount_Code = '' THEN R.Account_Code ELSE R.Account_Code + '_' + R.SubAccount_Code END) AS Sheet_Name FROM FIN_HQ_Controlled_Vote as R LEFT JOIN FIN_Chart_of_Account as COA ON R.CoId=COA.CoID and R.Account_Code = COA.Account_Code LEFT JOIN FIN_Sub_Account as S ON R.COID = S.CoID and R.SubAccount_Code = S.SubAccount_Code WHERE R.CoID = N'36.ABU' AND R.ID = 682 