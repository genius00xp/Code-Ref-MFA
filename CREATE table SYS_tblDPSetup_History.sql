--CREATE table SYS_tblDPSetup_History

USE [MFA_FOMS_3T]
GO

/****** Object:  Table [dbo].[SYS_tblDPSetup_History]    Script Date: 25/1/2016 1:46:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SYS_tblDPSetup_History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CoID] [nvarchar](20) NOT NULL,
	[Account_Code] [nvarchar](20) NOT NULL,
	[Decimal_Place] [int] NULL,
	[DP_Effective_Date] [datetime] NULL,
	[Last_Updated_By] [nvarchar](300) NOT NULL,
	[Last_Updated_On] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


