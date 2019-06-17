USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AttorneyDetails]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_AttorneyDetails]
	
	(
		@Attorney_Id varchar (40)
		
	)

AS

BEGIN

	SELECT    Attorney_Id, Attorney_LastName, Attorney_FirstName, Attorney_Address, 
		    Attorney_City, Attorney_State, Attorney_Zip, Attorney_Phone, 
		    Attorney_Fax, Attorney_Email, Defendant_Id
	FROM       tblAttorney
	WHERE    Attorney_Id = @Attorney_Id

END
GO
