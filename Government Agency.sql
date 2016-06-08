----Government Agency

SELECT Agency_Code, Agency_Name, Phone as Telephone, Contact_Person, Active, ID 
FROM FIN_Government_Agency 
WHERE CoID='36'

select * from FIN_Government_Agency


select * From SYS_tblAuditLog
where Event_Detail = 'Delete Government Agency' order by ID desc


SELECT * FROM SYS_tblNumber WHERE CoID='36' AND FormatID='Agency'

select * from FIN_Cash_Book 
where coid = '36' AND Contact_Type = 'Agency'
AND Contact_Code = '' 

