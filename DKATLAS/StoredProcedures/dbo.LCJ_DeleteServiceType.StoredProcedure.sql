USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteServiceType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[LCJ_DeleteServiceType]
(

@ServiceType nvarchar(100)

)


AS

DELETE from tblservicetype where ServiceType  = + Rtrim(Ltrim(@ServiceType))

GO
