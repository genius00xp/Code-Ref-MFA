/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [CoID]
      ,[ModuleSection]
      ,[ModuleID]
      ,[SortOrder]
      ,[ParentModuleID]
      ,[ModuleName]
      ,[ModuleLevel]
      ,[RoutingPath]
      ,[Target]
      ,[ModuleImage]
      ,[ParentRoutingPath]
      ,[ID]
  FROM [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]


  Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/MFABank/MFABank_Listing'
  WHERE ModuleName = 'MFA Bank Accounts'

    Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/NonMFABank/NonMFABank_Listing'
  WHERE ModuleName = 'Non-MFA Bank Accounts'

      Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'Administration/Application/ScheduledTasks_Listing'
  WHERE ModuleName = 'Scheduled Tasks'

        Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'Administration/Application/ScheduledTasksLog_Listing'
  WHERE ModuleName = 'Scheduled Tasks Log'

          Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'Administration/AuditLog/AuditLog_Listing'
  WHERE ModuleName = 'Audit Log'

            Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'Administration/Application/RecordLocked_Listing'
  WHERE ModuleName = 'Record Locked'

             Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'Administration/UserGroup/UserGroup_Listing'
  WHERE ModuleName = 'User Groups'


               Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'Administration/ExchangeRate/ExchangeRateHistory_Listing'
  WHERE ModuleName = 'Exchange Rate History'


                Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/FinancialPeriod/FinancialPeriod_Forms'
  WHERE ModuleName = 'Financial Period'


                  Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/OverseaMission/NumberingPrefix_Forms'
  WHERE ModuleName = 'Numbering Prefix Update'


                    Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/OverseaMission/PropertyUpdate_Forms'
  WHERE ModuleName = 'Overseas Mission Update'


                      Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/GovernmentAgency/GovernmentAgency_Listing'
  WHERE ModuleName = 'Government Agencies' AND ModuleID = '1720'


                        Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/GovernmentAgency/GovernmentAgency_Forms'
  WHERE ModuleName = 'New Government Agency' AND ModuleID = '1710'


                          Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/ChequeBook/ChequeBook_Listing'
  WHERE ModuleName = 'Cheque Book' AND ModuleID = '1530'


                            Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/CashAccounts/CashAccounts_Forms'
  WHERE ModuleName = 'Cash Accounts' AND ModuleID = '1170'

                              Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'FinanceSetup/MasterReportSetup/MasterReportSetup_Forms'
  WHERE ModuleName = 'Master Report Setup' AND ModuleID = '3120'


                                Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'Administration/UserAccount/UserAccount_Listing'
  WHERE ModuleName = 'User Accounts' AND ModuleID = '3200'

                                 Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'Administration/UserAccount/UserAccount_Forms'
  WHERE ModuleName = 'New User' AND ModuleID = '3100'
  
                                 Update [MFA_FOMS_3T].[dbo].[MVCRoutingPathLeftModule]
  SET routingPath = 'Budget/HQControlledVote/HQControlledVote_Listing'
  WHERE ModuleName = 'HQ-Controlled Votes' AND ModuleID = '8220'