---Lookuptable

--SELECT TOP 100 PERCENT E.*, '36' as CoID, U.GroupID, U.AccessAllProperty, U.Account_Active  , CONVERT(NVARCHAR,ISNULL(G.GroupID,0)) + ' - ' + ISNULL(G.GroupName,'[Default Group]') as Group_Name   , E.Property_ID,E.Property_ID + ' ' + ISNULL(C.Property_Name,'') as Property_Name  , CASE U.Account_Active WHEN 1 THEN 'Enabled' WHEN 0 THEN 'Disabled' WHEN 2 THEN 'Locked' END AS Account_Status  , ISNULL(O.Role_Description,'') AS Default_User_Role  , 'HRS_Employee' as [_TableName], U.Property_ID as DefaultProperty_ID  , TE.Last_Updated_By, TE.Last_Updated_Date AS Last_Updated_On  FROM vw_Employee E  LEFT JOIN SYS_tblProperty C ON E.CoID=C.CoID AND E.Property_ID=C.Property_ID  INNER JOIN vw_Users U ON CAST(U.CoID as nvarchar) = '36' AND U.UserID=E.Employee_ID  LEFT JOIN SYS_tblUserGroup G ON G.CoID=U.CoID AND G.GroupID=U.GroupID  LEFT JOIN HRS_Employee TE ON E.CoID=TE.CoID AND E.Employee_ID=TE.Employee_ID  LEFT JOIN vw_Officers O ON U.CoID=O.CoID AND U.Property_ID=O.Property_ID AND U.UserID=O.Employee_ID AND O.Active=CASE WHEN U.Account_Active=1 THEN 'Yes' ELSE O.Active END  WHERE E.CoID='36' AND E.Employee_ID='{QUERY_RECORDID}'

--SELECT User_Group FROM SYS_tblUserGroup WHERE CoID = '36' AND GroupID = '1'

--SELECT Parent_Property_ID FROM SYS_tblProperty WHERE CoID=36 AND Property_ID='ABU'

--SELECT Property_ID FROM SYS_tblProperty WHERE Parent_Property_ID = 'ABU' AND CoID = 36

--select E.*,Grp.User_Group from vw_Users as E left join SYS_tblUserGroup as Grp  ON E.CoID = Grp.CoID and E.groupID = Grp.GroupID  where E.UserID = 'HRS2016010001' and E.CoID  = '36' 

--SELECT TOP 100 PERCENT E.*, '36' as CoID, U.GroupID, U.AccessAllProperty, U.Account_Active  , CONVERT(NVARCHAR,ISNULL(G.GroupID,0)) + ' - ' + ISNULL(G.GroupName,'[Default Group]') as Group_Name   , E.Property_ID,E.Property_ID + ' ' + ISNULL(C.Property_Name,'') as Property_Name  , CASE U.Account_Active WHEN 1 THEN 'Enabled' WHEN 0 THEN 'Disabled' WHEN 2 THEN 'Locked' END AS Account_Status  , ISNULL(O.Role_Description,'') AS Default_User_Role  , 'HRS_Employee' as [_TableName], U.Property_ID as DefaultProperty_ID  , TE.Last_Updated_By, TE.Last_Updated_Date AS Last_Updated_On  FROM vw_Employee E  LEFT JOIN SYS_tblProperty C ON E.CoID=C.CoID AND E.Property_ID=C.Property_ID  INNER JOIN vw_Users U ON CAST(U.CoID as nvarchar) = '36' AND U.UserID=E.Employee_ID  LEFT JOIN SYS_tblUserGroup G ON G.CoID=U.CoID AND G.GroupID=U.GroupID  LEFT JOIN HRS_Employee TE ON E.CoID=TE.CoID AND E.Employee_ID=TE.Employee_ID  LEFT JOIN vw_Officers O ON U.CoID=O.CoID AND U.Property_ID=O.Property_ID AND U.UserID=O.Employee_ID AND O.Active=CASE WHEN U.Account_Active=1 THEN 'Yes' ELSE O.Active END  WHERE E.CoID='36' AND E.Employee_ID='{QUERY_RECORDID}'

--SELECT  TOP 100 PERCENT U.* , CAST(U.GroupID as nvarchar) + ' - ' + ISNULL(G.GroupName,'[Default Group]') as _GroupName, CAST(U.Property_ID as nvarchar) + ' - ' + ISNULL(P.Property_Name,'[Undefined Overseas Centre]') as _PropertyName, CASE WHEN U.GroupID =0 THEN S.GroupID ELSE U.GroupID END as _RecordID, ISNULL(G.GroupName,'[Default Group]') as _RecordTitle , User_Role=ISNULL(O.Role_Description,''), Old_User_Role= ISNULL(O.Role_Description,'')  , Old_Property_ID = U.Property_ID, Old_GroupID = U.GroupID, Old_Active = U.Active  , U.Last_Updated_By as Dtl_Last_Updated_By, U.Last_Updated_On as Dtl_Last_Updated_On  , 'SYS_tblUsers_Property' as [_TableName] FROM SYS_tblUsers_Property U  INNER JOIN vw_Users S ON S.CoID=U.CoID AND S.UserID=U.UserID LEFT JOIN SYS_tblUserGroup G ON G.CoID=U.CoID AND G.GroupID=U.GroupID LEFT JOIN SYS_tblProperty P ON U.CoID=P.CoID AND U.Property_ID=P.Property_ID  LEFT JOIN vw_Officers O ON U.CoID=O.CoID AND U.Property_ID=O.Property_ID AND U.UserID=O.Employee_ID  WHERE CAST(U.CoID as nvarchar) = '36' AND U.UserID='{QUERY_RECORDID}' ORDER BY P.Property_Name

