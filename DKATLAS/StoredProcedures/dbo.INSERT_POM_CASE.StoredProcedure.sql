USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_POM_CASE]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_POM_CASE]
	@pom_id AS NVARCHAR(50),
	@case_id AS NVARCHAR(50),
	@User_Id as varchar(50)
AS
BEGIN
		DELETE FROM TBLPOMCASE WHERE CASE_ID=@case_id
		INSERT INTO TBLPOMCASE
		(
			pom_id,
			case_id
		)
		VALUES
		(
			@pom_id,
			@case_id
		)
		
		UPDATE TBLCASE SET STATUS='POM GENERATED' WHERE CASE_ID=@case_id
		
		DECLARE @DESC AS VARCHAR(MAX)
		set @DESC = 'Status changed to POM GENERATED'       
		exec LCJ_AddNotes @case_id=@case_id,@Notes_Type='Activity',@Ndesc = @DESC,@user_Id=@User_Id,@ApplyToGroup = 0        

END
GO
