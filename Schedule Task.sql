---Schedule Task


SELECT  Name, Total_Minute as Schedule, Last_Run, Active, LastUpdateBy as Updated_By, LastUpdateOn as Updated_On, Start_Time,ID
FROM  SYS_tblScheduledTask

SELECT * From SYS_tblScheduledTask order by Total_Minute desc

SELECT * From MFA_FOMS..SYS_tblScheduledTask order by name


SELECT  Name, Total_Minute as Schedule, Last_Run, Active, LastUpdateBy as Updated_By, LastUpdateOn as Updated_On, Start_Time,ID
FROM  MFA_FOMS..SYS_tblScheduledTask
order by Name

SELECT * into #temptable From SYS_tblScheduledTask
WHERE Name = 'AutoRejectPaymentAfterFYTask'

select * from #temptable
drop table #temptable

insert into SYS_tblScheduledTask
(Name,Total_Minute,Start_Time,Last_Run,Status,LastUpdateBy,LastUpdateOn,Active,File_Run)
 (select Name,Total_Minute,Start_Time,Last_Run,Status,LastUpdateBy,LastUpdateOn,Active,File_Run from #temptable)


 SELECT * From SYS_tblScheduledTask order by name