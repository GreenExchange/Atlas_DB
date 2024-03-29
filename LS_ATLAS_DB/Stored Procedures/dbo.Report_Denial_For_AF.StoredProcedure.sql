USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Report_Denial_For_AF]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Report_Denial_For_AF] 
--[Report_Denial_For_AF] 'af',@s_a_ProviderId=0,@s_a_Denial_Date_From='01/01/2019',@s_a_Denial_Date_To='01/01/2019',@s_a_Denial_Posted_Date_From='01/01/2019', @s_a_Denial_Posted_Date_To='03/01/2019'
--exec Report_Denial_For_AF @domainId=N'af',@s_a_ProviderId=N'0',@s_a_ProviderGroup=N'CIRCULAR SYMMETRY ACUPUNCTURE PC',@s_a_Denial_Date_From=N'01/01/2017',@s_a_Denial_Date_To=N'01/31/2019',@s_a_Denial_Posted_Date_From=N'01/01/2017',@s_a_Denial_Posted_Date_To=N'01/31/2019',@s_a_DenialReasons_ID=N'296,278,289,298,276,277,291,346,288,283,282,345'
	@domainId					nvarchar(50),
	@s_a_ProviderId				int,
	@s_a_ProviderGroup			varchar(100)='',
	@s_a_Denial_Date_From	VARCHAR(50)=null,
	@s_a_Denial_Date_To		VARCHAR(50)=null,
	@s_a_Denial_Posted_Date_From	VARCHAR(50)=null,
	@s_a_Denial_Posted_Date_To		VARCHAR(50)=null,
	@s_a_DenialReasons_ID		VARCHAR(MAX)=''
	
AS
BEGIN
		
	DECLARE @tblCASE TABLE 
	(
		SZ_CASE_ID INT,
		SZ_CASE_NO INT,
		DomainID VARCHAR(50),
		PROVIDER_ID INT,
		PROVIDER_GROUP VARCHAR(200)
	)
	
	INSERT INTO @tblCASE
	SELECT distinct
			cas.GB_CASE_ID,
			cas.GB_CASE_NO,
			cas.DomainID,
			cas.Provider_ID,
			pro.Provider_GroupName AS Provider_GroupName
		FROM  dbo.tblCase cas
		INNER JOIN dbo.tblprovider pro on cas.provider_id=pro.provider_id 
		INNER JOIN dbo.tblInsuranceCompany ins on cas.insurancecompany_id=ins.insurancecompany_id
		LEFT OUTER JOIN dbo.tblTreatment tre on tre.Case_Id= cas.Case_Id
		LEFT OUTER JOIN tblOperatingDoctor doc on  doc.Doctor_Id =tre.Doctor_Id 
		LEFT OUTER JOIN TXN_tblTreatment t_tre  WITH (NOLOCK) on tre.treatment_id = t_tre.Treatment_Id 
		LEFT OUTER JOIN tblDenialReasons dr ON(dr.DenialReasons_Id=tre.DenialReason_ID)
		WHERE
			cas.DomainId =@domainId
			AND ((@s_a_Denial_Date_From = '' and  @s_a_Denial_Date_To='')
				OR	tre.DenialDate BETWEEN CONVERT(datetime,@s_a_Denial_Date_From) AND CONVERT(datetime,@s_a_Denial_Date_TO)+1
				OR	t_tre.DenialReasons_Date BETWEEN CONVERT(datetime,@s_a_Denial_Date_From) AND CONVERT(datetime,@s_a_Denial_Date_TO)+1 
				)
			AND ((@s_a_Denial_Posted_Date_From = '' and  @s_a_Denial_Posted_Date_To='')
				OR	tre.Denial_Posted_Date BETWEEN CONVERT(datetime,@s_a_Denial_Posted_Date_From) AND CONVERT(datetime,@s_a_Denial_Posted_Date_To)+1
				OR	t_tre.Denial_Posted_Date BETWEEN CONVERT(datetime,@s_a_Denial_Posted_Date_From) AND CONVERT(datetime,@s_a_Denial_Posted_Date_To)+1 
				)
			AND (@s_a_ProviderId = '0' OR cas.Provider_Id = @s_a_ProviderId)
			AND (@s_a_ProviderGroup = '' OR pro.Provider_GroupName = @s_a_ProviderGroup)
			AND (@s_a_DenialReasons_ID = '' 
			OR	tre.DenialReason_ID IN (SELECT items FROM dbo.SplitStringInt(@s_a_DenialReasons_ID,','))
			OR	t_tre.DenialReasons_Id IN (SELECT items FROM dbo.SplitStringInt(@s_a_DenialReasons_ID,',')))
			--AND cas.CASE_ID LIKE 'ACT%'
			 --and InjuredParty_FirstName =  'JULIO'  
			 --and  InjuredParty_LastName =  'ZUNIGA'
