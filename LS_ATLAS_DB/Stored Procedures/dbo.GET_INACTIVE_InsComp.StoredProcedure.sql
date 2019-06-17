USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GET_INACTIVE_InsComp]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_INACTIVE_InsComp]
(
@DomainId nvarchar(50)
)
AS
Begin
	select insuranceCompany_id, insurancecompany_name, insuranceCompany_Local_Address  from tblInsuranceCompany where ActiveStatus = 0 AND DomainId = @DomainId
	order by 2
--select insuranceCompany_id, insurancecompany_name, insuranceCompany_Local_Address +' '+ InsuranceCompany_Local_Address+' '+ insuranceCompany_Local_City+ ' '+insuranceCompany_Local_State+' '+insuranceCompany_Local_Zip as insuranceCompany_Local_Address from tblinsurancecompany where ActiveStatus = 0
End

GO
