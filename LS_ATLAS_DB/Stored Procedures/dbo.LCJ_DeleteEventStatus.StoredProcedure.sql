USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteEventStatus]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteEventStatus]
(
@DomainId varchar(50),
@EventStatusName varchar(100)

)


AS

DELETE from tblEventStatus  where EventStatusName = + @EventStatusName and DomainId = @DomainId

GO
