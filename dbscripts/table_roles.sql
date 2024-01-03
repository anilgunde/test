USE [db_adafsa_v2]
GO

/****** Object:  Table [dbo].[roles]    Script Date: 18-12-2023 22:39:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [varchar](100) NOT NULL,
	[createdby] [varchar](15) NOT NULL,
	[createddate] [datetime] NULL,
	[updatedby] [varchar](15) NULL,
	[updateddate] [datetime] NULL,
 CONSTRAINT [PK_user_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


