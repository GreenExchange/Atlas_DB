USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Report_AAA_Docs_Delay_CaseCount]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Report_AAA_Docs_Delay_CaseCount]
	@DomainID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT distinct
		Count(cas.Case_Id) as TotalCase,
		cas.Provider_Id,
		p.Provider_Name
		FROM tblCase cas (NOLOCK) left join tblProvider p (NOLOCK) on p.Provider_Id = cas.Provider_Id
		where cas.DomainId = @DomainID and LTRIM(RTRIM(Status)) = 'AAA DOCS DELAY'
		group by cas.Provider_Id, p.Provider_Name
END
GO