--select E.*,Grp.User_Group from vw_Users as E left join SYS_tblUserGroup as Grp  ON E.CoID = Grp.CoID and E.groupID = Grp.GroupID  where E.UserID = 'HRS2016010001' and E.CoID  = '36' 


----WHEN user group is not belong to Mission   e.g : HQ

--GetUserPropertyList
SELECT P.Property_ID, R.AccessAllProperty  FROM SYS_tblProperty P  
INNER JOIN vw_Users R ON R.CoID=P.CoID AND R.UserID='HRS2016010001'  
WHERE P.CoID='36' AND P.Active=1  AND(  ( R.AccessAllProperty = 0 AND P.Property_ID=R.Property_ID AND R.Property_ID 
NOT IN ( SELECT Property_ID FROM SYS_tblUsers_Property WHERE CoID='36' AND UserID='HRS2016010001' AND Active=0 ) )      
OR ( R.AccessAllProperty = 0 AND P.Property_ID IN ( SELECT Property_ID FROM SYS_tblUsers_Property WHERE CoID='36' AND UserID='HRS2016010001' AND Active=1 ) )    
 OR ( R.AccessAllProperty = 1 AND P.Property_ID NOT IN ( SELECT Property_ID FROM SYS_tblUsers_Property WHERE CoID='36' AND UserID='HRS2016010001' AND Active=0 ) )     ) 

--Normal Property List
SELECT [Property_ID], [Property_Name] FROM SYS_tblProperty 
WHERE CoID = '36' AND (Property_Name LIKE '%%' OR Property_ID LIKE '%%') 
AND Property_ID IN ('ABU', 'BEJ', 'BKK', 'CHN', 'GNA', 'GUZ', 'LDN', 'MSO', 'NYK', 'OM1', 'OM2', 'OMM', 'OUT', 'qwe', 'SHA', 'SYD', 'TES', 'UN', 'wwe') 
 ORDER BY Property_ID

 --GetUserGroup   (01)
 SELECT User_Group FROM SYS_tblUserGroup WHERE CoID = '36' AND GroupID = '1'

 --02 (Overseas Mission) Option
 ---IF is MISSION - then readonly for this
 SELECT Property_Name  FROM SYS_tblProperty WHERE Property_ID='BEJ' AND CoID=36
 --SHOW BEJ Mission Singapore Beijing

 ---------------------
--HasSiblingProperty

SELECT * FROM SYS_tblProperty WHERE CoID=36 AND Property_ID='ABU'
--1st step
SELECT Parent_Property_ID FROM SYS_tblProperty WHERE CoID=36 AND Property_ID='ABU'

--2nd step 
SELECT Property_ID  FROM SYS_tblProperty WHERE Parent_Property_ID='ABU' AND CoID=36


----------------------------------------------

---IF Usergroup == (Vital or HW ) OR HasSiblingProperty = True
----2ndtab = true

select * From SYS_tblUserGroup G
INNER JOIN vw_Users U on u.coid = g.coid  AND g.GroupID = u.GroupID
WHERE u.UserID = 'HRS2016010001'

------------------------------------------
---INSIDE SiblingandParentPropertyList

---PropertyID = session PropertyID   // GUZ
--ParentPropertyID = PropertyID

--		sqlstr	"
SELECT Property_ID FROM SYS_tblProperty WHERE CoID=36 AND (Property_ID='GUZ' OR Parent_Property_ID='GUZ' )


--if ParentPropertID <> ""
--SQL = SQL + Parent_Property_ID = ParentPropertyID or Property_ID = ParentPropertyID

--		sqlstr	"
SELECT Property_ID FROM SYS_tblProperty WHERE CoID=36 
AND (Property_ID='GUZ' OR Parent_Property_ID='GUZ'  
OR Parent_Property_ID='BEJ' OR Property_ID='BEJ')

---		SelectCommand	"
SELECT [Property_ID] AS [Mission Code], [Property_Name] AS [Mission Name] FROM SYS_tblProperty 
WHERE CoID = 36 AND (Property_Name LIKE '%%' OR Property_ID LIKE '%%') 
AND Property_ID IN 
(
SELECT Property_ID FROM SYS_tblProperty WHERE CoID=36 
AND (Property_ID='GUZ' OR Parent_Property_ID='GUZ'  OR Parent_Property_ID='BEJ' OR Property_ID='BEJ' )
)
 AND Property_ID<>'GUZ'

--------------------------------------------

---GetParentPropertyID

select Property_ID FROM SYS_tblProperty 
WHERE Property_ID = (select Parent_Property_ID From SYS_tblProperty WHERE Property_ID = 'GUZ' AND CoID = 36)
AND CoID = 36

select * From SYS_tblProperty where Property_ID = 'GUZ'



SELECT Property_ID FROM SYS_tblProperty WHERE CoID=36 
AND (Property_ID='ABU' OR Parent_Property_ID='ABU'  
OR Parent_Property_ID='' OR Property_ID='')


