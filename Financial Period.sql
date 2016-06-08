---Financial Period

select * from MFA_FOMS..vw_Financial_Period

select * from MFA_FOMS_3T..vw_Financial_Period


SELECT        CoID, LookupValue1 AS [Day (dd)], LookupValue2 AS [Month (MMM)], LookupValue3 AS Window_Period, LookupValue4 AS Recoverable_Expenditure_Period, 
                         LookupValue5 AS Window_Period_From_Date, LookupValue6 AS Window_Period_To_Date, LastUpdateBy, LastUpdateOn
FROM            dbo.SYS_tblLookup
WHERE        (LookupID = 'FinancialStartingDate')


SELECT Period_Start_Day=[Day (dd)], Period_Start_Month=[Month (MMM)], Window_Period 
, Recoverable_Expenditure_Period, Window_Period_From_Date, Window_Period_To_Date, LastUpdateBy, LastUpdateOn 
 FROM [vw_Financial_Period] TBL 


 select * From SYS_tblLookup WHERE LookupID = 'FinancialStartingDate'

 select * From SYS_tblAuditLog Order by ID desc

  select * From SYS_tblAuditLog WHERE Event_Detail = 'Update Financial Period' order by ID desc

