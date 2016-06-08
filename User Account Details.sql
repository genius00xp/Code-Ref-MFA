-----User Account Details

--		(1)	"
SELECT TOP 100 PERCENT E.*, '36' as CoID
, U.GroupID
, U.AccessAllProperty
, U.Account_Active  
, CONVERT(NVARCHAR,ISNULL(G.GroupID,0)) + ' - ' + ISNULL(G.GroupName,'[Default Group]') as Group_Name   
, E.Property_ID
,E.Property_ID + ' ' + ISNULL(C.Property_Name,'') as Property_Name  
, CASE U.Account_Active WHEN 1 THEN 'Enabled' WHEN 0 THEN 'Disabled' WHEN 2 THEN 'Locked' END AS Account_Status  
, ISNULL(O.Role_Description,'') AS Default_User_Role  
, 'HRS_Employee' as [_TableName]
, U.Property_ID as DefaultProperty_ID  
, TE.Last_Updated_By
, TE.Last_Updated_Date AS Last_Updated_On  
FROM vw_Employee E  
LEFT JOIN SYS_tblProperty C ON E.CoID=C.CoID AND E.Property_ID=C.Property_ID  
INNER JOIN vw_Users U ON CAST(U.CoID as nvarchar) = '36' AND U.UserID=E.Employee_ID  
LEFT JOIN SYS_tblUserGroup G ON G.CoID=U.CoID AND G.GroupID=U.GroupID  
LEFT JOIN HRS_Employee TE ON E.CoID=TE.CoID AND E.Employee_ID=TE.Employee_ID  
LEFT JOIN vw_Officers O ON U.CoID=O.CoID AND U.Property_ID=O.Property_ID AND U.UserID=O.Employee_ID 
AND O.Active=CASE WHEN U.Account_Active=1 THEN 'Yes' ELSE O.Active END  
WHERE E.CoID='36' AND E.Employee_ID='HRS2013090002'


--		(2)	"
SELECT  TOP 100 PERCENT U.* , CAST(U.GroupID as nvarchar) + ' - ' + ISNULL(G.GroupName,'[Default Group]') as _GroupName
, CAST(U.Property_ID as nvarchar) + ' - ' + ISNULL(P.Property_Name,'[Undefined Overseas Centre]') as _PropertyName
, CASE WHEN U.GroupID =0 THEN S.GroupID ELSE U.GroupID END as _RecordID, ISNULL(G.GroupName,'[Default Group]') as _RecordTitle 
, User_Role=ISNULL(O.Role_Description,''), Old_User_Role= ISNULL(O.Role_Description,'')  , Old_Property_ID = U.Property_ID, Old_GroupID = U.GroupID
, Old_Active = U.Active  , U.Last_Updated_By as Dtl_Last_Updated_By, U.Last_Updated_On as Dtl_Last_Updated_On  
, 'SYS_tblUsers_Property' as [_TableName]
 FROM SYS_tblUsers_Property U  
INNER JOIN vw_Users S ON S.CoID=U.CoID AND S.UserID=U.UserID 
LEFT JOIN SYS_tblUserGroup G ON G.CoID=U.CoID AND G.GroupID=U.GroupID 
LEFT JOIN SYS_tblProperty P ON U.CoID=P.CoID AND U.Property_ID=P.Property_ID  
LEFT JOIN vw_Officers O ON U.CoID=O.CoID AND U.Property_ID=O.Property_ID AND U.UserID=O.Employee_ID  
WHERE CAST(U.CoID as nvarchar) = '36' AND U.UserID='00000010' ORDER BY P.Property_Name


-----------------------------

--select * from MFA_FOMS_3T..SYS_tblAuditLog 
--where recordID = '00000009'
--order by ID desc

--select * from SYS_tblAuditLog 
--where recordID = '00000009'
--order by ID desc

SELECT * FROM 
(SELECT DATEADD(n,Server_TimeZone-(-480),A.Event_Date) as Client_Time,Client_GMT as Time_Zone, A.UserName as User_Name
, replace(A.Event_Detail,' Employee','') as Event_Detail, A.Old_Value as Value_Before_Update, A.New_Value as Value_After_Update
, A.Event_Detail + ' : ' + A.Document_Ref as _RecordTitle, A.ID AS _RecordID 
FROM SYS_tblAuditLog A WHERE CoID=N'36' AND RecordID='00000009' AND Document_Ref<>'' 
AND Event_Type='Finance' AND Event_Detail LIKE Document_Action + ' Employee%' 
AND [Property_ID] IN ('',N'')) TBL

-----------

select E.*,Grp.User_Group from vw_Users as E 
left join SYS_tblUserGroup as Grp  ON E.CoID = Grp.CoID and E.groupID = Grp.GroupID  
where E.UserID = '00000009' and E.CoID  = '36' 

---------------------------------------------

--select * From vw_Employee e where e.coid = '36'

--select * From SYS_tblProperty c where c.CoID = '36'

--select * from vw_Users u where u.coid = '36'

--select * from Sys_TblUserGroup g where g.coid ='36'

--select * from vW_Officers o where o.coid = '36'

---------------------------------------------------------------
----UpdateRecord -- 
--table name = HRS_Employee    
--filter = CoID = session coid , employeeID = employeee_ID
--if employeeID = '' then employeeID = find employeeID inside form


--COID
--EmployeeID = employeeID
--if Employee_ID = "" then systemScript get next number

--loginID
--Name
--Designation
--Email
--HTEl
--PropertyID 
--GroupID
--GroupName
--Active
--Reference
--Financial Limit
---AccessAllProperty
--LastUpdatedBy
--LastuPdatedDate

--
select * from HRS_Employee

select * from MFA_FOMS..HRS_Employee where Employee_ID = 'HRS2016030001'


select * From SYS_tblAuditLog 
where RecordID = '00000010'
order by ID desc


select * From MFA_FOMS..SYS_tblAuditLog 
order by ID desc


--------------------------------------------
--table name = SYS_tblUserPassword 
--filter = CoID = session coid, UserID = employee_ID


