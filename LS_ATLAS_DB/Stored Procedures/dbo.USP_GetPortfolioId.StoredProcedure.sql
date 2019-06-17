USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPortfolioId]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetPortfolioId] 
-- USP_GetPortfolioId 'KIDWELL 001','priya'
(
  @Name VARCHAR(100),
  @DomainId VARCHAR(100)
)
AS BEGIN

--select ID from tbl_portfolio where Name='KIDWELL 001'

DECLARE @PortfolioId INT=0

SELECT		@PortfolioId = PF.ID 
FROM		tbl_portfolio PF
INNER JOIN	tbl_program P ON p.id=pf.ProgramId
WHERE		PF.Name=@Name 
AND			PF.domainId=@DomainId

SELECT @PortfolioId

END

GO
