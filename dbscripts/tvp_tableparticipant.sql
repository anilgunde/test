USE [db_adafsa_v2]
GO

/****** Object:  UserDefinedTableType [dbo].[TVP_tableparticipant]    Script Date: 25-11-2023 17:22:08 ******/
CREATE TYPE [dbo].[TVP_tableparticipant] AS TABLE(
	[participant_id] [bigint] NOT NULL,
	[household_id] [bigint] NULL,
	[participant_code] [varchar](max) NULL,
	[head_of_family] [bit] NULL,
	[first_name] [nvarchar](max) NULL,
	[family_name] [nvarchar](max) NULL,
	[dob] [date] NULL,
	[gender_id] [bigint] NULL,
	[marital_status_id] [bigint] NULL,
	[academic_level_id] [bigint] NULL,
	[occupation_id] [bigint] NULL,
	[created_id] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_id] [bigint] NULL,
	[updated_date] [datetime] NULL
)
GO


