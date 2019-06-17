USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteDenialReasons]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteDenialReasons] 
(
@DomainId NVARCHAR(50),
@DenialReasons_Type nvarchar(100)

)


AS

DELETE from tblDenialReasons where DenialReasons_Type = + Rtrim(Ltrim(@DenialReasons_Type)) and DomainId=@DomainId

GO
