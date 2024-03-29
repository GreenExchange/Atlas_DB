USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GET_SUMMONS_SENT_NO_INDEX]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_SUMMONS_SENT_NO_INDEX]
AS
BEGIN

select 
	case_id,
	case_code,
	injuredparty_name,
	provider_name,
	insurancecompany_name,
	indexoraaa_number,
	Date_SUMMONS_printed,
	date_summons_Sent_court,
	balance_amount as claim_amount,
	status 
from lcj_vw_Casesearchdetails 
where 
	case_id in (select case_id from tblnotes where notes_desc like '%to SUMMONS-SENT-TO-COURT%' and datediff(d,notes_date,getdate()) >=30)
	AND status = 'SUMMONS-SENT-TO-COURT' 
	AND IndexOrAAA_Number IS NULL
order by case_id

END
GO
