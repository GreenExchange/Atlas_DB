USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Admin_ShowDesks]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_Admin_ShowDesks]

(
@DomainId NVARCHAR(50),
@UserName NVARCHAR(50)
)

AS

SELECT *, '' AS DeleteDesk from LCJ_VW_ManageDesk WHERE Username = + @Username and DomainId=@DomainId

GO
