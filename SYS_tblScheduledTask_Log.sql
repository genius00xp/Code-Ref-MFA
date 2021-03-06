/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ID]
      ,[File_Run]
      ,[ScheduleTask]
  FROM [MFA_FOMS_3T].[dbo].[SYS_tblScheduledTask_Mapper]
  order by scheduleTask


  SELECT * From [MFA_FOMS_3T].[dbo].SYS_tblScheduledTask order by name

    ALTER TABLE [MFA_FOMS_3T].[dbo].SYS_tblScheduledTask ADD [ServerTimeZone] INT NOT NULL DEFAULT '-480'
  ALTER TABLE [MFA_FOMS_3T].[dbo].SYS_tblScheduledTask ADD [ClientTimeZone] INT NOT NULL DEFAULT '-480'

  SELECT TOP 20 * FROM SYS_tblScheduledTask_Log
  WHERE File_Run like '%budget%'
  ORDER BY Run_Date DESC

  update SYS_tblScheduledTask_Log
  set error = 1
  where ID = '70163'

   SELECT * From SYS_tblScheduledTask_Log order by Run_Date desc

      select * from  MFA_FOMS..SYS_tblScheduledTask_Log

      SELECT File_Run,Run_Date,Run_Status,Error,Completed_On into #templog1 from 
   MFA_FOMS..SYS_tblScheduledTask_Log

   select * from  MFA_FOMS..SYS_tblScheduledTask_Log
   select * from #templog1

   SELECT File_Run,Run_Date,Run_Status,Error,Completed_On into #templog from 
   SYS_tblScheduledTask_Log

   select * From #templog

insert into SYS_tblScheduledTask_Log
(File_Run,Run_Date,Run_Status,Error,Completed_On)
 (select File_Run,Run_Date,Run_Status,Error,Completed_On from #templog)
----------------------------------------------------------------

SELECT File_Run,Count(ScheduleTask) cnt
FROM [SYS_tblScheduledTask_Mapper]
Group by File_Run

SELECT * FROM [SYS_tblScheduledTask_Mapper]
order by file_RUn

delete from [SYS_tblScheduledTask_Mapper]
WHERE ID IN ('25','26','27','29','28','24')