USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SPROC_HIDE_IMAGES_SINGLE]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BX_SPROC_HIDE_IMAGES_SINGLE] @IMAGEID INT
AS 
BEGIN
SET NOCOUNT ON

UPDATE BX_IMAGES
SET DELETEFLAG=1 
FROM BX_IMAGES WHERE IMAGEID =@IMAGEID

END
GO