-------------------------------------------------------------------------------------------------------------------
	 SELECT distinct
			tre.Treatment_Id, 
			tre.Case_Id AS Case_Id,
			tre.BILL_NUMBER AS BILL_NUMBER,
			CONVERT(VARCHAR(10),tre.DateOfService_Start,101) AS DateOfService_Start,
			CONVERT(VARCHAR(10),tre.DateOfService_End,101) AS DateOfService_End,
			pro.Provider_Name AS Provider_Name,
			cas.InjuredParty_LastName + ', ' + cas.InjuredParty_FirstName as InjuredParty_Name,
			ins.InsuranceCompany_Name AS InsuranceCompany_Name, 
			pro.Provider_Local_Address AS Provider_Local_Address,
			cas.Accident_Date,
			CONVERT(VARCHAR(10),tre.Date_BillSent, 101) AS BillDate_submitted,   
			tre.SERVICE_TYPE AS SERVICE_TYPE,
			convert(decimal(38,2),(convert(money,convert(float,tre.Claim_Amount)))) as Claim_Amount,
			convert(decimal(38,2),(convert(money,convert(float,tre.Paid_Amount)))) as Paid_Amount,
			convert(money,(convert(float,tre.Claim_Amount)) - convert(money,convert(float,tre.Paid_Amount))) as Claim_Balance,
			convert(decimal(38,2),convert(money,convert(float,tre.Fee_Schedule))) as Fee_Schedule,
			convert(money,(convert(float,tre.Claim_Amount)) - convert(money,convert(float,tre.Fee_Schedule))) as FS_Balance,
			cas.Initial_Status AS Initial_Status,
			cas.Status AS Status,
			pro.Provider_GroupName AS Provider_GroupName,
			MAX(doc.DOCTOR_NAME) AS DOCTOR_NAME,
			tre.DenialDate AS DenialDate,
			--max(dr.DenialReasons_Type) AS DenialReasons_Type,
			tre.IMEDate AS IMEDate,
			tre.Notes AS Notes,
			cas.DenialReasons_Type AS DenialReasons_Type
		FROM  dbo.tblCase cas
		INNER JOIN dbo.tblprovider pro on cas.provider_id=pro.provider_id 
		INNER JOIN dbo.tblInsuranceCompany ins on cas.insurancecompany_id=ins.insurancecompany_id
		LEFT OUTER JOIN dbo.tblTreatment tre on tre.Case_Id= cas.Case_Id
		LEFT OUTER JOIN tblOperatingDoctor doc on  doc.Doctor_Id =tre.Doctor_Id 
		LEFT OUTER JOIN TXN_tblTreatment t_tre  WITH (NOLOCK) on tre.treatment_id = t_tre.Treatment_Id 
		LEFT OUTER JOIN tblDenialReasons dr ON(dr.DenialReasons_Id=tre.DenialReason_ID)
		INNER JOIN @tblCASE t_cas ON 
					cas.gb_case_id = t_cas.SZ_CASE_ID
					AND cas.gb_case_no = t_cas.SZ_CASE_NO
					AND cas.provider_id= t_cas.PROVIDER_ID
					AND pro.Provider_GroupName = t_cas.PROVIDER_GROUP
					AND cas.DomainId = t_cas.DomainID
		WHERE
			cas.DomainId =@domainId
			AND cas.CASE_ID LIKE 'ACT%'
			 --and InjuredParty_FirstName =  'JULIO'  
			 --and  InjuredParty_LastName =  'ZUNIGA'
		group by
		tre.Treatment_Id, 
		cas.DomainId,
		cas.Case_Id,
		cas.Case_Id,
		cas.DenialReasons_Type,
		cas.Accident_Date,
		tre.Case_Id,
		pro.Provider_Name,
		pro.Provider_Local_Address,
		cas.InjuredParty_LastName,
		cas.InjuredParty_FirstName,
		ins.InsuranceCompany_Name,
		cas.Initial_Status,
		cas.Status,
		pro.Provider_GroupName,
		tre.BILL_NUMBER,
		tre.DateOfService_Start,
		tre.DateOfService_End,
		tre.Date_BillSent,
		tre.SERVICE_TYPE,
		tre.Claim_Amount,
		tre.Paid_Amount,
		tre.Fee_Schedule,
		tre.DenialDate,
		tre.IMEDate,
		tre.Notes
		

		
			
END
GO
