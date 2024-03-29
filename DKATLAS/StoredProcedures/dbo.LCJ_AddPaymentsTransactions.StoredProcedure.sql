USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddPaymentsTransactions]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddPaymentsTransactions]  
--[LCJ_AddPaymentsTransactions] 'FL13-118','40901','50.00','12/12/2014','C','','admin',''


(  
  
   @Case_Id nvarchar(3000),  
   @Provider_Id nvarchar(50),  
   @Transactions_Amount MONEY,  
   @Transactions_Date DATETIME,  
   @Transactions_Type NVARCHAR(10),  
   @Transactions_Description nvarchar(3950),  
   @User_Id nvarchar(100),  
   @transactions_status varchar(10),
   @ChequeNo varchar(50),
   @CheckDate DATETIME,
   @BatchNo varchar(100)  
  
)  
AS  

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
				User_Id
			)
			VALUES
			(
				@Notes,
				'Activity',
				'0',
				@Case_Id,
				getdate(),
				@User_Id
			)
			
			--Transactions_Fee 
			DECLARE @Transactions_Fee MONEY =0.00
			IF (@Transactions_Type = 'C' or @Transactions_Type = 'PreC' or @Transactions_Type = 'PreCToP' or  @Transactions_Type = 'I')
			BEGIN
				SET @Transactions_Fee = (select @Transactions_Amount * (SELECT  isnull(Provider_Billing,0) FROM TBLPROVIDER WHERE PROVIDER_ID=@Provider_Id) /100 )
			END
			

			IF @transactions_status = 'X'  
			BEGIN  
			  INSERT INTO tblTransactions  
			  (  
			   Case_Id,  
			   Provider_Id,  
			   Transactions_Amount,  
			   Transactions_Date,  
			   Transactions_Type,  
			   Transactions_Description,  
			   User_id,  
			   Transactions_status,
			   Transactions_Fee, 
			   ChequeNo,
			   CheckDate,
			   BatchNo
			  )  
			  VALUES
			  (  
			    
			   @Case_Id,  
			   @Provider_Id,  
			   @Transactions_Amount,  
			   Convert(nvarchar(15), @Transactions_Date, 101),     
			   @Transactions_Type,  
			   @Transactions_Description,  
			   @User_Id,  
			   @transactions_status ,
			   isnull(@Transactions_Fee,0.00),
			   @ChequeNo,
			   Convert(nvarchar(15), @CheckDate, 101),			   
			   @BatchNo
			  )       
			END  
			ELSE  
			BEGIN  
			  INSERT INTO tblTransactions  
			  (  
			   Case_Id,  
			   Provider_Id,  
			   Transactions_Amount,  
			   Transactions_Date,  
			   Transactions_Type,  
			   Transactions_Description,  
			   Transactions_Fee,
			   User_id ,
			   ChequeNo,
			   CheckDate,
			   BatchNo 
			  )  
			  VALUES
			  (  
			   @Case_Id,  
			   @Provider_Id,  
			   @Transactions_Amount,  
			   Convert(nvarchar(15), @Transactions_Date, 101),     
			   @Transactions_Type,  
			   @Transactions_Description,  
			   isnull(@Transactions_Fee,0.00),
			   @User_Id ,
			   @ChequeNo,
			   Convert(nvarchar(15), @CheckDate, 101),			   
			   @BatchNo
			  )  
			END  
			
			SET NOCOUNT ON
				IF EXISTS (SELECT dbo.[SJR-SETTLED_PAYMENTS_FULL].Case_Id, dbo.[SJR-SETTLED_PAYMENTS_FULL].Payments, dbo.[SJR-SETTLEMENTS_FULL].Sett_tot,
						dbo.[SJR-SETTLEMENTS_FULL].STATUS
						FROM         dbo.[SJR-SETTLED_PAYMENTS_FULL] INNER JOIN
						dbo.[SJR-SETTLEMENTS_FULL] ON dbo.[SJR-SETTLED_PAYMENTS_FULL].Case_Id = dbo.[SJR-SETTLEMENTS_FULL].Case_Id  INNER JOIN
						dbo.TBLCASE ON dbo.TBLCASE.CASE_ID = dbo.[SJR-SETTLEMENTS_FULL].Case_Id
						WHERE (dbo.[SJR-SETTLEMENTS_FULL].Sett_tot <= dbo.[SJR-SETTLED_PAYMENTS_FULL].Payments+30)AND (dbo.Tblcase.Case_id = @Case_ID)
						and dbo.[SJR-SETTLEMENTS_FULL].status not like '%CLOSED%')
				BEGIN 
						UPDATE TBLCASE 
						SET STATUS ='CLOSED',Date_Closed=GETDATE()
						FROM  dbo.[SJR-SETTLED_PAYMENTS_FULL] INNER JOIN
						dbo.[SJR-SETTLEMENTS_FULL] ON dbo.[SJR-SETTLED_PAYMENTS_FULL].Case_Id = dbo.[SJR-SETTLEMENTS_FULL].Case_Id  INNER JOIN
						dbo.TBLCASE ON dbo.TBLCASE.CASE_ID = dbo.[SJR-SETTLEMENTS_FULL].Case_Id
						WHERE (dbo.[SJR-SETTLEMENTS_FULL].Sett_tot <= dbo.[SJR-SETTLED_PAYMENTS_FULL].Payments+30)AND (dbo.Tblcase.Case_id = @Case_ID)


					exec LCJ_AddNotes @case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = 'Case automatically closed by system .All payments received.    >>XM-002',@user_Id='SYSTEM',@ApplyToGroup = 0
				END
			SET NOCOUNT OFF
		COMMIT TRAN  
   END -- END of ELSE   
END
GO
