USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AdjusterDetails]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AdjusterDetails]
	
	(
		@Adjuster_Id int
		
	)

AS

BEGIN

	SELECT    Adjuster_Id, Adjuster_LastName, Adjuster_FirstName, InsuranceCompany_Id, 
		    Adjuster_Phone,Adjuster_Address, Adjuster_Fax, Adjuster_Email,Adjuster_Extension
	FROM       tblAdjusters
	WHERE    Adjuster_Id = @Adjuster_Id

END
GO
