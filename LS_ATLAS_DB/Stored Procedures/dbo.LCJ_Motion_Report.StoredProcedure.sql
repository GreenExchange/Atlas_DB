USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Motion_Report]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_Motion_Report]

(
	@court_id		    nvarchar(100),
	@start_date		    datetime,
	@end_date            datetime
)

AS

 
	BEGIN

		select tblMotions.motion_date,court_venue,Ins_Claim_Number,Attorney_FileNumber,Provider_Name,
		InsuranceCompany_Name,Defendant_Name,InjuredParty_Name,Motion_Status,Our_Motion_Type,
		defendent_motion_type,Opposition_Due_Date,Reply_Due_Date,Claim_Amount,Paid_Amount, 
		(convert(int,Claim_Amount) - convert(int,Paid_Amount)) as Outstanding_Amount
		 from tblMotions
		LEFT OUTER JOIN LCJ_VW_CaseSearchDetails
		on LCJ_VW_CaseSearchDetails.Case_id = tblMotions.Case_id
		where court_id = @court_id
		and tblMotions.motion_date >= @start_date and tblMotions.motion_date <=@end_date

	END

GO
