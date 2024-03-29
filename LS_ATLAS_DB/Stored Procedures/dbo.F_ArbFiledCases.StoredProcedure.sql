USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_ArbFiledCases]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_ArbFiledCases] --[F_ArbFiledCases] '01/01/2014' , '01/25/2014'
	
(
	@from_date varchar(500),
	@to_date varchar(200)
)
AS
DECLARE @strsql as varchar(8000)
BEGIN
	SET NOCOUNT ON;

		select DISTINCT C.Case_Id AS [Case_ID],
		Initial_Status AS [Case_Status],
		status AS [Current_Status],
		injuredparty_name as  [Patient_Name],
		provider_name AS [Provider],
		Provider_GroupName AS [Provider_Group],
		INSURANCE_NAME AS [Insurance_Company],
		convert(varchar,Date_AAA_Arb_Filed,101) AS [AAA_FILED_Date]
		from LCJ_VW_CaseSearchDetails  c
		WHERE Date_AAA_Arb_Filed BETWEEN @from_date AND @to_date
		ORDER BY [AAA_FILED_Date]
		
END

GO
