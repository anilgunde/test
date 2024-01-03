USE [db_adafsa_v2]
GO

/****** Object:  UserDefinedTableType [dbo].[TVP_tablehousehold]    Script Date: 25-11-2023 17:21:21 ******/
CREATE TYPE [dbo].[TVP_tablehousehold] AS TABLE(
	[household_id] [bigint] NOT NULL,
	[family_code] [varchar](max) NULL,
	[house_number] [varchar](max) NULL,
	[building_name] [varchar](max) NULL,
	[street_name] [varchar](max) NULL,
	[city_name] [varchar](max) NULL,
	[created_id] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_id] [bigint] NULL,
	[updated_date] [datetime] NULL,
	[assigned_interviewer_id] [int] NULL,
	[assigned_survey_id] [int] NULL,
	[phone_number] [varchar](15) NULL
)
GO


