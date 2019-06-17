USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteAction]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteAction] 
(
	@DomainId NVARCHAR(50),
	@Action_ID int
)
AS

DELETE from tblaction where Action_Id =  @Action_ID and DomainId=@DomainId

GO
