USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GetLawFirms]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetLawFirms]
	AS
	BEGIN
			SELECT AccountDomain,LawFirmId,DomainId,EmailSendTo FROM DomainAccounts
	END


GO
