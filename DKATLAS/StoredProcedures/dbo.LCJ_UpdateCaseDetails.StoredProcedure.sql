USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdateCaseDetails]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----[LCJ_UpdateCaseDetails] 'FDNY14-3023','','test','lblinsclaimrep','fassfirm','','test'

CREATE PROCEDURE [dbo].[LCJ_UpdateCaseDetails](        
@Case_Id nvarchar(200),        
@oldValue nvarchar(200),        
@newValue nvarchar(200),        
@fieldName nvarchar(200),        
@user_id nvarchar(50),        
@oldTextName nvarchar(200),        
@newTextName nvarchar(200)
       
)        
as        
BEGIN        
        
	declare        
	@st nvarchar(200),        
	@desc varchar(200),
	@Date_Answer_Expected datetime,
	@old_stat_hierc int,  
	@new_stat_hierc int,
	@motion_stat_hierc smallint,
	@PROVIDER_ID nvarchar(50) ,
	@provider_ff nchar(10),
	@status_bill money,
	@status_bill_type nvarchar(20),
	@status_bill_notes varchar(200),
	@current_status nvarchar(300)

	IF (@fieldName='location_id')
	BEGIN
		IF(@newValue=1)
		set @newValue =null;		
	END
	ELSE IF @fieldName = 'DateFile_Trial_DeNovo'  --ARB WON UPDATER
	BEGIN 
		IF @newvalue <=GETDATE()
		BEGIN
			SET @current_status=(select status from tblcase where case_id=@Case_Id)
			IF @current_status = 'ARB WON-NOTICE OF ENTRY'
			BEGIN
				update tblcase
				SET STATUS='ARB WON-FLAG FOR JUDGMENT',Last_Status='ARB WON-NOTICE OF ENTRY'
				where Case_Id =@Case_Id
				exec LCJ_AddNotes @case_id=@case_id,@notes_type='Activity' ,@NDesc='Status changed to ARB WON-FLAG FOR JUDGMENT by system.>>>' ,@user_id='system',@applytogroup=0
			END
		END
	END
	ELSE IF @fieldName = 'DateOfService_Start' or @fieldName = 'DateOfService_END' or @fieldName = 'Claim_Amount' or @fieldName = 'Paid_Amount' or @fieldName ='Date_BillSent' or @fieldName = 'stips_signed_and_returned' or @fieldName = 'stips_signed_and_returned_2' or @fieldName = 'stips_signed_and_returned_3'      
	BEGIN        
		 IF @fieldName = 'Claim_Amount' or  @fieldName = 'Paid_Amount' or @fieldName = 'stips_signed_and_returned' or @fieldName = 'stips_signed_and_returned_2' or @fieldName = 'stips_signed_and_returned_3'        
			set @st = 'update tblcase set ' + @fieldName + '= ' + @newvalue + '  where Case_Id in ('''+@Case_Id + ''')'        
		 ELSE        
			set @st = 'update tblcase set ' + @fieldName + '= ''' + @newvalue + '''  where Case_Id in ('''+@Case_Id + ''')'        
		        
		 exec sp_Executesql @st         
	END     
	ELSE IF @fieldName = 'Date_Answer_Received'  -- Date_Answer_Received Start
    BEGIN    
			SET NOCOUNT ON
			set @st = 'update tblcase set ' + @fieldName + '= ''' + @newvalue + ''' where case_id in ('''+@Case_Id +''')'     
			exec sp_Executesql @st    
			SELECT @Date_Answer_Expected = (CASE WHEN (Date_Ext_Of_Time_3 IS NOT NULL) 
							  THEN (Date_Ext_Of_Time_3 + 5) WHEN (Date_Ext_Of_Time_2 IS NOT NULL) AND (Date_Ext_Of_Time_3 IS NULL) 
							  THEN (Date_Ext_Of_Time_2 + 5) WHEN (Date_Ext_Of_Time IS NOT NULL) AND (Date_Ext_Of_Time_2 IS NULL) 
							  THEN (Date_Ext_Of_Time + 5) WHEN (Date_Ext_Of_Time IS NULL) AND (ISNULL(InsuranceCompany_GroupName,'') NOT LIKE '%GEICO%') THEN (Date_Afidavit_Filed + 45) 
							  WHEN (Date_Ext_Of_Time IS NULL) AND (ISNULL(InsuranceCompany_GroupName,'') LIKE '%GEICO%') THEN (Served_on_date + 65) END )
					FROM         dbo.tblcase INNER JOIN
							  dbo.tblInsuranceCompany ON dbo.tblcase.InsuranceCompany_Id = dbo.tblInsuranceCompany.InsuranceCompany_Id
					WHERE     (dbo.tblcase.Status = N'AFFIDAVITS FILED IN COURT') AND (dbo.tblcase.case_id=@case_id)
			
			IF @Date_Answer_Expected >= Convert(datetime,@Newvalue)
			BEGIN 
				update tblcase
				set status = 'ANSWER-RECD' where Case_Id = @Case_Id
				exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = 'STATUS CHANGED TO ANSWER-RECD BY SYSTEM >> XM-001' ,@user_Id='SYSTEM',@ApplyToGroup = 0
				GOTO FINISH
			END
			IF @Date_Answer_Expected < Convert(datetime,@Newvalue)
			BEGIN 
				set @desc = 'STATUS CHANGED TO ANSWER-RCVD-LATE BY SYSTEM. ANSWER DEADLINE WAS : '+convert(varchar(12),@Date_Answer_Expected,101)+'          >> XM-001'
				update tblcase
				set status = 'ANSWER-RCVD-LATE' where Case_Id = @Case_Id
				exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc ,@user_Id='SYSTEM',@ApplyToGroup = 0
				GOTO FINISH
			END
		END -- Date_Answer_Received END
	ELSE IF @FieldName ='Status' -- Update on 12-11-07 ::Provision for Status Hierarchy.
		BEGIN
			SET NOCOUNT ON
			IF @newTextName = '21 days on hold PENDing Peer Review' OR @newTextName = '21 days on hold pENDing IME Report' OR @newTextName = '21 days on hold pENDing IME REPORT/PEER REVIEW'
			BEGIN
				IF EXISTS(SELECT 1 FROM MST_STATUS_LOG WHERE CASE_ID=@Case_id)
				BEGIN
					UPDATE MST_STATUS_LOG SET STATUS_BIT = 1, DATE_CHANGED = getdate() WHERE CASE_ID=@Case_id
				END
				ELSE
				BEGIN
					INSERT INTO MST_STATUS_LOG(CASE_ID,DATE_CHANGED,STATUS_BIT) VALUES(@Case_id,getdate(),1)
				END
			END
			ELSE IF @oldTextName = '21 days on hold PENDing Peer Review' OR @oldTextName = '21 days on hold pENDing IME Report' OR @oldTextName = '21 days on hold pENDing IME REPORT/PEER REVIEW'
			BEGIN
					UPDATE MST_STATUS_LOG SET STATUS_BIT = 0 WHERE CASE_ID=@Case_id
			END

			--PENDING ASSIGNMENT
			IF @newTextName = 'Pending' or @newTextName = 'AAA Pending' or @newTextName = 'AAA PPO Pending'
			BEGIN
				exec sp_assign_pending_work_desk @Case_Id=@Case_Id
			END

			-- for settled status change
			IF @newTextName = 'Settled'
			BEGIN
				IF EXISTS(SELECT 1 FROM TXN_ASSIGN_SETTLED_CASES WHERE CASE_ID=@Case_id)
				BEGIN
					UPDATE TXN_ASSIGN_SETTLED_CASES SET isChanged = 1, DATE_CHANGED = getdate(), USER_ID = @User_Id WHERE CASE_ID=@Case_id
				END
				ELSE
				BEGIN
					INSERT INTO TXN_ASSIGN_SETTLED_CASES(CASE_ID,USER_ID,DATE_CHANGED,isChanged) VALUES(@Case_id,@User_Id,getdate(),1)
				END
			END
			ELSE IF @oldTextName = 'Settled'
			BEGIN
				UPDATE TXN_ASSIGN_SETTLED_CASES SET isChanged = 0 WHERE CASE_ID=@Case_id
			END

			-- for answer received, ASSIGN CASE TO JOE, ERIN, DANA
			IF @newTextName = 'ANSWER-RECD'
			BEGIN
				exec [SP_ASSIGN_REDCAT_DENIAL_REASONS] @Case_id
			END


			SELECT @old_stat_hierc = STATUS_HIERARCHY FROM Tblstatus INNER JOIN TBLcase ON dbo.tblcase.status = dbo.tblstatus.status_Type
			where dbo.tblcase.case_id=@Case_id AND dbo.tblcase.status=@OldValue


			SELECT @motion_stat_hierc = STATUS_HIERARCHY FROM TblMotion_Status INNER JOIN TBLcase ON dbo.tblcase.Motion_Status = dbo.tblMotion_Status.status_desc
			where dbo.tblcase.case_id=@Case_id

			SELECT @new_stat_hierc = STATUS_HIERARCHY ,@status_bill = auto_bill_amount ,@status_bill_type = auto_bill_type,
				   @status_bill_notes=auto_bill_notes
			FROM Tblstatus
			 where status_type=@newValue
			 
			IF ((@new_stat_hierc < @old_stat_hierc) OR (@new_stat_hierc < 900 AND @motion_stat_hierc = 1)) and @user_id <>'srosenthal'
			BEGIN
				set @desc = 'Status Hierarchy Constraint error :'+@fieldName +  ' cannot be changed from ' + @oldTextName + ' to ' + @newTextName +'.  >>XM-003'       
				exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@User_Id,@ApplyToGroup = 0
				RETURN
			END

			--IF @status_bill > 0
			--BEGIN

			--	SELECT @provider_id=tblcase.provider_id ,@provider_ff = tblProvider.provider_ff 
			--	FROM   tblProvider INNER JOIN tblcase ON tblProvider.Provider_Id = tblcase.Provider_Id
			--	WHERE tblcase.case_id =@case_id


			--	INSERT INTO TBLTRANSACTIONS(CASE_ID,TRANSACTIONS_TYPE,TRANSACTIONS_DATE,TRANSACTIONS_AMOUNT,TRANSACTIONS_DESCRIPTION,PROVIDER_ID,TRANSACTIONS_FEE,USER_ID)
			--	VALUES (@case_id,@status_bill_type,GETDATE(),@status_bill,@status_bill_notes,@PROVIDER_ID,@status_bill,@USER_ID)

			--	set @desc = 'Payment/Transaction posted :'+ CONVERT(VARCHAR(20),@status_bill) +' '+'('+ @status_bill_type +') Desc-> ' + @status_bill_notes + '. New Status-> '+ @newvalue + ' .' 
			--	exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@User_Id,@ApplyToGroup = 0

			--END

			HOP1:

			END -- END of Hierachy update on 12/11/07
	BEGIN        
		IF @newValue is null
		BEGIN
			set @st = 'update tblcase set ' + @fieldName + '= NULL where Case_Id in ('''+@Case_Id + ''')'
		END	
		ELSE
		BEGIN
			set @st = 'update tblcase set ' + @fieldName + '= ''' + @newvalue + ''' where Case_Id in ('''+@Case_Id + ''')'
		END    
          
		 print @st        
		 exec sp_Executesql @st  
	END    
	IF @fieldName = 'PROVIDER_ID'
	BEGIN 
		UPDATE tblTransactions set Provider_Id = @newvalue WHERE case_id = @Case_Id and ISNULL(Transactions_status,'') <> 'FREEZED'
	END   
	FINISH:  
	
	IF(@fieldName='UserId')    
	BEGIN    
	 set @fieldname='Assigned To'    
	END    

	set @desc = @fieldName +  ' changed from ' + @oldTextName + ' to ' + @newTextName       
	exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@User_Id,@ApplyToGroup = 0  
	
	-----FILING FEE ON INDEX CHANGE
	--IF (@fieldName='IndexOrAA  A_Number')
	--BEGIN
	--				--[LCJ_AddPaymentsTransactions] 'FH12-96305','40901','15500.00','12/12/2011','C','','tech',''
	--			SELECT @provider_id=provider_id FROM TBLCASE WHERE Case_Id=@Case_Id
	--			EXEC [LCJ_AddPaymentsTransactions] @Case_Id,@provider_id,'40.0000',GETDATE,'FBB','',@user_id,''
	--END
	
	
	
		 ---DateAAA_ResponceRecieved
	 IF(@fieldName='DateAAA_ResponceRecieved')  
	 BEGIN
		DECLARE @oldStatus NVARCHAR(200), @newStatus NVARCHAR(200),@newDesc nvarchar(1000)
		IF((SELECT DATEDIFF(DD,DateAAA_ResponceRecieved,Date_AAA_Concilation_Over) from tblcase where Case_Id = @Case_Id) < 0)
		BEGIN
			
			SET @oldStatus = (SELECT status FROM tblcase WHERE  Case_Id = @Case_Id)
			
			IF (@oldStatus ='AAA CONFIRMED')
				SET @newStatus ='AAA RESPONSE-RCVD-LATE'
			ELSE IF (@oldStatus ='AAA PPO CONFIRMED')
				SET @newStatus='AAA PPO RESPONSE-RCVD-LATE'
			ELSE
				SET @newStatus=''
				
			IF (@newStatus<>'')
			BEGIN	
				UPDATE tblcase
				SET Status=	@newStatus WHERE Case_Id = @Case_Id
				
				SET @newDesc = 'Status changed from ' + @oldStatus + ' to ' + @newStatus  
				
				exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @newDesc,@user_Id='System',@ApplyToGroup = 0
			END
		END
		IF((SELECT DATEDIFF(DD,DateAAA_ResponceRecieved,Date_AAA_Concilation_Over) from tblcase where Case_Id = @Case_Id) >= 0)
		BEGIN
			
			
			SET @oldStatus = (SELECT status FROM tblcase WHERE  Case_Id = @Case_Id)
			IF (@oldStatus ='AAA CONFIRMED')
				SET @newStatus ='AAA RESPONSE RCVD'
			ELSE IF (@oldStatus ='AAA PPO CONFIRMED')
				SET @newStatus='AAA PPO RESPONSE RCVD'
			ELSE
				SET @newStatus=''
				
			IF (@newStatus<>'')
			BEGIN	
				UPDATE tblcase
				SET Status=	@newStatus WHERE Case_Id = @Case_Id
				
				SET @newDesc = 'Status changed from ' + @oldStatus + ' to ' + @newStatus  
				exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @newDesc,@user_Id='System',@ApplyToGroup = 0
			END
		END
		
	 END   
	  -- IF(@fieldName='DenialReasons')  
	  --  BEGIN
			--DECLARE @DenialReasonType NVARCHAR(50)
			-- BEGIN
			--	SET @DenialReasonType=(SELECT DenialReason FROM MST_DenialReasons WHERE PK_Denial_ID=@newValue)
			--	UPDATE tblcase 
			--	SET DenialReasons_Type=@DenialReasonType where Case_Id=@Case_Id
			--	END
	  --  END 
	  -- IF (@fieldName='Date_Open_Verification_Response_Sent1')
	  --  BEGIN
			--UPDATE tblcase set   Date_Open_Verification_Response_Sent1  =  convert(datetime,@newTextName,103)  where case_id = @Case_Id     
	  --  END
	  -- IF (@fieldName='Date_Open_Verification_Response_Sent2')
	  --  BEGIN
		 --   UPDATE tblcase set   Date_Open_Verification_Response_Sent2  =  convert(datetime,@newTextName,103)  where case_id = @Case_Id     
	  --  END
	  -- IF (@fieldName='Date_of_AAA_Awards')
	  --  BEGIN
			--UPDATE tblcase set   Date_of_AAA_Awards  =  convert(datetime,@newTextName,103)  where case_id = @Case_Id     
	  --  END   
END
GO
