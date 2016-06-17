---INSERT INTO [dbo].[SYS_tblLookup]_02

USE [MFA_FOMS]
GO

INSERT INTO [dbo].[SYS_tblLookup]
           ([CoID]
           ,[LookupID]
           ,[LookupValue1]
           ,[LookupValue2]
           ,[LookupValue3]
           ,[LookupValue4]
           ,[LookupValue5]
           ,[LookupValue6]
           ,[LookupValue7]
           ,[LookupValue8]
           ,[LookupValue9]
           ,[LookupValue10]
           ,[LastUpdateBy]
           ,[LastUpdateOn])
     VALUES
           (
		   ''
           ,'AppKey'
           ,'SFTPUserName'
           ,'IBASE\hong-guan.chuah'
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,'support'
           ,GETDATE()
		   )
GO


