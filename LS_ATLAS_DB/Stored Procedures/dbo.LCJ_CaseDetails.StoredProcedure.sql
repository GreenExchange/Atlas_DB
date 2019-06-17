USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_CaseDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_CaseDetails]
	
	(
		@DomainId NVARCHAR(50),
		@Case_Id NVARCHAR(100)
		
	)

AS

BEGIN

	SELECT    *
	FROM        LCJ_VW_CaseDetails
	WHERE    Case_Id = @Case_Id
	and DomainId=@DomainId
END

GO
