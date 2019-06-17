USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteInsuranceCompany]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteInsuranceCompany]
(

@InsuranceCompany_Id int,
@OperationResult INT OUTPUT

)


AS

		IF EXISTS(Select InsuranceCompany_Id  
		
			FROM  tblCase
			WHERE 
			InsuranceCompany_Id = @InsuranceCompany_Id
		
			  
		)

			BEGIN
				SET @OperationResult = 1
				Return 1
				
			END
	
		ELSE
			BEGIN
				DELETE from tblInsuranceCompany where InsuranceCompany_Id = @InsuranceCompany_Id
				SET @OperationResult = 0
				Return 0
			END
GO
