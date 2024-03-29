USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sp_contact_tagged_view]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SROSENTHAL
-- ALTER date: 9/3/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sp_contact_tagged_view] 
		@case_id int  
	
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT     BX_CONTACTS.CONTACT_FIRST_NAME + ' ' + BX_CONTACTS.CONTACT_LAST_NAME AS NAME, BX_CONTACTS.CONTACT_PHONE, 
                      BX_CONTACTS.CONTACT_PHONE2, BX_CONTACTS.CONTACT_MOBILE, BX_CONTACTS.CONTACT_EMAIL, BX_CONTACT_TAGS.CONTACT_ID, 
                      BX_CONTACT_TAGS.CASE_ID, tblInsuranceCompany.InsuranceCompany_Name
FROM         BX_CONTACT_TAGS INNER JOIN
                      BX_CONTACTS ON BX_CONTACT_TAGS.CONTACT_ID = BX_CONTACTS.CONTACT_ID INNER JOIN
                      tblInsuranceCompany ON BX_CONTACTS.INSURANCE_ID = tblInsuranceCompany.InsuranceCompany_Id
WHERE     (BX_CONTACT_TAGS.CASE_ID = @CASE_ID) AND (BX_CONTACTS.ACTIVE = 1)
	

END
GO
