USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteMotion]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteMotion]
(
@DomainId nvarchar(50),
@Motion_id nvarchar(3000)

)


AS

DELETE from tblMotions  where Motion_ID = + @Motion_id and DomainId=@DomainId

GO
