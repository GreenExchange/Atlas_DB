USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkArea_CaseInfo]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_WorkArea_CaseInfo]--[LCJ_WorkArea_CaseInfo] 'RFA14-174165'  
(    
	@DomainId NVARCHAR(50),
	@strCaseId NVARCHAR(100)    
)    
AS        
BEGIN
	DECLARE @dt_SETtlement DATETIME
	DECLARE @dt_paid_full DATETIME
	DECLARE @dt_withdrawn DATETIME
	DECLARE @dt_opened DATETIME
	DECLARE @Min_DOS_Start DATETIME
    DECLARE @Max_DOS_End DATETIME
    DECLARE @denialreason_type VARCHAR(8000)
	DECLARE @our_discovery_demands varchar(100)

	DECLARE @i_case_age INT
    DECLARE @i_a_status_change_Age INT   
    DECLARE @TotalLitigationAmount FLOAT
	

	SET @dt_SETtlement = (SELECT TOP 1 SETtlement_date FROM tblSETtlements (NOLOCK) WHERE case_id = @strCaseId and DomainId=@DomainId)
	SET @dt_paid_full = (SELECT TOP 1 NOTES_DATE FROM tblNotes (NOLOCK) WHERE case_id = @strCaseId  and DomainId=@DomainId AND notes_desc like '%to paid-full%' ORDER BY NOTES_DATE DESC)
	SET @dt_withdrawn = (SELECT TOP 1 NOTES_DATE FROM tblNotes (NOLOCK) WHERE case_id = @strCaseId  and DomainId=@DomainId and notes_desc like '%to WITHDRAWN%' ORDER BY NOTES_DATE DESC)
	SET @dt_opened = (SELECT date_opened FROM tblcase (NOLOCK) WHERE case_id = @strCaseId  and DomainId=@DomainId)
	SET @our_discovery_demands = (SELECT our_discovery_demands FROM tblcase (NOLOCK) WHERE case_id = @strCaseId  and DomainId=@DomainId)

	 SET @Min_DOS_Start=(SELECT min(DateOfService_Start)as DOS_Start FROM tblTreatment (NOLOCK) WHERE Case_Id = @strCaseId  and DomainId=@DomainId )  
     SET @Max_DOS_End=(SELECT max(DateOfService_End)as DOS_End FROM tblTreatment (NOLOCK) WHERE Case_Id =  @strCaseId  and DomainId=@DomainId )
		
	 SELECT @TotalLitigationAmount= SUM(Transactions_Amount) FROM tblTransactions  (NOLOCK)
	 WHERE Transactions_Type IN('LF','NLC','CF') 
	 AND  Case_Id=@strCaseId  AND DomainId=@DomainId


	 	 
	SET @i_case_age =	CASE WHEN @DomainId = 'amt' THEN CASE WHEN @dt_SETtlement IS NULL AND @dt_paid_full IS NULL AND @dt_withdrawn IS NULL THEN DATEDIFF(day,@Max_DOS_End,GETDATE()) 
						WHEN @dt_SETtlement IS NOT NULL AND @dt_paid_full IS NULL AND @dt_withdrawn IS NULL THEN  DATEDIFF(day,@Max_DOS_End,@dt_SETtlement)
						WHEN @dt_paid_full IS NOT NULL AND @dt_SETtlement IS NULL AND @dt_withdrawn IS NULL THEN DATEDIFF(day,@Max_DOS_End,@dt_paid_full)
						WHEN @dt_withdrawn IS NOT NULL AND @dt_paid_full IS NULL AND @dt_SETtlement IS NULL THEN DATEDIFF(day,@Max_DOS_End,@dt_withdrawn)
						ELSE DATEDIFF(day,@Max_DOS_End,GETDATE()) END ELSE CASE WHEN @dt_SETtlement IS NULL AND @dt_paid_full IS NULL AND @dt_withdrawn IS NULL THEN  
						DATEDIFF(DAY,@dt_opened,GETDATE()) WHEN @dt_SETtlement IS NOT NULL AND @dt_paid_full IS NULL AND @dt_withdrawn IS NULL THEN
						DATEDIFF(DAY,@dt_opened,@dt_SETtlement) WHEN @dt_paid_full IS NOT NULL AND @dt_SETtlement IS NULL AND @dt_withdrawn IS NULL THEN
						DATEDIFF(day,@dt_opened,@dt_paid_full) WHEN @dt_withdrawn IS NOT NULL AND @dt_paid_full IS NULL AND @dt_SETtlement IS NULL 
						THEN DATEDIFF(day,@dt_opened,@dt_withdrawn) ELSE DATEDIFF(day,@dt_opened,GETDATE()) END END
	
	
	SET @i_a_status_change_Age  = (SELECT DATEDIFF(dd,Date_Status_Changed,GETDATE()) FROM tblcase  (NOLOCK) WHERE case_id = @strCaseId and DomainId=@DomainId)
	
	
    
    SET @denialreason_type=(SELECT(SELECT COALESCE(CAST(DenialReason AS VARCHAR(MAX))+' , ','')   
	FROM			tbl_Case_Denial (NOLOCK)
	INNER JOIN		MST_DenialReasons  (NOLOCK) 
	ON				MST_DenialReasons .PK_Denial_ID=tbl_Case_Denial .FK_Denial_ID 
	WHERE			tbl_Case_Denial.DomainId=@DomainId and Case_Id=@strCaseId	FOR XML PATH('')) AS aaa);


	--SELECT * ,	ab.Claim_Amount,@i_case_age [case_age],
	SELECT   * , Claim_Amount,
	            @i_case_age [case_age],
				@i_a_status_change_Age AS Status_Change_Age,
				CONVERT(NVARCHAR,@Min_DOS_Start,101) [DOS_Start],
				CONVERT(NVARCHAR,@Max_DOS_End,101) [DOS_End],
				@denialreason_type AS DenialReasons_Type1,
				@our_discovery_demands AS Our_Discovery_Demands,
				ISNULL(@TotalLitigationAmount,0) TotalLitigationAmount
				FROM		LCJ_VW_CaseSearchDetails AS ab  (NOLOCK)
	WHERE		ab.DomainId =@DomainId  and ab.Case_Id = + @strCaseId 

END







GO
