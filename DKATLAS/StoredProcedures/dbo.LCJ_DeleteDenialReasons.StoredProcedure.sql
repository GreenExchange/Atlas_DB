USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteDenialReasons]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteDenialReasons] 
(

@DenialReasons_Type nvarchar(100)

)


AS

DELETE from tblDenialReasons where DenialReasons_Type = + Rtrim(Ltrim(@DenialReasons_Type))
GO
