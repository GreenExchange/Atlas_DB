USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_tblInsuranceCompanyDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_tblInsuranceCompanyDetails]  ---[LCJ_tblInsuranceCompanyDetails] 'priya', 2009
	(
		@DomainId nvarchar(50),
		@InsuranceCompany_Id NVARCHAR(100)		
	)
AS
BEGIN
	SELECT *,
   (select COUNT(C.Case_Id)	
	FROM tblcase  C WHERE C.InsuranceCompany_Id=@InsuranceCompany_Id AND C.DomainId = @DomainId) CaseCount
	FROM tblInsuranceCompany   ins	
	WHERE    ins.InsuranceCompany_Id =@InsuranceCompany_Id and ins.DomainId = @DomainId
END
GO
