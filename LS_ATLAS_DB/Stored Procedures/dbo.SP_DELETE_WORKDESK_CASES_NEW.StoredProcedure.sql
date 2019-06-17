USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_WORKDESK_CASES_NEW]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_WORKDESK_CASES_NEW] 
@DomainId NVARCHAR(50),
@History_Id NVARCHAR(100)
AS
BEGIN

	DELETE FROM tblCaseDeskHistory WHERE History_Id = @History_Id and DomainId=@DomainId

END

GO
