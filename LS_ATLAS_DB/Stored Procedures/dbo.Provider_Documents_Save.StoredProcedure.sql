USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Provider_Documents_Save]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- DROP PROCEDURE [dbo].[LCJ_InsertProviderDocs] 
CREATE PROCEDURE [dbo].[Provider_Documents_Save] 
	-- Add the parameters for the stored procedure here
	@s_a_File_Path VARCHAR(1000),
	@s_a_FileName VARCHAR(500),
	@i_a_DocType_ID int,
	@CreatedBy nvarchar(50),
	@DomainId nvarchar(50),
	@i_a_Provider_Id int,
	@i_a_BasePathId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT FileName FROM Provider_Documents WHERE File_Path = @s_a_File_Path and FileName = @s_a_FileName)
	BEGIN
		Insert into Provider_Documents(File_Path,FileName,DocType_ID,CreatedBy,DomainId,Provider_Id,CreatedDate, BasePathId)
		values (@s_a_File_Path,@s_a_FileName, @i_a_DocType_ID,@CreatedBy,@DomainId,@i_a_Provider_Id,GETDATE(), @i_a_BasePathId)
	END
END

GO
