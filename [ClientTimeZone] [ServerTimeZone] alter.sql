----[ClientTimeZone] [ServerTimeZone] alter

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [MFA_FOMS_3T].[dbo].[FIN_Non_Bank_Account]
  WHERE Account_Number = '001-00000-100'


  ALTER TABLE [MFA_FOMS_3T].[dbo].[FIN_Non_Bank_Account] ADD [ServerTimeZone] INT NOT NULL DEFAULT '-480'
  ALTER TABLE [MFA_FOMS_3T].[dbo].[FIN_Non_Bank_Account] ADD [ClientTimeZone] INT NOT NULL DEFAULT '-480'



    ALTER TABLE [MFA_FOMS_3T].[dbo].SYS_tblUserGroup ADD [ServerTimeZone] INT NOT NULL DEFAULT '-480'
  ALTER TABLE [MFA_FOMS_3T].[dbo].SYS_tblUserGroup ADD [ClientTimeZone] INT NOT NULL DEFAULT '-480'

      ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Government_Agency ADD [ServerTimeZone] INT NOT NULL DEFAULT '-480'
  ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Government_Agency ADD [ClientTimeZone] INT NOT NULL DEFAULT '-480'

    ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Cheque_Book ADD [ServerTimeZone] INT NOT NULL DEFAULT '-480'
  ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Cheque_Book ADD [ClientTimeZone] INT NOT NULL DEFAULT '-480'

      ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Account_Setting ADD [ServerTimeZone] INT NOT NULL DEFAULT '-480'
  ALTER TABLE [MFA_FOMS_3T].[dbo].FIN_Account_Setting ADD [ClientTimeZone] INT NOT NULL DEFAULT '-480'