USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Admin_ShowDesks]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_Admin_ShowDesks]

(
@UserName NVARCHAR(50)
)

AS

SELECT *, '' AS DeleteDesk from LCJ_VW_ManageDesk WHERE Username = + @Username
GO
