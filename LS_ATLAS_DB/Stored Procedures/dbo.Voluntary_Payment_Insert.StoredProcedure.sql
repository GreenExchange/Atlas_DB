USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Voluntary_Payment_Insert]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Voluntary_Payment_Insert] 
   @s_a_Case_Id varchar(50),
   @d_a_Total_Collection decimal(18, 2),
   @d_a_Deductible decimal(18, 2),
   @d_a_Pre_Interest decimal(18, 2),
   @d_a_Voluntary_AF decimal(18, 2),
   @s_a_Payment_Type varchar(10),
   @d_a_Litigated_Collection decimal(18, 2),
   @d_a_Litigated_Interest decimal(18, 2),
   @d_a_Litigation_Fees decimal(18, 2),
   @d_a_Court_Fees decimal(18, 2),
   @dt_a_Check_Date DateTime,
   @s_a_Check_No varchar(100),
   @dt_a_Transaction_Date DateTime,
   @s_a_Transaction_Description varchar(250),
   @s_a_DomainId varchar(50),
   @i_a_User_Id nvarchar(100),
   @s_a_FirstParty_Litig bit
AS
BEGIN
     BEGIN TRAN  
     Declare @Provider_Id nvarchar(50);
	 Declare @dTransaction_Id int;
	 Declare @iTransaction_Id int;

	 Select @Provider_Id = Provider_Id from tblcase where Case_Id = @s_a_Case_Id and DomainId = @s_a_DomainId

	 IF @s_a_Payment_Type='V'
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
			   DomainId,
			   ChequeNo,
			   CheckDate,
			   BatchNo,
			   TreatmentIds
			  )  
			  VALUES
			  (  
			   @s_a_Case_Id,  
			   @Provider_Id,  
			   @d_a_Total_Collection,  
			   Convert(nvarchar(15), @dt_a_Transaction_Date, 101),     
			   'PreC',  
			   @s_a_Transaction_Description,  
			   @i_a_User_Id,  
			   '0',
			    0,
			   @s_a_DomainId,
			   @s_a_Check_No,
			   @dt_a_Check_Date,
			   '',
			   ''
			  )   
			  
			  DECLARE @i_l_Treat_Coount INT 
				DECLARE @d_Transactions_Amount MONEY

				SET @i_l_Treat_Coount = (select ISNULL(count(case_id),0) from tblTreatment where DomainId=@s_a_DomainId and Case_Id=@s_a_Case_Id)
				SET @d_Transactions_Amount = (select ISNULL(SUM(Transactions_Amount),0) from tblTransactions where DomainId=@s_a_DomainId and Case_Id=@s_a_Case_Id and Transactions_Type IN ('PreC','PreCToP'))

				IF(@i_l_Treat_Coount = 1 AND @s_a_DomainId IN ('GLF'))
				BEGIN
					UPDATE tblTreatment SET Paid_Amount = CONVERT(MONEY,(@d_Transactions_Amount/@i_l_Treat_Coount)) WHERE DomainId=@s_a_DomainId and Case_Id = @s_a_Case_Id
				END
				ELSE IF(@i_l_Treat_Coount > 0)
				BEGIN
					UPDATE tblTreatment SET Paid_Amount = CONVERT(MONEY,(@d_Transactions_Amount/@i_l_Treat_Coount)) WHERE DomainId=@s_a_DomainId and Case_Id = @s_a_Case_Id
				END
        
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
			   User_id,  
			   Transactions_status,
			   Transactions_Fee,
			   DomainId,
			   ChequeNo,
			   CheckDate,
			   BatchNo,
			   TreatmentIds
			  )  
			  VALUES
			  (  
			   @s_a_Case_Id,  
			   @Provider_Id,  
			   @d_a_Litigated_Collection,  
			   Convert(nvarchar(15), @dt_a_Transaction_Date, 101),     
			   'C',  
			   @s_a_Transaction_Description,  
			   @i_a_User_Id,  
			   '0',
			    0,
			   @s_a_DomainId,
			   @s_a_Check_No,
			   @dt_a_Check_Date,
			   '',
			   ''
			  )       

	 END

	 Declare @Transaction_Id int;
	 SELECT @Transaction_Id = CAST(scope_identity() AS int);

	 IF  @s_a_Payment_Type='V' and @d_a_Deductible > 0
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
			   DomainId,
			   ChequeNo,
			   CheckDate,
			   BatchNo,
			   TreatmentIds
			  )  
			  VALUES
			  (  
			   @s_a_Case_Id,  
			   @Provider_Id,  
			   @d_a_Deductible,  
			   Convert(nvarchar(15), @dt_a_Transaction_Date, 101),     
			   'D',  
			   @s_a_Transaction_Description,  
			   @i_a_User_Id,  
			   '0',
			    0,
			   @s_a_DomainId,
			   @s_a_Check_No,
			   @dt_a_Check_Date,
			   '',
			   ''
			  )   

			   SELECT @dTransaction_Id = CAST(scope_identity() AS int);
	 END
	
	IF @s_a_Payment_Type='V' and @d_a_Pre_Interest > 0
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
			   DomainId,
			   ChequeNo,
			   CheckDate,
			   BatchNo,
			   TreatmentIds
			  )  
			  VALUES
			  (  
			   @s_a_Case_Id,  
			   @Provider_Id,  
			   @d_a_Pre_Interest,  
			   Convert(nvarchar(15), @dt_a_Transaction_Date, 101),     
			   'PreI',  
			   'Voluntary Pre Interest',  
			   @i_a_User_Id,  
			   '0',
			    0,
			   @s_a_DomainId,
			   @s_a_Check_No,
			   @dt_a_Check_Date,
			   '',
			   ''
			  )   

			   SELECT @iTransaction_Id = CAST(scope_identity() AS int);
	 END
	 Else If @s_a_Payment_Type='L' and @d_a_Litigated_Interest > 0
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
			   DomainId,
			   ChequeNo,
			   CheckDate,
			   BatchNo,
			   TreatmentIds
			  )  
			  VALUES
			  (  
			   @s_a_Case_Id,  
			   @Provider_Id,  
			   @d_a_Litigated_Interest,  
			   Convert(nvarchar(15), @dt_a_Transaction_Date, 101),     
			   'PreI',  
			   'Litigated Interest',  
			   @i_a_User_Id,  
			   '0',
			    0,
			   @s_a_DomainId,
			   @s_a_Check_No,
			   @dt_a_Check_Date,
			   '',
			   ''
			  )   

			   SELECT @iTransaction_Id = CAST(scope_identity() AS int);
	 END



	Insert into tbl_Voluntary_Payment
	(
	  [Case_Id]
	 ,[Total_Collection]
	 ,[Deductible]
	 ,[Pre_Interest]
	 ,[Voluntary_AF]
	 ,[Payment_Type]
	 ,[Litigated_Collection]
	 ,[Litigated_Interest]
	 ,[Litigation_Fees]
	 ,[Court_Fees]
	 ,[Check_Date]
	 ,[Check_No]
	 ,[Transaction_Date]
	 ,[Transaction_Description]
	 ,[DomainId]
	 ,[Transactions_Id]
	 ,[FirstParty_Litigation]
	 ,dTransactions_Id
	 ,iTransactions_Id
	) 
	Values
	(
	  @s_a_Case_Id
	 ,@d_a_Total_Collection 
	 ,@d_a_Deductible
	 ,@d_a_Pre_Interest
	 ,@d_a_Voluntary_AF
	 ,@s_a_Payment_Type
	 ,@d_a_Litigated_Collection 
	 ,@d_a_Litigated_Interest
	 ,@d_a_Litigation_Fees 
	 ,@d_a_Court_Fees
	 ,@dt_a_Check_Date
	 ,@s_a_Check_No
	 ,@dt_a_Transaction_Date
	 ,@s_a_Transaction_Description 
	 ,@s_a_DomainId
	 ,@Transaction_Id
	 ,@s_a_FirstParty_Litig
	 ,@dTransaction_Id
	 ,@iTransaction_Id
	)
	 Declare @s_l_message int;

	 SELECT @s_l_message = CAST(scope_identity() AS int);
	SELECT @s_l_message AS [Message];
	COMMIT TRAN
END
GO
