USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Get_AnswerExpected_Sheet]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Get_AnswerExpected_Sheet]		--F_Get_AnswerExpected_Sheet
AS
BEGIN
	SET NOCOUNT ON;
		  select Case_Id,
		  provider_name,
		  injuredparty_name,
		  insurancecompany_name,
		  indexoraaa_number,
		  dateofservice_start,
		  dateofservice_end,
		  balance_amount,
		  Convert(VARCHAR(10),accident_date,101) AS accident_date,
		  Convert(VARCHAR(10),Date_Opened,101) AS Date_Opened,
		  Convert(VARCHAR(10),date_summons_Sent_court,101) AS date_summons_Sent_court,
		  Convert(VARCHAR(10),date_index_number_purchased,101) AS date_index_number_purchased,
		  Convert(VARCHAR(10),Served_On_Date,101) AS Served_On_Date,
		  Convert(VARCHAR(10),Date_Afidavit_Filed,101) AS Date_Afidavit_Filed,
		  Convert(VARCHAR(10),Date_Ext_Of_Time,101) AS Date_Ext_Of_Time,
		  Convert(VARCHAR(10),Date_Ext_Of_Time_2,101) AS Date_Ext_Of_Time_2,
		  Convert(VARCHAR(10),Date_Ext_Of_Time_3,101) AS Date_Ext_Of_Time_3,
		  Case WHEN Date_Ext_Of_Time_3 is NOT null THEN Convert(VARCHAR(10),Date_Ext_Of_Time_3 +5,101)
				WHEN Date_Ext_Of_Time_2 is NOT null THEN Convert(VARCHAR(10),Date_Ext_Of_Time_2 +5,101)     
				WHEN Date_Ext_Of_Time is NOT null THEN Convert(VARCHAR(10),Date_Ext_Of_Time +5,101) 
				WHEN insurancecompany_name like '%GEICO%' OR InsuranceCompany_Name like 'GOVERNMENT EMPLOYEES%' THEN Convert(VARCHAR(10),Served_On_Date +65,101)
				ELSE Convert(VARCHAR(10),Date_Afidavit_Filed +45,101)
		  END AS [date_answer_due]
	from lcj_vw_Casesearchdetails
	WHERE 
	status='AFFIDAVITS FILED IN COURT'
	AND
	Case WHEN Date_Ext_Of_Time_3 is NOT null THEN Convert(VARCHAR(10),Date_Ext_Of_Time_3 +5,101)
				WHEN Date_Ext_Of_Time_2 is NOT null THEN Convert(VARCHAR(10),Date_Ext_Of_Time_2 +5,101)     
				WHEN Date_Ext_Of_Time is NOT null THEN Convert(VARCHAR(10),Date_Ext_Of_Time +5,101) 
				WHEN insurancecompany_name like '%GEICO%' OR InsuranceCompany_Name like 'GOVERNMENT EMPLOYEES%' THEN Convert(VARCHAR(10),Served_On_Date +65,101)
				ELSE Convert(VARCHAR(10),Date_Afidavit_Filed +45,101)
	END  is not null
	AND
	DATEDIFF(DD,
	Case WHEN Date_Ext_Of_Time_3 is NOT null THEN Convert(VARCHAR(10),Date_Ext_Of_Time_3 +5,101)
				WHEN Date_Ext_Of_Time_2 is NOT null THEN Convert(VARCHAR(10),Date_Ext_Of_Time_2 +5,101)     
				WHEN Date_Ext_Of_Time is NOT null THEN Convert(VARCHAR(10),Date_Ext_Of_Time +5,101) 
				WHEN insurancecompany_name like '%GEICO%' OR InsuranceCompany_Name like 'GOVERNMENT EMPLOYEES%' THEN Convert(VARCHAR(10),Served_On_Date +65,101)
				ELSE Convert(VARCHAR(10),Date_Afidavit_Filed +45,101)
	END,getdate()) < 365
END

GO
