USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[CreateClosedReport]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--**************** Start of Procedure CreateClosedReport **********************
CREATE PROCEDURE [dbo].[CreateClosedReport]
as
begin
select distinct a.case_id,a.injuredparty_name,a.provider_name,a.insurancecompany_name,a.status,a.balance_amount as claim_amount,b.principal,
b.interest,b.filingfee,b.attorneyfee from lcj_vw_Casesearchdetails a inner join tobecollected b on a.case_id=b.case_id
end

--**************** End of Procedure CreateClosedReport **********************

GO
