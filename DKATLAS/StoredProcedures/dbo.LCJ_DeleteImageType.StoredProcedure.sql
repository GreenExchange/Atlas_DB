USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteImageType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteImageType]
(

@Image_Type nvarchar(100)

)


AS

DELETE from tblImageTypes where Image_Type = + Rtrim(Ltrim(@Image_Type))
GO
