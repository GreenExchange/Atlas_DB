USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Task_Mark_Competed]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Task_Mark_Competed]
	@s_a_Task_ID varchar(1000),
	@s_a_DomainID varchar(50),
	@i_a_User_ID int
AS
BEGIN
	    Declare @Task_Status_ID int = (Select Task_Status_ID from Task_Status where LTRIM(RTRIM(lower(Description)))='completed')

        Update Task 
		SET Task_Status_ID = @Task_Status_ID
			, RevisedDate = GetDate()
			, Revised_User_ID = @s_a_Task_ID
			, Completed_Date = GetDate()
			, Completed_By_User = @i_a_User_ID
		Where Task_ID IN (SELECT s FROM dbo.SplitString(@s_a_Task_ID, ',')) and DomainID = @s_a_DomainID
		AND Completed_Date is null
END
GO
