----UserAccount Lookup

--
SELECT LookupValue1 AS [Mailers Recipient Group], LookupValue2 AS [Mailers Recipient Category] 
FROM SYS_tblLookup  WHERE LookupID = 'UserType' AND (LookupValue1 LIKE '%%' OR LookupValue2 LIKE '%%') 
ORDER BY LookupValue1

SELECT *
FROM SYS_tblLookup  WHERE LookupID = 'EmployeeDesignation' AND (LookupValue1 LIKE '%%' OR LookupValue2 LIKE '%%') 
ORDER BY LookupValue1


SELECT [Property_ID], [Property_Name] FROM SYS_tblProperty WHERE CoID = '36' 
AND (Property_Name LIKE '%%' OR Property_ID LIKE '%%') 
AND Property_ID IN ('ABU', 'BEJ', 'BKK', 'CHN', 'GNA', 'GUZ', 'LDN', 'MSO', 'NYK', 'OM1', 'OM2', 'OMM', 'OUT', 'qwe', 'SHA', 'SYD', 'TES', 'UN', 'wwe')  
ORDER BY Property_ID


--
SELECT User_Group FROM SYS_tblUserGroup WHERE CoID = '36' AND GroupID = '1'

-------------------------------------------------------
----UserGroup Lookup
SELECT GroupID, GroupName as Name FROM SYS_tblUserGroup WHERE CoID = '36' AND GroupName LIKE '%%' ORDER BY DefaultAccessLevel DESC,GroupID

---if LoginUserGroup <> 'HQ'
---sql + AND userGroup = 'loginusergroup'


--------------------------------------------------------------

select * FROM  SYS_tblUserGroup

select * From vw_Users

--
SELECT User_Group FROM SYS_tblUserGroup WHERE CoID = '36' AND GroupID = '1'

--
SELECT [Property_ID], [Property_Name] FROM SYS_tblProperty 
WHERE CoID = '36' 
AND Property_ID IN ('ABU')  ORDER BY Property_ID

select * from vw_Users

select * from MFA_FOMS_3T..vw_Users

--
SELECT P.Property_ID, R.AccessAllProperty  FROM SYS_tblProperty P  INNER JOIN vw_Users R ON R.CoID=P.CoID AND R.UserID='HRS2016010001'  
WHERE P.CoID='36' AND P.Active=1  AND(  ( R.AccessAllProperty = 0 AND P.Property_ID=R.Property_ID AND R.Property_ID 
NOT IN ( SELECT Property_ID FROM SYS_tblUsers_Property WHERE CoID='36' AND UserID='HRS2016010001' AND Active=0 ) )     
 OR ( R.AccessAllProperty = 0 AND P.Property_ID IN ( SELECT Property_ID FROM SYS_tblUsers_Property WHERE CoID='36' AND UserID='HRS2016010001' AND Active=1 ) )     
 OR ( R.AccessAllProperty = 1 AND P.Property_ID NOT IN ( SELECT Property_ID FROM SYS_tblUsers_Property WHERE CoID='36' AND UserID='HRS2016010001' AND Active=0 ) )     ) 


 SELECT P.Property_ID, R.AccessAllProperty  FROM SYS_tblProperty P  INNER JOIN vw_Users R ON R.CoID=P.CoID AND R.UserID='HRS2016010004'  
WHERE P.CoID='36' AND P.Active=1  AND(  ( R.AccessAllProperty = 0 AND P.Property_ID=R.Property_ID AND R.Property_ID 
NOT IN ( SELECT Property_ID FROM SYS_tblUsers_Property WHERE CoID='36' AND UserID='HRS2016010004' AND Active=0 ) )     
 OR ( R.AccessAllProperty = 0 AND P.Property_ID IN ( SELECT Property_ID FROM SYS_tblUsers_Property WHERE CoID='36' AND UserID='HRS2016010004' AND Active=1 ) )     
 OR ( R.AccessAllProperty = 1 AND P.Property_ID NOT IN ( SELECT Property_ID FROM SYS_tblUsers_Property WHERE CoID='36' AND UserID='HRS2016010004' AND Active=0 ) )     ) 
 -------------------------------

 select * from MFA_FOMS..HRS_Employee where Employee_ID = '00001321'
 select * from MFA_FOMS..SYS_tblUsers_Property where UserID = '00001321'
  select * from SYS_tblLookup where LookupID = 'BudgetOfficer' AND LookupValue1 = '00001321' 

 select * from MFA_FOMS..SYS_tblUserGroup
 update  MFA_FOMS..SYS_tblUserGroup 
 set User_Group = 'HQ'
 where ID = 230

   select * from HRS_Employee where Employee_ID = 'HRS2016030002'
 select * from SYS_tblUsers_Property where UserID = 'HRS2016030002'
 select * from SYS_tblUserPassword where UserID = 'HRS2016030002'
 select * from SYS_tblLookup where LookupID = 'BudgetOfficer' AND LookupValue1 = 'HRS2016030002' 


  select * from HRS_Employee where Employee_ID = 'HRS2016030003'
 select * from SYS_tblUsers_Property where UserID = 'HRS2016030003'
 select * from SYS_tblUserPassword where UserID = 'HRS2016030003'
 select * from SYS_tblLookup where LookupID = 'BudgetOfficer' AND LookupValue1 = 'HRS2016030003' 


   select * from HRS_Employee where Employee_ID = 'HRS2016030004'
 select * from SYS_tblUsers_Property where UserID = 'HRS2016030004'
 select * from SYS_tblUserPassword where UserID = 'HRS2016030004'
 select * from SYS_tblLookup where LookupID = 'BudgetOfficer' AND LookupValue1 = 'HRS2016030004' 

 
 select * from MFA_FOMS_3T..SYS_tblUserGroup
 update  MFA_FOMS_3T..SYS_tblUserGroup 
 set User_Group = 'HQ'
 where ID = 230


 select * From SYS_tblProperty
