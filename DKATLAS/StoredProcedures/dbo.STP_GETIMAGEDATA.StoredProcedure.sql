USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[STP_GETIMAGEDATA]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[STP_GETIMAGEDATA]
@IMAGEID INT

AS

SELECT * FROM tblDocImages WHERE IMAGEID=@IMAGEID
GO
