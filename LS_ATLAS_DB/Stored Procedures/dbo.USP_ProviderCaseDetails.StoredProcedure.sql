USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[USP_ProviderCaseDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ProviderCaseDetails]
	
	(
		@DomainId NVARCHAR(50),
		@Case_Id NVARCHAR(100),
		@Provider_Id int
		
	)

AS

BEGIN

	SELECT    *	FROM        tblProviderCase
	WHERE    Case_Id = @Case_Id	and DomainId=@DomainId and Provider_Id= @Provider_Id
END

GO
