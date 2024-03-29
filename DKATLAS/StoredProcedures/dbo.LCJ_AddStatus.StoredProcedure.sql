USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddStatus]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddStatus]
(

@Status_Type			nvarchar(100),
@Status_Description		nvarchar(100),
@Status_Hierarchy		int,
@Final_Status			nvarchar(100),
@IsActive				nvarchar(10),
@forum				NVARCHAR(50),
@FILED_UNFILED NVARCHAR(50),
@hierarchy_Id			INT


)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblStatus
		(
		Status_Type,
		Status_Abr,
		Status_Description,
		Status_Hierarchy,
		Final_Status,
		IsActive,
		forum,
	  Filed_Unfiled,
		hierarchy_Id
		)

		VALUES(
		@Status_Type,
		@Status_Type,
		@Status_Description,
		@Status_Hierarchy,
		@Final_Status,
		@IsActive,
		@forum,		
		@FILED_UNFILED,	
		@hierarchy_Id	
		)					

		COMMIT TRAN

	END

END
GO
