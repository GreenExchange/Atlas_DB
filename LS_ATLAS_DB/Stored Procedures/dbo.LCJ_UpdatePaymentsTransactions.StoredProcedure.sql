USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdatePaymentsTransactions]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LCJ_UpdatePaymentsTransactions]   
   @DomainId NVARCHAR(50),
   @Case_Id nvarchar(3000),  
   @Provider_Id nvarchar(50),  
   @Transactions_Amount MONEY,  
   @Transactions_Date DATETIME,  
   @Transactions_Type NVARCHAR(10),  
   @Transactions_Description nvarchar(3950),  
   @User_Id nvarchar(100),  
   @transactions_status varchar(10),  
   @ChequeNo varchar(50),
   @CheckDate Datetime = Null,
   @BatchNo varchar(100),
   @TreatmentIds varchar(500),
   @Transactions_Id int = NULL
AS
BEGIN
	 DECLARE @notes nvarchar(4000),@initial_status varchar(50)
set @Notes = 'Payment/Transaction posted :'+' $'+ CONVERT(VARCHAR(10),@Transactions_Amount)++' '+'('+ @Transactions_Type+') Desc->'+@Transactions_Description

BEGIN  
	BEGIN  
  -- Insert the records  
		BEGIN TRAN  
			INSERT INTO tblNotes
			(
				Notes_Desc,
				Notes_Type,
				Notes_Priority,
				Case_Id,
				Notes_Date,
				User_Id,
				DomainId
			)
			VALUES
			(
				@Notes,
				'Activity',
				'0',
				@Case_Id,
				getdate(),
				@User_Id,
				@DomainId
			)
			-- 
			--Transactions_Fee 
			DECLARE @Transactions_Fee MONEY =0.00
			-- Bit to update prelit cases paid amount
			DECLARE @i_a_ACTIVE_CASE INT = 0
			 
			IF ((@Transactions_Type = 'C' or @Transactions_Type = 'PreC' or @Transactions_Type = 'PreCToP' or @Transactions_Type = 'PreI') AND @Case_Id NOT like 'ACT%')
			BEGIN
				SET @Transactions_Fee = (select @Transactions_Amount * (SELECT  isnull(Provider_Billing,0) FROM TBLPROVIDER WHERE PROVIDER_ID=@Provider_Id and DomainId=@DomainId) /100 )
			END
			ELSE IF ((@Transactions_Type = 'C' or @Transactions_Type = 'PreC' or @Transactions_Type = 'PreCToP' or @Transactions_Type = 'PreI') AND @Case_Id like 'ACT%')
			BEGIN
				SET @Transactions_Fee = (select @Transactions_Amount * (SELECT  isnull(Provider_Initial_Billing,0) FROM TBLPROVIDER WHERE PROVIDER_ID=@Provider_Id and DomainId=@DomainId) /100 )
				SET @i_a_ACTIVE_CASE = 1
			END
			ELSE IF (@Transactions_Type = 'I' AND @Case_Id NOT like 'ACT%')
			BEGIN
				SET @Transactions_Fee = (select @Transactions_Amount * (SELECT  isnull(Provider_IntBilling,0) FROM TBLPROVIDER WHERE PROVIDER_ID=@Provider_Id and DomainId=@DomainId) /100 )
			END
			ELSE IF (@Transactions_Type = 'I' AND @Case_Id like 'ACT%')
			BEGIN
				SET @Transactions_Fee = (select @Transactions_Amount * (SELECT  isnull(Provider_Initial_IntBilling,0) FROM TBLPROVIDER WHERE PROVIDER_ID=@Provider_Id and DomainId=@DomainId) /100 )
			END


			IF @transactions_status = 'X'  
			BEGIN  
			  Update tblTransactions Set
			   Transactions_Amount =  @Transactions_Amount,
			   Transactions_Date =   Convert(nvarchar(15), @Transactions_Date, 101),
			   Transactions_Type =   @Transactions_Type,  
			   Transactions_Description = @Transactions_Description, 
			   User_id =  @User_Id,
			   Transactions_status =  @transactions_status,
			   Transactions_Fee =  isnull(@Transactions_Fee,0.00),
			   ChequeNo = @ChequeNo,
			   CheckDate =  @CheckDate,
			   BatchNo =   @BatchNo,
			   TreatmentIds = @TreatmentIds
			   Where Transactions_Id = @Transactions_Id and DomainId = @DomainId
	      
			END  
			ELSE  
			BEGIN  
			 Update tblTransactions Set
			   Transactions_Amount =  @Transactions_Amount,
			   Transactions_Date =   Convert(nvarchar(15), @Transactions_Date, 101),
			   Transactions_Type =   @Transactions_Type,  
			   Transactions_Description = @Transactions_Description, 
			   User_id =  @User_Id,
			   Transactions_status =  @transactions_status,
			   Transactions_Fee =  isnull(@Transactions_Fee,0.00),
			   ChequeNo = @ChequeNo,
			   CheckDate =  @CheckDate,
			   BatchNo =   @BatchNo,
			   TreatmentIds = @TreatmentIds
			   Where Transactions_Id = @Transactions_Id and DomainId = @DomainId
			
			END  

			
			
			IF(@Transactions_Type IN ('PreC','PreCToP','PreI'))
			BEGIN
				DECLARE @i_l_Treat_Count INT 
				DECLARE @d_Transactions_Amount MONEY

				If(@TreatmentIds is not null and @TreatmentIds != '')
				BEGIN
					SET @i_l_Treat_Count = (select ISNULL(count(case_id),0) from tblTreatment where DomainId=@DomainId and Case_Id=@Case_Id and Treatment_Id in (Select items from SplitStringInt(@TreatmentIds, ',')))
					SET @d_Transactions_Amount = @Transactions_Amount

					IF(@i_l_Treat_Count = 1 AND @DomainID IN ('GLF','AMT'))
					BEGIN
						UPDATE tblTreatment SET Paid_Amount = @Transactions_Amount WHERE DomainId=@DomainId and Case_Id = @Case_Id and Treatment_Id in (Select items from SplitStringInt(@TreatmentIds, ','))
					END
					ELSE IF(@i_l_Treat_Count > 0 AND @DomainID NOT IN ('GLF','AMT'))
					BEGIN
						UPDATE tblTreatment SET Paid_Amount = CONVERT(MONEY,(@d_Transactions_Amount/@i_l_Treat_Count)) WHERE DomainId=@DomainId and Case_Id = @Case_Id and Treatment_Id in (Select items from SplitStringInt(@TreatmentIds, ','))
					END
				END
				ELSE
				BEGIN
					SET @i_l_Treat_Count = (select ISNULL(count(case_id),0) from tblTreatment where DomainId=@DomainId and Case_Id=@Case_Id)
					SET @d_Transactions_Amount = (select ISNULL(SUM(Transactions_Amount),0) from tblTransactions where DomainId=@DomainId and Case_Id=@Case_Id and Transactions_Type IN ('PreC','PreCToP'))

					IF(@i_l_Treat_Count = 1 AND @DomainID IN ('GLF'))
					BEGIN
						UPDATE tblTreatment SET Paid_Amount = @Transactions_Amount WHERE DomainId=@DomainId and Case_Id = @Case_Id
					END
					ELSE IF(@i_l_Treat_Count > 0 AND @DomainID NOT IN ('GLF'))
					BEGIN
						UPDATE tblTreatment SET Paid_Amount = CONVERT(MONEY,(@d_Transactions_Amount/@i_l_Treat_Count)) WHERE DomainId=@DomainId and Case_Id = @Case_Id
					END
				END

				-- Commented below condition becuase Trigger is already applied on Transactions tblTreatment table. and that automatically update the paid amount
				-- UPDATE tblcase SET Paid_Amount = @d_Transactions_Amount  WHERE  DomainId=@DomainId and Case_Id = @Case_Id  

				DECLARE @s_l_OldStatus VARCHAR(200)
				DECLARE @s_l_NewStatus VARCHAR(200)
				DECLARE @s_l_DESC VARCHAR(200)
				
				IF @DomainID IN ('AF','LOCALHOST')
				BEGIN

					SET @s_l_OldStatus = (SELECT Status FROM tblCASE WHERE case_id = @Case_Id and DomainId = @DomainId)
					SET @s_l_NewStatus = 'BILLING - PAYMENT'
					SET @s_l_DESC = 'Status changed from ' + @s_l_OldStatus  + ' to ' + @s_l_NewStatus

					UPDATE TBLCASE SET STATUS = @s_l_NewStatus WHERE Case_Id = @Case_Id

					exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@Case_Id,@notes_type='Activity' ,@NDesc=@s_l_DESC,@user_id='system',@applytogroup=0
				END	
			END

		COMMIT TRAN  
   END 
END


END
GO
