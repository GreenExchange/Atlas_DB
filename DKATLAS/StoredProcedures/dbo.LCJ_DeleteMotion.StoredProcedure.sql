USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteMotion]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteMotion]
(

@Motion_id nvarchar(3000)

)


AS

DELETE from tblMotions where Motion_ID = + @Motion_id
GO
