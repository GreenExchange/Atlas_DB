USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[CaseData_Retrive_By_CaseId]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CaseData_Retrive_By_CaseId]  --[CaseData_Retrive_By_CaseId] 'FH11-87652'
(
     @s_a_Case_Id nVARCHAR(2000)=''
	
)  
  
AS    
BEGIN
     
	declare @dt_settlement DATETIME
	declare @dt_paid_full DATETIME
	declare @dt_withdrawn DATETIME
	declare @dt_opened DATETIME
	declare @i_case_age INT
	declare @Min_DOS_Start DATETIME
    declare @Max_DOS_End DATETIME

	set @Min_DOS_Start=(select min(DateOfService_Start)as DOS_Start from tbltreatment where Case_Id = @s_a_Case_Id)  
	set @Max_DOS_End=(select max(DateOfService_End)as DOS_End from tbltreatment where Case_Id =  @s_a_Case_Id)  


	set @dt_settlement = (select top 1 settlement_date from tblsettlements where case_id = @s_a_Case_Id)
	set @dt_paid_full = (select top 1 NOTES_DATE from TBLNOTES where case_id = @s_a_Case_Id AND notes_desc like '%to paid-full%' ORDER BY NOTES_DATE DESC)
	set @dt_withdrawn = (select top 1 NOTES_DATE from TBLNOTES where case_id = @s_a_Case_Id AND notes_desc like '%to WITHDRAWN%' ORDER BY NOTES_DATE DESC)
	set @dt_opened = (select date_opened from tblcase where case_id = @s_a_Case_Id)
	
	if(@dt_settlement IS NULL AND @dt_paid_full IS NULL AND @dt_withdrawn IS NULL)
	BEGIN
		SET @i_case_age = datediff(day,@dt_opened,getdate())
	END
	else IF(@dt_settlement IS NOT NULL AND @dt_paid_full IS NULL AND @dt_withdrawn IS NULL)
	BEGIN
		SET @i_case_age = datediff(day,@dt_opened,@dt_settlement)
	END
	ELSE IF(@dt_paid_full IS NOT NULL AND @dt_settlement IS NULL AND @dt_withdrawn IS NULL)
	BEGIN
		SET @i_case_age = datediff(day,@dt_opened,@dt_paid_full)
	END
	ELSE IF(@dt_withdrawn IS NOT NULL AND @dt_paid_full IS NULL AND @dt_settlement IS NULL)
	BEGIN
		SET @i_case_age = datediff(day,@dt_opened,@dt_withdrawn)
	END
	ELSE
	BEGIN
		SET @i_case_age = datediff(day,@dt_opened,getdate())	
	END


	 select     
		    cas.Case_ID
		  , ISNULL(pro.Provider_Name,'N/A')Provider_Name
		  , ISNULL(ins.InsuranceCompany_Name,'N/A')InsuranceCompany_Name
		  , ISNULL(convert(nvarchar,SUM(trmt.Claim_Amount)),'N/A')Claim_Amount
		  , ISNULL(convert(nvarchar,SUM(trmt.Fee_Schedule)),'N/A')Fee_Schedule
		  , ISNULL(convert(nvarchar,SUM(trmt.Paid_Amount)),'N/A')Paid_Amount
		  , ISNULL(convert(nvarchar,@Min_DOS_Start,101),'N/A')[DOS_Start]
          , ISNULL(convert(nvarchar,@Max_DOS_End,101),'N/A') [DOS_End]
		  , cas.Initial_Status as Initial_Status
		  , cas.Status as Status
          , ISNULL(@i_case_age,'N/A')[case_age]
     from tblcase cas
     INNER JOIN tblProvider pro on cas.provider_id=pro.provider_id 
     INNER JOIN tblInsuranceCompany ins on cas.insurancecompany_id=ins.insurancecompany_id 
	 LEFT OUTER JOIN tblTreatment trmt ON  cas.Case_Id=  trmt.Case_Id
     WHERE cas.Case_Id = @s_a_Case_Id
     GROUP BY 
		cas.Case_ID
	 , pro.Provider_Name
	 , ins.InsuranceCompany_Name
	 , cas.Initial_Status 
	 , cas.Status
          
          
   
END

GO
