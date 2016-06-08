----Numbering Prefix_OverseasMission Update

SELECT * FROM SYS_tblProperty WHERE CoID='36' AND Property_ID='ABU'


SELECT Property_ID + ':' + Property_Title AS Property
,Parent_Property_ID FROM SYS_tblProperty 
WHERE CoID='36' AND Property_ID = N'ABU' 

select Property_ID from SYS_tblProperty where Parent_Property_ID = 'ABU'

--update SYS_tblProperty set Parent_Property_ID = ''
--WHERE ID = '180'


select * from SYS_tblAuditLog where Event_Detail = 'Update Overseas Mission Update' ORDER BY ID DESC

select * from SYS_tblAuditLog order by ID desc

select * from MFA_FOMS..SYS_tblAuditLog order by ID desc

SELECT * FROM SYS_tblProperty WHERE CoID='36' AND Property_ID='ABU'

---BUDGET CURRENCY
SELECT Budget_Currency ,Default_Currency ,Active_Currency as Active 
from SYS_tblProperty_Budget_Currency  WHERE Property_ID='ABU'
AND CoID='36'


--OPERATING CURRENCY
SELECT Operating_Currency,IP_File_Currency,Active_Operating_Curr as [Active],Imprest_Amount,Imprest_Currency 
from SYS_tblProperty_Operate_Currency  WHERE Property_ID='ABU'
AND CoID='36'


--city
SELECT [City] FROM (SELECT LookupValue1 AS [City], LookupValue2 AS [Country],ID,LastUpdateBy,LastUpdateOn 
FROM [MFA_FOMS].dbo.SYS_tblLookup WHERE LookupID=N'City' AND CoID='36'
) TBL 


SELECT * FROM (SELECT LookupValue1 AS [City], LookupValue2 AS [Country],ID,LastUpdateBy,LastUpdateOn 
FROM dbo.SYS_tblLookup WHERE LookupID=N'City' AND CoID='36'
) TBL 
WHERE Country = 'United Arab Emirates'


select * from SYS_tblAuditLog where Event_Detail = 'Update Overseas Mission Update' ORDER BY ID DESC

select * from SYS_tblAuditLog Order by ID desc