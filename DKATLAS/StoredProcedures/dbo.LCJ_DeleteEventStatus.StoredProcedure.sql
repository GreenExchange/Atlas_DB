USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteEventStatus]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteEventStatus]
(

@EventStatusName varchar(100)

)


AS

DELETE from tblEventStatus where EventStatusName = + @EventStatusName
GO
