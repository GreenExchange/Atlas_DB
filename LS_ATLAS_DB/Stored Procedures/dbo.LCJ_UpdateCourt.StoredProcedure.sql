USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdateCourt]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdateCourt]    Script Date: 11/09/2010 17:13:39 ******/

CREATE PROCEDURE [dbo].[LCJ_UpdateCourt]
(
			@DomainId nvarchar(50),
			@Court_Id int,
			@Court_Name nvarchar(100),
			@Court_Venue nvarchar(100),
			@Court_Address nvarchar(100),
			@Court_Basis nvarchar(100),
			@Court_Misc nvarchar(100)


)
AS
BEGIN
	
		BEGIN TRAN
			
		UPDATE tblCourt  SET
			DomainId = @DomainId,
			Court_Name=@Court_Name,
			Court_Venue=@Court_Venue,
			Court_Address=@Court_Address,
			Court_Basis=@Court_Basis,
			Court_Misc=@Court_Misc
		WHERE Court_Id=@Court_Id

		COMMIT TRAN
END

GO
