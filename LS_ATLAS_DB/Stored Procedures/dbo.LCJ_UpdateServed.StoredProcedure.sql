USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdateServed]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdateCourt]    Script Date: 11/09/2010 17:13:39 ******/

CREATE PROCEDURE [dbo].[LCJ_UpdateServed]
(
			@DomainId nvarchar(50),
			@Id int,
			@Name varchar(50),
			@Age varchar(10),
			@Weight varchar(10),
			@Height varchar(10),
			@Skin varchar(50),
			@Hair varchar(50),
			@Sex varchar(10)
)
AS
BEGIN
	
		BEGIN TRAN
			
		UPDATE tblServed  SET
			Name = @Name,							
			Age	= @Age,						
			Weight = @Weight,						
			Height =@Height,						
			Skin = @Skin,							
			Hair = @Hair,							
			Sex	=@Sex
		WHERE Id=@Id

		COMMIT TRAN
END

GO
