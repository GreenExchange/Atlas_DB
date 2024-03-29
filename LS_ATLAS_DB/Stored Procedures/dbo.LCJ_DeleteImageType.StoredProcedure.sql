USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteImageType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteImageType]
(
@DomainId nvarchar(50),
@Image_Type nvarchar(100)

)


AS

DELETE from tblImageTypes  where Image_Type = + Rtrim(Ltrim(@Image_Type)) and DomainId = @DomainId

GO
