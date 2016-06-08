----UserGroup

SELECT * FROM 
(
SELECT GroupName as Group_Name,Last_Updated_By,Last_Updated_On
,CAST (ISNULL(TBL1.AccessLevel,-1) AS int) as [Finance Setup]
,CAST (ISNULL(TBL2.AccessLevel,-1) AS int) as [Budget]
,CAST (ISNULL(TBL3.AccessLevel,-1) AS int) as [Main Module]
,CAST (ISNULL(TBL4.AccessLevel,-1) AS int) as [Administration]
--,TBL1.AccessLevel as [Finance Setup]
--,TBL2.AccessLevel as [Budget]
--,TBL3.AccessLevel as [Main Module]
--,TBL4.AccessLevel as [Administration]
,G.GroupID,G.DefaultAccessLevel 
FROM SYS_tblUserGroup G 
LEFT JOIN (SELECT CoID,GroupID,MAX(AccessLevel) as AccessLevel 
FROM SYS_tblUserGroupModules 
WHERE ModuleSection='Finance Setup' 
GROUP BY CoID,GroupID) TBL1 ON TBL1.CoID=G.CoID AND TBL1.GroupID=G.GroupID 
LEFT JOIN 
(
SELECT CoID,GroupID,MAX(AccessLevel) as AccessLevel 
FROM SYS_tblUserGroupModules 
WHERE ModuleSection='Budget' 
GROUP BY CoID,GroupID
) TBL2 ON TBL2.CoID=G.CoID AND TBL2.GroupID=G.GroupID 
LEFT JOIN 
(
SELECT CoID,GroupID,MAX(AccessLevel) as AccessLevel 
FROM SYS_tblUserGroupModules 
WHERE ModuleSection='Main Module' GROUP BY CoID,GroupID
) TBL3 ON TBL3.CoID=G.CoID AND TBL3.GroupID=G.GroupID 
LEFT JOIN 
(
SELECT CoID,GroupID,MAX(AccessLevel) as AccessLevel 
FROM SYS_tblUserGroupModules 
WHERE ModuleSection='Administration' GROUP BY CoID,GroupID
) TBL4 ON TBL4.CoID=G.CoID AND TBL4.GroupID=G.GroupID 
WHERE G.CoID='36' 
) TBL 
ORDER BY [Group_Name] ASC