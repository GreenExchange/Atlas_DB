USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Update_Cases_Current_Status]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Cases_Current_Status]
	@DomainId NVARCHAR(50),
	@status varchar(100),
	@case_status varchar(100)='',
	@case_id varchar(20),
	@User_Id varchar(50),
    @Desc nvarchar(2000)='',
    @NoteType varchar(100)='',
    @CourtId varchar(100)='',
	@DefendantID varchar(100)='',
    @ProviderID int=0,
	@IndexOrAAAno varchar(100)='',
	@InsuranceCompany_Id varchar(100)=''
AS
BEGIN
    Declare @NDesc varchar(max),
    --@Description nvarchar(2000),
	@old_stat_hierc int,  
	@new_stat_hierc int,
	@motion_stat_hierc smallint,
	@PROVIDER_ID nvarchar(50) ,
	@provider_ff nchar(10),
	@status_bill money,
	@status_bill_type nvarchar(20),
	@status_bill_notes varchar(200),
	@st varchar(MAX)

	DECLARE @OldValue VARCHAR(100), @newValue VARCHAR(100)

	if(@CourtId <>'')
	begin
		SET @OldValue = ISNULL((select ISNULL(Court_Name,'') from tblcase ca (NOLOCK) JOIN tblCourt co (NOLOCK)  ON ca.Court_Id = co.Court_Id where ca.case_id = @Case_Id),'')
		SET @newValue = ISNULL((SELECT ISNULL(Court_Name,'') FROM tblCourt (NOLOCK) WHERE Court_Id = @CourtId),'')
		
		IF(ISNULL(@OldValue,'') <> ISNULL(@newValue,''))
		BEGIN
			set @NDesc = 'Court_Id changed from '+ @OldValue +' to ' + @newValue
			update tblcase set Court_Id = @CourtId	where Case_Id = @case_id and DomainId=@DomainId	

		   insert into tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id, DomainId)
		   values (@NDesc,'Activity',1,@Case_Id,getdate(),@User_Id,@DomainId)
		END
	end

	---      START Defendant CHANGE -------------------
	if(@DefendantID <>'')
	begin
	
		SET @OldValue = (SELECT Upper(ISNULL(Defendant_DisplayName, '')) from tblDefendant (NOLOCK)  WHERE Defendant_Id in (SELECT Defendant_Id FROM tblcase WHERE Case_Id = @Case_Id and DomainId=@DomainId	))
		SET @newValue = (SELECT Upper(ISNULL(Defendant_DisplayName, '')) from tblDefendant (NOLOCK)  WHERE Defendant_Id = @DefendantID and DomainId=@DomainId)

		IF ISNULL(@OldValue,'') <> ISNULL(@newValue,'')
		BEGIN
		
			set @NDesc = 'Defendant_ID changed from '+ ISNULL(@OldValue,'') +' to ' + ISNULL(@newValue,'')
			
			update tblcase set Defendant_ID =@DefendantID where Case_Id =@case_id and DomainId=@DomainId		
			
			exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc, @user_Id=@User_Id, @ApplyToGroup = 0  
		END
	end
	---      END Defendant CHANGE --------------------	
    ---- START PROVIDER CHANGE-----------------------
	if(@ProviderID<>0)
	begin
		SET @OldValue = (SELECT Upper(ISNULL(Provider_Name, '')) from tblProvider (NOLOCK) WHERE Provider_Id in (SELECT Provider_Id FROM tblcase (NOLOCK)  WHERE Case_Id = @Case_Id and DomainId=@DomainId	))
		SET @newValue = (SELECT Upper(ISNULL(Provider_Name, '')) from tblProvider (NOLOCK) WHERE Provider_Id = @ProviderID and DomainId=@DomainId)

		IF ISNULL(@OldValue,'') <> ISNULL(@newValue,'')
			BEGIN
		
				set @NDesc = 'Provider_ID changed from '+ ISNULL(@OldValue,'') +' to ' + ISNULL(@newValue,'')
			
				update tblcase set Provider_Id =@ProviderID where Case_Id =@case_id and DomainId=@DomainId		
			
				exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc, @user_Id=@User_Id, @ApplyToGroup = 0  
			END
	end
	----END PROVIDER CHANGE
	----- START Insurance Company Change----------------

	if(@InsuranceCompany_Id<>'')
	Begin
	 SET @OldValue = (SELECT Upper(ISNULL(InsuranceCompany_Name, '')) from tblInsuranceCompany (NOLOCK)  WHERE InsuranceCompany_Id in (SELECT InsuranceCompany_Id FROM tblcase WHERE Case_Id = @Case_Id and DomainId=@DomainId	))
	 SET @newValue = (SELECT Upper(ISNULL(InsuranceCompany_Name, '')) from tblInsuranceCompany (NOLOCK)  WHERE InsuranceCompany_Id = @InsuranceCompany_Id and DomainId=@DomainId)
	
	   IF ISNULL(@OldValue,'') <> ISNULL(@newValue,'')
		BEGIN
		    set @NDesc = 'Insurance Company changed from '+ ISNULL(@OldValue,'') +' to ' + ISNULL(@newValue,'')

			update tblcase set InsuranceCompany_Id = @InsuranceCompany_Id where Case_Id =@case_id and DomainId=@DomainId
			
			exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc, @user_Id=@User_Id, @ApplyToGroup = 0  

		END
	End

	-----------End Insurance Company Change-------------
		
    ---      START INDEX OR AAA CHANGE ------------------
	if(@IndexOrAAAno <>'')
	begin
		
		SET @OldValue = (SELECT IndexOrAAA_Number FROM tblCase (NOLOCK)  WHERE Case_ID = @Case_Id and DomainId = @DomainId) 
		SET @newValue = @IndexOrAAAno 
		
		IF ISNULL(@OldValue,'') <> ISNULL(@newValue,'')
		BEGIN
		
			SET @NDesc ='IndexOrAAA_Number changed from '+ ISNULL(@OldValue,'') +' to ' + ISNULL(@newValue,'')
			 
			update tblcase set IndexOrAAA_Number =@IndexOrAAAno	where Case_Id =@case_id	and DomainId = @DomainId
			
			exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc, @user_Id=@User_Id, @ApplyToGroup = 0 
		END
		
	end
	---      END INDEX OR AAA CHANGE --------------------	

	if(@case_status<>'')
	begin
	  set @NDesc = 'Initial_Status changed from '+ (select Initial_Status from tblcase (NOLOCK)  where case_id = @Case_Id) +' to ' + @case_status
	   update tblcase
	   set  Initial_Status = @case_status
	   where case_id = @case_id
   	
	   insert into tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id, DomainId)
	   values (@NDesc,'Activity',1,@Case_Id,getdate(),@User_Id,@DomainId)
    end
        
	if(@Desc<>'')
    begin
    insert into tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id,DomainId)
	values (@Desc,@NoteType,1,@Case_Id,getdate(),@User_Id,@DomainId)
	end
	
	if(@status<>'')
	begin
	
			DECLARE @oldStatus NVARCHAR(500)
			DECLARE @newStatus NVARCHAR(500)

			SET @oldStatus = (select status from tblcase (NOLOCK)  where case_id = @Case_Id and DomainId=@DomainId)
			SET @newStatus=@status
	

            SELECT @old_stat_hierc = STATUS_HIERARCHY FROM Tblstatus (NOLOCK)  INNER JOIN TBLcase (NOLOCK)  ON dbo.tblcase.status = dbo.tblstatus.status_Type
			where dbo.tblcase.case_id=@Case_id AND dbo.tblcase.status=@oldStatus  and tblcase.DomainId=@DomainId

		
			SELECT @new_stat_hierc = STATUS_HIERARCHY ,@status_bill = auto_bill_amount ,@status_bill_type = auto_bill_type,
				   @status_bill_notes=auto_bill_notes
			FROM Tblstatus
			 where status_type=@newStatus
			  and DomainId=@DomainId


			if(@oldStatus <> @newStatus)
			BEGIN
				UPDATE tblcase SET STATUS = @newStatus WHERE CASE_ID = @Case_Id AND DomainId = @DomainId
				set @NDesc = 'Status changed from ' + @oldStatus + ' to ' + @newStatus       
				exec LCJ_AddNotes @DomainId=@DomainId,@case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc,@user_Id=@User_Id,@ApplyToGroup = 0  
			end

			--if(@User_Id<>'ljainarine')
			-- BEGIN
				--IF ((@new_stat_hierc < @old_stat_hierc) OR (@new_stat_hierc < 900 AND @motion_stat_hierc = 1)) and @user_id <>'srosenthal'
				--BEGIN
				--	set @NDesc = 'Status Hierarchy Constraint error :status cannot be changed from ' + @oldStatus + ' to ' + @newStatus +'.  >>XM-003'       
				--	exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc,@user_Id=@User_Id,@ApplyToGroup = 0
				--	RETURN
				--END
			 -- END
			--IF @status_bill > 0
			--BEGIN

			--	SELECT @provider_id=tblcase.provider_id ,@provider_ff = tblProvider.provider_ff 
			--	FROM   tblProvider INNER JOIN tblcase ON tblProvider.Provider_Id = tblcase.Provider_Id
			--	WHERE tblcase.case_id =@case_id  and tblcase.DomainId=@DomainId


			--	INSERT INTO TBLTRANSACTIONS(CASE_ID,TRANSACTIONS_TYPE,TRANSACTIONS_DATE,TRANSACTIONS_AMOUNT,TRANSACTIONS_DESCRIPTION,PROVIDER_ID,TRANSACTIONS_FEE,USER_ID, DomainId)
			--	VALUES (@case_id,@status_bill_type,GETDATE(),@status_bill,@status_bill_notes,@PROVIDER_ID,@status_bill,@USER_ID,@DomainId)

			--	set @NDesc = 'Payment/Transaction posted :'+ CONVERT(VARCHAR(20),@status_bill) +' '+'('+ @status_bill_type +') Desc-> ' + @status_bill_notes + '. New Status-> '+ @newStatus + ' .' 
			--	exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @NDesc,@user_Id=@User_Id,@ApplyToGroup = 0
   --        END
	 	
		 
		
	
	END

	
End

GO
