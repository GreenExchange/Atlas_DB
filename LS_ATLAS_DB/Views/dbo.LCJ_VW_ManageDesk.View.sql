USE [LS_ATLAS_DB]
GO
/****** Object:  View [dbo].[LCJ_VW_ManageDesk]    Script Date: 6/17/2019 2:29:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[LCJ_VW_ManageDesk]
AS
SELECT     dbo.tblUserDesk.UserName, dbo.tblDesk.Desk_Name, dbo.tblUserDesk.Desk_Id, tblUserDesk.DomainId
FROM         dbo.tblUserDesk INNER JOIN
                      dbo.tblDesk ON dbo.tblUserDesk.Desk_Id = dbo.tblDesk.Desk_Id
GO
