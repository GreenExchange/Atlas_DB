USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AttorneyDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AttorneyDetails]
	
	(
		@DomainId nvarchar(50),
		@Attorney_Id varchar (40)
		
	)

AS

BEGIN

	SELECT    Attorney_Id, Attorney_LastName, Attorney_FirstName, Attorney_Address, 
		    Attorney_City, Attorney_State, Attorney_Zip, Attorney_Phone, 
		    Attorney_Fax, Attorney_Email, Defendant_Id
	FROM       tblAttorney 
	WHERE    Attorney_Id = @Attorney_Id
	AND DomainId = @DomainId

END

GO
