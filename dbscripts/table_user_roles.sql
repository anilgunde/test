USE [db_adafsa_v2]
GO

/****** Object:  Table [dbo].[user_roles]    Script Date: 18-12-2023 22:39:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[user_roles](
	[user_id] [int] NULL,
	[role_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO

ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user_info] ([id])
GO


