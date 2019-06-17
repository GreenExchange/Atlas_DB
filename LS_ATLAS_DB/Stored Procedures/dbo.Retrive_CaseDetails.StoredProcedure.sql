USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Retrive_CaseDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Retrive_CaseDetails]
	
	(
		@DomainId VARCHAR(50),
		@Case_Id VARCHAR(100)
		
	)

AS

BEGIN

	SELECT    *
	FROM        LCJ_VW_CaseDetails (NOLOCK)
	WHERE    Case_Id like '%'+ @Case_Id + '%'
	and DomainId=@DomainId
END



GO
