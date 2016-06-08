----Master Report Setup

----
SELECT LookupValue1 as NoOfDays, LastUpdateBy, LastUpdateOn 
FROM SYS_tbllookup WHERE LookupID = 'MasterReportSetup'


select * from SYS_tbllookup WHERE LookupID = 'MasterReportSetup'


----------
--audit log

select * from SYS_tblAuditLog
where coid = '36' --and Property_ID = ''
and RecordID = 'Master Report Setup' and Document_Ref <> ''
order by ID Desc