USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Image_Physical_Path]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Image_Physical_Path]
    @i_a_imageId AS INT
AS
SET NOCOUNT ON

DECLARE @BASEFOLDER AS NVARCHAR(255)

BEGIN

	SELECT @BASEFOLDER=PhysicalBasePath FROM [tblBasePath] Where BasePathId = (Select BasePathId from TBLDOCIMAGES Where ImageId=@i_a_imageId)

	SELECT (@BASEFOLDER+FILEPATH + FILENAME) As ImagePath FROM TBLDOCIMAGES WHERE IMAGEID=@i_a_imageId
	--print(@FILEPATH)

END
GO
