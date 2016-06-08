---SYS_tblUserGroup

select * FROM SYS_tblUserGroup G where groupID = '1'

select * from SYS_tblUserGroupModules  order by ID desc

select * from vw_Users 
WHERE CoID = '36' AND GroupID = '1'

SELECT * FROM SYS_tblUserGroup WHERE CoID='36' AND GroupID=1

select distinct u.GroupID,u.GroupName,u.User_Group,max(accesslevel) from SYS_tblUserGroup u
INNER JOIN SYS_tblUserGroupModules ugm on  u.GroupID = ugm.GroupID
group by u.GroupID,u.GroupName,u.User_Group

select distinct accesslevel from SYS_tblUserGroupModules 

-------------------------------------------------
select * FROM SYS_tblUserGroup G where groupID = '1'

select distinct User_Group from SYS_tblUserGroup

SELECT ModuleSection, SortOrder FROM SYS_tblModuleSections 
WHERE coid= N'36' ORDER BY SortOrder


SELECT M.ModuleID, M.ModuleName, ISNULL(A.AccessLevel, '-1') AS AccessLevel, M.ParentModuleID, M.ModuleLevel ,M.ModuleSection
FROM SYS_tblModules M 
LEFT OUTER JOIN 
(SELECT CoID, ModuleSection, ModuleID, AccessLevel  
FROM SYS_tblUserGroupModules
 WHERE (SYS_tblUserGroupModules.GroupID = '3')
 ) A 
ON M.ModuleID = A.ModuleID AND M.ModuleSection = A.ModuleSection and M.CoID=A.CoID 
WHERE (M.ModuleSection = 'Finance Setup') AND (M.CoID = '36') 
ORDER BY M.ModuleID,M.ModuleName

SELECT ModuleSection, SortOrder FROM SYS_tblModuleSections WHERE coid= N'36' ORDER BY SortOrder

SELECT GroupName as Group_Name, DefaultAccessLevel AS Default_Access, GroupID, User_Group, Last_Updated_By,Last_Updated_On, ID 
FROM SYS_tblUserGroup WHERE CoID='36' AND GroupID=''


--select * from SYS_tblModules where ModuleSection = 'Finance Setup' and CoId = '36' order by SortOrder
--select * from SYS_tblUserGroupModules where groupID = '1' and ModuleSection = 'Finance Setup'

select * from SYS_tblModules where ModuleSection = 'Finance Setup' and CoId = '36' AND ModuleID = '1000' order by SortOrder
select * from SYS_tblUserGroupModules --where groupID = '3' and ModuleSection = 'Finance Setup' and ModuleID = '1000'

select distinct ModuleSection FROM SYS_tblModules



select tbm.*,tbg.AccessLevel from
SYS_tblModules tbm
left join SYS_tblUserGroupModules tbg
ON tbm.ModuleID = tbg.ModuleID AND tbm.ModuleSection = tbg.ModuleSection AND tbm.CoID = tbg.CoID
WHERE tbm.ModuleSection = 'Finance Setup' and tbm.coID = '36' AND tbg.GroupID = '3'
-----------------------------------------------------------------
select tbm.*,tbg.AccessLevel from
SYS_tblModules tbm
left join SYS_tblUserGroupModules tbg
ON tbm.ModuleID = tbg.ModuleID AND tbm.ModuleSection = tbg.ModuleSection AND tbm.CoID = tbg.CoID
where tbg.GroupID = '3'


SELECT M.ModuleID, M.ModuleName, A.AccessLevel AS AccessLevelNULL, ISNULL(A.AccessLevel, '-1') AS AccessLevel, M.ParentModuleID, M.ModuleLevel ,M.ModuleSection
FROM SYS_tblModules M 
LEFT OUTER JOIN 
(SELECT CoID, ModuleSection, ModuleID, AccessLevel  
FROM SYS_tblUserGroupModules
 WHERE (SYS_tblUserGroupModules.GroupID = '3')
 ) A 
ON M.ModuleID = A.ModuleID AND M.ModuleSection = A.ModuleSection and M.CoID=A.CoID 
--WHERE (M.ModuleSection = 'Finance Setup') AND (M.CoID = '36') 
ORDER BY m.ModuleSection,M.ModuleID,M.ModuleName
--------------------------------------------------------------


select * from SYS_tblModules where ModuleSection = 'Main Module' and CoId = '36' AND ModuleID = '1000' order by SortOrder
select * from SYS_tblUserGroupModules where groupID = '1' and ModuleSection = 'Main Module' and ModuleID = '1000'

select tbm.*,tbg.AccessLevel from
SYS_tblModules tbm
left join SYS_tblUserGroupModules tbg
ON tbm.ModuleID = tbg.ModuleID AND tbm.ModuleSection = tbg.ModuleSection AND tbm.CoID = tbg.CoID
WHERE tbm.ModuleSection = 'Finance Setup' and tbm.coID = '36' AND tbg.GroupID = '1'


select * from SYS_tblModules order by ModuleID desc

select * From SYS_tblUserGroupModules order by GroupID,ModuleID

select * From SYS_tblUserGroupModules


select * into #tempUserGroupModule from SYS_tblUserGroupModules


select * from #tempUserGroupModule

insert into MFA_FOMS_3T..SYS_tblUserGroupModules
(CoID, GroupID, ModuleID, AccessLevel, ModuleSection)
 (select CoID, GroupID, ModuleID, AccessLevel, ModuleSection  from #tempUserGroupModule
 where GroupID = 1)

 -------
 
 Select * from SYS_tblAuditLog 
 where cast(Old_Value as nvarchar) <> ''
 order by Event_Date Desc

   Select * from SYS_tblAuditLog WHERE Event_Detail LIKE '%Delete User Group%'
   and recordID = '3' and CoID = '36' and Document_Ref <> ''
   order by Event_Date desc

  Select * from SYS_tblAuditLog order by Event_Date Desc

  select  * from AuditLog order by EventDate desc

  select * from AuditLogDetail order by ID desc

