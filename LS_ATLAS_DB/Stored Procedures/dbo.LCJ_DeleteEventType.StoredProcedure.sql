USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteEventType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteEventType]
(
@DomainId varchar(50),
@EventTypeName varchar(100)

)


AS

DELETE from tblEventType  where EventTypeName = + @EventTypeName and DomainId = @DomainId

GO
