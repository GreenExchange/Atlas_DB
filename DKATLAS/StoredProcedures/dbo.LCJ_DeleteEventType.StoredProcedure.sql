USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteEventType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteEventType]
(

@EventTypeName varchar(100)

)


AS

DELETE from tblEventType where EventTypeName = + @EventTypeName
GO
