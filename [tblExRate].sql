/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Code]
      ,[Date]
      ,[SGDperUnit]
      ,[UnitperSGD]
  FROM [MFA_FOMS_Exchange_Rate].[dbo].[tblExRate]
  
  
  select * into #tempExchangeRate from MFA_FOMS..FIN_Exchange_Rate
  
  select * from #tempExchangeRate order by ImportedDate desc

select * from _tblImportFile

select * from _tblCodes
