----tblUsers_Property

---filter by CoID and UserID = EmployeeID

--DELETE tblUsers_Property where coid = '' and userid = ''


select * from SYS_tblUsers_Property


-------------------------------------
---UpdateOfficerDetails
--SYS_tblLookup , EmployeeID

--delete from Sys_tblLookup where coid = session_coid AND lookupID = 'BudgetOfficer' AND LookupValue1 = 'EmployeeID'
--if Default_User_Role == "" 
--add filter 
--IGNORE This part

select * from SYS_tblLookup where LookupID = 'BudgetOfficer'



select * from SYS_tblAuditLog 
Where Event_Detail = 'Update Employee - Overseas Mission Access'
order by ID desc

select * from MFA_FOMS_3T..SYS_tblAuditLog 
--Where Event_Detail = 'Update Employee'
order by ID desc


select * from MFA_FOMS..SYS_tblAuditLog 
--Where Event_Detail = 'Update Employee'
order by ID desc


select * from HRS_Employee where loginID = 'approver2'

select * From SYS_tblUserPassword where UserID = '00000273'
update SYS_tblUserPassword set Must_Change= 1
where userId = '00000273'

-------------

-- salutaion,address,postal,handphone,o_tel, userid

--userid 

--+		(ex.InnerException).InnerException	{"Violation of PRIMARY KEY constraint 'PK_OCCA_FIN_Employee'. 
--Cannot insert duplicate key in object 'dbo.HRS_Employee'. The duplicate key value is (36, HRS2016030001).
--\r\nThe statement has been terminated."}	System.Exception {System.Data.SqlClient.SqlException}

select * from HRS_Employee


select * from SYS_tblAuditLog
--where Event_Detail = 'Create Employee'
order by ID desc

