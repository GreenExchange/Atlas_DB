USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GetLawFirms]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLawFirms]
@DomainId nvarchar(50) = ''
AS
BEGIN
		SELECT AccountDomain,LawFirmId,DomainId,EmailSendTo FROM DomainAccounts where (@DomainId = '' or DomainId = @DomainId)
END

GO
