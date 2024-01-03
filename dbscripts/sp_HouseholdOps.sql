USE [db_adafsa_v2]
GO

/****** Object:  StoredProcedure [dbo].[sp_HouseholdOps]    Script Date: 25-11-2023 17:18:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Shiva
-- Create date: 20-11-2023
-- Description:	Household_CRUDOperations
-- =============================================
CREATE PROCEDURE [dbo].[sp_HouseholdOps] (@tablehousehold TVP_tablehousehold readonly,@tableparticipant TVP_tableparticipant readonly,@StatementType NVARCHAR(20) = '',@id bigint=0) 
AS
BEGIN TRANSACTION
 IF @StatementType = 'Insert'
        BEGIN
   INSERT INTO household select 
      [family_code]
      ,[house_number]
      ,[building_name]
      ,[street_name]
      ,[city_name]
      ,[created_id]
      ,[created_date]
      ,[updated_id]
      ,[updated_date]
      ,[assigned_interviewer_id]
      ,[assigned_survey_id]
      ,[phone_number]
   from @tablehousehold ;
    Declare @householdid int = @@Identity
	--Print @householdid
   IF @@ERROR <> 0
BEGIN 
    ROLLBACK
    RETURN
END
CREATE TABLE #participant_temp_table (
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
 INSERT INTO #participant_temp_table select 
      [household_id]
      ,[participant_code]
      ,[head_of_family]
      ,[first_name]
      ,[family_name]
      ,[dob]
      ,[gender_id]
      ,[marital_status_id]
      ,[academic_level_id]
      ,[occupation_id]
      ,[created_id]
      ,[created_date]
      ,[updated_id]
      ,[updated_date]
 from @tableparticipant 
 UPDATE #participant_temp_table SET household_id=@householdid;
INSERT INTO participant select 
[household_id]
      ,[participant_code]
      ,[head_of_family]
      ,[first_name]
      ,[family_name]
      ,[dob]
      ,[gender_id]
      ,[marital_status_id]
      ,[academic_level_id]
      ,[occupation_id]
      ,[created_id]
      ,[created_date]
      ,[updated_id]
      ,[updated_date]
from #participant_temp_table
 DROP TABLE #participant_temp_table
 
IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END
END
 IF @StatementType = 'Update'
 BEGIN

  UPDATE household 
   Set family_code            =T.family_code
      ,house_number           =T.house_number
      ,building_name          =T.building_name
      ,street_name            =T.street_name
      ,city_name              =T.city_name
      ,created_id             =T.created_id
      ,created_date           =T.created_date
      ,updated_id             =T.updated_id
      ,updated_date           =T.updated_date
      ,assigned_interviewer_id=T.assigned_interviewer_id
      ,assigned_survey_id     =T.assigned_survey_id
      ,phone_number           =T.assigned_survey_id
  from household INNER JOIN @tablehousehold AS T ON T.household_id=household.household_id;
  IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END
  UPDATE participant
  Set household_id        =T.household_id
      ,participant_code   =T.participant_code
      ,head_of_family     =T.head_of_family
      ,first_name         =T.first_name
      ,family_name        =T.family_name
      ,dob                =T.dob
      ,gender_id          =T.gender_id
      ,marital_status_id  =T.marital_status_id
      ,academic_level_id  =T.academic_level_id
      ,occupation_id      =T.occupation_id
      ,created_id         =T.created_id
      ,created_date       =T.created_date
      ,updated_id         =T.updated_id
      ,updated_date       =T.updated_date
  
  from participant INNER JOIN @tableparticipant AS T ON T.household_id=participant.household_id and T.participant_id=participant.participant_id;
  IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END
END
IF @StatementType = 'Delete'
BEGIN
DELETE FROM participant WHERE household_id = @id

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END
DELETE FROM household WHERE household_id = @id
IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END
END
COMMIT

GO


