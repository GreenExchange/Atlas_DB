USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[BX_Func_Edit_Contact]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 9/5/2008
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[BX_Func_Edit_Contact] 
(	

	@contact_id int 
	 
)
RETURNS TABLE 
AS
RETURN 
(
	
	SELECT     BX_CONTACTS.CONTACT_ID, BX_CONTACTS.CONTACT_FIRST_NAME, BX_CONTACTS.CONTACT_LAST_NAME, BX_CONTACTS.CONTACT_SUFFIX, 
                      BX_CONTACTS.CONTACT_ADDRESS, BX_CONTACTS.CONTACT_CITY, BX_CONTACTS.CONTACT_ZIP, BX_CONTACTS.CONTACT_STATE, 
                      BX_CONTACTS.CONTACT_PHONE2, BX_CONTACTS.CONTACT_PHONE, BX_CONTACTS.CONTACT_MOBILE, BX_CONTACTS.CONTACT_FAX, 
                      BX_CONTACTS.CONTACT_EMAIL, BX_CONTACTS.CONTACT_TITLE, BX_CONTACTS.CONTACT_IMPORTANCE, BX_CONTACTS.CLIENT_LINKED, 
                      tblInsuranceCompany.InsuranceCompany_Name,BX_CONTACTS.CONTACT_EXTENSION
FROM         BX_CONTACTS INNER JOIN
                      tblInsuranceCompany ON BX_CONTACTS.INSURANCE_ID = tblInsuranceCompany.InsuranceCompany_Id
WHERE     (BX_CONTACTS.ACTIVE = 1) AND (BX_CONTACTS.CONTACT_ID = @contact_id)
)
GO
