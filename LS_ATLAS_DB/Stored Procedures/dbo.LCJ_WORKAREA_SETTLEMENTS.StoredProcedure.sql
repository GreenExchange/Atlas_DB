USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WORKAREA_SETTLEMENTS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_WORKAREA_SETTLEMENTS]

(

@case_id varchar(100)

)

/*
**********************************************************************************************************************************
DATE:				CREATED BY:		PERPOSE:
25TH MAY 2006 2:34 PM 		MANOJ KUMAR ACHARYA	SHOW DETAILS OF A PERTICULAR GROUP
***********************************************************************************************************************************
*/

AS
DECLARE @group_id as integer
select @group_id=GROUP_ID FROM LCJ_VW_CaseSearchDetails WHERE CASE_ID=@case_id
BEGIN
print convert(varchar, @group_id)
select
Distinct
/*Case_Id as Edit,*/
Case_Id,
InjuredParty_Name,
Provider_Name,
InsuranceCompany_Name,
convert(varchar, Accident_Date, 101) as Accident_Date,
convert(varchar, DateOfService_Start,101) as DateOfService_Start,
convert(varchar, DateOfService_End,101) as DateOfService_End,Status,
Ins_Claim_Number,
Claim_Amount,
CASE WHEN Settlement_Id is NULL Then
'not-settled'
ELSE
'settled'
END AS Settlement_Status,
'''' AS ClickMe/*,
Group_Case,*/
From LCJ_VW_CaseSearchDetails WHERE (@group_id <> 0 AND group_id=@group_id) or case_id = @case_id
end

GO
