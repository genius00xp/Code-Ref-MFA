---User Account Header


SELECT E.Employee_ID, E.Employee_Name, E.Email, E.Designation 
, E.Property_ID + ' ' + ISNULL(C.Property_Name,'') as Overseas_Mission, E.Active 
, E.Employee_ID AS _RecordID, E.Employee_Name  as _RecordTitle --,Grp.User_Group 
FROM vw_Employee E 
LEFT JOIN SYS_tblProperty C ON C.CoID=E.CoID AND C.Property_ID=E.Property_ID 
LEFT JOIN SYS_tblUserGroup as Grp ON E.CoID = Grp.CoID and E.groupID = Grp.GroupID 
WHERE E.CoID = '36'

---HQSQL
SELECT E.Employee_ID, E.Employee_Name, E.Email, E.Designation 
, E.Property_ID + ' ' + ISNULL(C.Property_Name,'') as Overseas_Mission, E.Active 
, E.Employee_ID AS _RecordID, E.Employee_Name  as _RecordTitle ,Grp.User_Group 
FROM vw_Employee E 
LEFT JOIN SYS_tblProperty C ON C.CoID=E.CoID AND C.Property_ID=E.Property_ID 
LEFT JOIN SYS_tblUserGroup as Grp ON E.CoID = Grp.CoID and E.groupID = Grp.GroupID 
WHERE E.CoID = '36'


--VitalSQL
SELECT E.Employee_ID, E.Employee_Name, E.Email, E.Designation 
, E.Property_ID + ' ' + ISNULL(C.Property_Name,'') as Overseas_Mission, E.Active 
, E.Employee_ID AS _RecordID, E.Employee_Name  as _RecordTitle,Grp.User_Group 
FROM vw_Employee E 
LEFT JOIN SYS_tblProperty C ON C.CoID=E.CoID AND C.Property_ID=E.Property_ID 
LEFT JOIN SYS_tblUserGroup as Grp ON E.CoID = Grp.CoID and E.groupID = Grp.GroupID 
 WHERE E.CoID = '36' and Grp.User_Group = 'Vital' 

 --MissionSQL -- include PropertyID filter
 SELECT E.Employee_ID, E.Employee_Name, E.Email, E.Designation 
, E.Property_ID + ' ' + ISNULL(C.Property_Name,'') as Overseas_Mission, E.Active 
 , E.Employee_ID AS _RecordID, E.Employee_Name  as _RecordTitle,Grp.User_Group ,E.Property_ID
 FROM vw_Employee E 
 LEFT JOIN SYS_tblProperty C ON C.CoID=E.CoID AND C.Property_ID=E.Property_ID 
 LEFT JOIN SYS_tblUserGroup as Grp ON E.CoID = Grp.CoID and E.groupID = Grp.GroupID 
 WHERE E.CoID = '36' and E.Property_ID = 'ABU' 
 and Grp.User_Group = 'Mission' 


 --------------------
 ---GETUSERTYPE
 select E.*,Grp.User_Group from vw_Users as E 
 left join SYS_tblUserGroup as Grp ON E.CoID = Grp.CoID and E.groupID = Grp.GroupID 
where E.UserID = 'HRS2016010003' and E.CoID  = '36' 


select * FROM SYS_tblUserGroup

select * From vw_Users

select distinct User_Group From SYS_tblUserGroup

--vw_Users
SELECT DISTINCT 
E.CoID, E.Employee_ID AS UserID, E.loginID, E.Employee_Name AS DisplayName, E.Employee_Name AS Initial, E.Email, '' AS Handphone, E.Active, 
CASE WHEN E.Active = 0 THEN 0 ELSE ISNULL(P.Account_Active, 1) END AS Account_Active, ISNULL(P.Password1, N'') AS Password1, P.Password2, P.Password3, 
P.Password4, P.Password5, P.Password6, P.Password7, P.Password8, P.Password9, P.Password10, P.ActivePassword, P.Must_Change, P.Last_Changed, 
P.Password_Sent, P.PersonalQuestion, P.PersonalAnswer, ISNULL(ISNULL(HR.GroupID, G.GroupID), 0) AS GroupID, ISNULL(HR.AccessAllProperty, 0) 
AS AccessAllProperty, E.Property_ID, E.Designation, 'NORMAL' AS UserType, E.Last_Updated_Date
FROM  dbo.vw_Employee_Master AS E 
LEFT OUTER JOIN dbo.HRS_Employee AS HR ON E.CoID = HR.CoID AND E.Employee_ID = HR.Employee_ID 
LEFT OUTER JOIN dbo.SYS_tblUserGroup AS G ON E.CoID = G.CoID AND G.DefaultAccessLevel = 1 
LEFT OUTER JOIN dbo.SYS_tblUserPassword AS P ON E.CoID = P.CoID AND E.Employee_ID = P.UserID

---vw_Employee_Master
SELECT DISTINCT CoID, Employee_ID, Name AS Employee_Name, Designation, DateJoin AS DATE_OF_HIRE, loginID, Email, Property_ID, Active, H_Tel
, Reference, GroupID, Financial_Limit, AccessAllProperty, Last_Updated_Date
FROM  dbo.HRS_Employee AS E

--vw_Officers
SELECT        CoID, LookupValue3 AS Officer_Role, LookupValue3 AS Role_Description, LookupValue1 AS Employee_ID, LookupValue2 AS Property_ID, LookupValue4 AS Active, 
                         LastUpdateBy, LastUpdateOn
FROM            dbo.SYS_tblLookup AS L
WHERE        (LookupID IN ('BudgetOfficer'))

--vw_Employee
SELECT        M.CoID, M.Employee_ID, M.Employee_Name, M.DATE_OF_HIRE, M.loginID, M.Email, M.Property_ID, M.Active, M.H_Tel, ISNULL(ED.Rank, 0) AS Rank, 
M.Designation, M.Reference, M.GroupID, CAST(M.Financial_Limit AS numeric(18, 2)) AS Financial_Limit, M.AccessAllProperty
FROM            
(
SELECT        E.CoID, E.Employee_ID, E.Employee_Name, E.DATE_OF_HIRE, E.loginID, E.Email, E.Property_ID, E.Active, E.H_Tel, E.Reference, E.GroupID, 
            E.Financial_Limit, E.AccessAllProperty, MIN(CAST(10000 + ISNULL(D.Rank, 0) AS varchar) + ' - ' + E.Designation) AS Rank, MIN(E.Designation) 
            AS Designation
FROM            dbo.vw_Employee_Master AS E LEFT OUTER JOIN
            dbo.vw_Employee_Designation AS D ON E.CoID = D.CoID AND E.Designation = D.Designation
GROUP BY E.CoID, E.Employee_ID, E.Employee_Name, E.DATE_OF_HIRE, E.loginID, E.Email, E.Property_ID, E.Active, E.H_Tel, E.Reference, E.GroupID, 
            E.Financial_Limit, E.AccessAllProperty) AS M LEFT OUTER JOIN
dbo.vw_Employee_Designation AS ED ON M.CoID = ED.CoID AND CAST(10000 + ED.Rank AS varchar) + ' - ' + ED.Designation = M.Rank
---------------------
--save table 

select * FROM  dbo.HRS_Employee 

select * from vw_Employee

select * from SYS_tblUserPassword


select * From SYS_tblUsers_Property

select * from SYS_tblLookup where LookupID = 'BudgetOfficer' and LookupValue1 = '00000009'



select * From HRS_Employee where Employee_ID  = '00000009'
select * From SYS_tblUsers_Property where UserID = '00000009'