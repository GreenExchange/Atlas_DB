USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Get_Status_Details]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Get_Status_Details]   --[dbo].[F_Get_Status_Details] 'CLOSED-VOLUNTARY-PAID'     
(
	@s_a_Status VARCHAR(200)
)
AS  
	BEGIN
			select Case_Id,(InjuredParty_LastName+','+InjuredParty_FirstName) as Patient,Provider_Name,
			INSURANCE_NAME,Ins_Claim_Number,convert(varchar,Date_Opened,101) as Date_Opened,
			convert(varchar,Accident_Date,101) as Accident_Date,
			convert(varchar,DateOfServiceStart,101)+'-'+convert(varchar,convert(datetime,DateOfService_End),101) as DOS,
			Fee_Schedule,
		IndexOrAAA_Number,Balance_Amount
			from LCJ_VW_CaseSearchDetails where Status like @s_a_Status
	END
GO
