USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DefendantDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DefendantDetails]
	
	(
		@DomainId nvarchar(50),
		@Defendant_Id NVARCHAR(100)
		
	)

AS

BEGIN

SELECT    *,Defendant_City+' , '+Defendant_State+' '+Defendant_Zip as DefendantCity
	FROM        tblDefendant 
	WHERE    Defendant_Id = @Defendant_Id
	AND DomainId = @DomainId

END

GO
