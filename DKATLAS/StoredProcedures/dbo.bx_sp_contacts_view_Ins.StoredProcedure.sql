USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sp_contacts_view_Ins]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 9/4/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sp_contacts_view_Ins] 
	@insurance_id int
	  
AS
BEGIN
	
	SET NOCOUNT ON;

   
	SELECT     BX_CONTACTS.CONTACT_ID, BX_CONTACTS.CONTACT_FIRST_NAME + ' ' + BX_CONTACTS.CONTACT_LAST_NAME AS FULL_NAME, 
                      BX_CONTACTS.CONTACT_LAST_NAME, BX_CONTACTS.CONTACT_FIRST_NAME, BX_CONTACTS.CONTACT_PHONE, BX_CONTACTS.CONTACT_PHONE2,
                      BX_CONTACTS.CONTACT_MOBILE, BX_CONTACTS.CONTACT_FAX, BX_CONTACTS.CONTACT_EMAIL, BX_CONTACTS.CONTACT_IMPORTANCE, 
                      tblInsuranceCompany.InsuranceCompany_Name,tblInsuranceCompany.InsuranceCompany_id,BX_CONTACTS.CONTACT_EXTENSION
FROM         BX_CONTACTS INNER JOIN
                      tblInsuranceCompany ON BX_CONTACTS.INSURANCE_ID = tblInsuranceCompany.InsuranceCompany_Id
WHERE     (BX_CONTACTS.ACTIVE = 1)AND (tblInsuranceCompany.InsuranceCompany_id=@INSURANCE_ID)
END
GO
