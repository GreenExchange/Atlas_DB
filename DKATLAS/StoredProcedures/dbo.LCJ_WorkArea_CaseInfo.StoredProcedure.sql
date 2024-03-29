USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkArea_CaseInfo]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_WorkArea_CaseInfo]--[LCJ_WorkArea_CaseInfo] 'RFA14-174165'   
(    
	@strCaseId NVARCHAR(100)    
)    
AS        
BEGIN
	declare @dt_settlement DATETIME
	declare @dt_paid_full DATETIME
	declare @dt_withdrawn DATETIME
	declare @dt_opened DATETIME
	declare @Min_DOS_Start DATETIME
    declare @Max_DOS_End DATETIME
     DECLARE @denialreason_type VARCHAR(8000)
   

	declare @i_case_age INT
    declare @i_a_status_change_Age INT
   
	set @dt_settlement = (select top 1 settlement_date from tblsettlements where case_id = @strCaseId)
	set @dt_paid_full = (select top 1 NOTES_DATE from TBLNOTES where case_id = @strCaseId AND notes_desc like '%to paid-full%' ORDER BY NOTES_DATE DESC)
	set @dt_withdrawn = (select top 1 NOTES_DATE from TBLNOTES where case_id = @strCaseId AND notes_desc like '%to WITHDRAWN%' ORDER BY NOTES_DATE DESC)
	set @dt_opened = (select date_opened from tblcase where case_id = @strCaseId)

	
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
	
	
	SET @i_a_status_change_Age  = (select DATEDIFF(dd,Date_Status_Changed,getdate()) from tblcase where case_id = @strCaseId)
	
	
    set @Min_DOS_Start=(select min(DateOfService_Start)as DOS_Start from tbltreatment where Case_Id = @strCaseId)  
    set @Max_DOS_End=(select max(DateOfService_End)as DOS_End from tbltreatment where Case_Id =  @strCaseId) 
    
    set @denialreason_type=(select(select COALESCE(CAST(DenialReason AS VARCHAR(MAX))+' , ','')   from tbl_Case_Denial inner join MST_DenialReasons on MST_DenialReasons.PK_Denial_ID=tbl_Case_Denial.FK_Denial_ID where Case_Id=@strCaseId	for xml path('')) as aaa);
	SELECT *,@i_case_age [case_age],@i_a_status_change_Age AS Status_Change_Age,convert(nvarchar,@Min_DOS_Start,101) [DOS_Start],convert(nvarchar,@Max_DOS_End,101) [DOS_End],@denialreason_type AS DenialReasons_Type1
	FROM LCJ_VW_CaseSearchDetails 
	where Case_Id = + @strCaseId 
	
END


--select batchcode from tblcase
GO
