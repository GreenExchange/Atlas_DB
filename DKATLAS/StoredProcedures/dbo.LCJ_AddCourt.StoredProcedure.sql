USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddCourt]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AddCourt]
(

			@Court_Name nvarchar(100),
			@Court_Venue nvarchar(100),
			@Court_Address nvarchar(100),
			@Court_Basis nvarchar(100),
			@Court_Misc nvarchar(100)


)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		INSERT INTO tblCourt
		(
			Court_Name,
			Court_Venue,
			Court_Address,
			Court_Basis,
			Court_Misc
		)

		VALUES(
		
			@Court_Name,
			@Court_Venue,
			@Court_Address,
			@Court_Basis,
			@Court_Misc
		)					

		COMMIT TRAN

	END -- END of ELSE	

END
GO
