USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Report_Active_Delay_CaseCount]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Report_Active_Delay_CaseCount] 
	-- Add the parameters for the stored procedure here
	@DomainID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT distinct
		Count(cas.Case_Id) as TotalCase,
		cas.Provider_Id,
		p.Provider_Name
		FROM tblCase cas (NOLOCK) left join tblProvider p (NOLOCK) on p.Provider_Id = cas.Provider_Id
		where cas.DomainId=@DomainID 
		AND cas.status IN('ACTIVE BILLING DELAYED','ACTIVE BILLING DELAYED 60','ACTIVE BILLING DELAYED 90','ACTIVE BILLING DELAYED 120')
		group by cas.Provider_Id, p.Provider_Name

END
GO
