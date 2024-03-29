USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_ADD_CASE_LIT]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext LCJ_AddDataEntry1

CREATE PROCEDURE [dbo].[BX_ADD_CASE_LIT]  
  
(  
  
--Case_AutoId int 4  
--@Case_Id    nvarchar(100),  
@Provider_Id    nvarchar(100),  
@InsuranceCompany_Id   nvarchar(100),  
@InjuredParty_LastName  nvarchar(200),  
@InjuredParty_FirstName  nvarchar(200),  
@InsuredParty_LastName  nvarchar(200),  
@InsuredParty_FirstName  nvarchar(200),  
@Accident_Date   DATETIME,  
@Policy_Number   nvarchar(50),  
@Ins_Claim_Number   nvarchar(50),  
@IndexOrAAA_Number   nvarchar(50)=null,  
@Case_code varchar(100)=null,
@Temp_id varchar(50),
@Service_id int
--@NewCaseOutputResult VARCHAR(100) OUTPUT

 
       
)  
AS  
BEGIN  
 DECLARE @Case_Id AS NVARCHAR(20) , @CurrentDate AS SMALLDATETIME ,@NewCaseOutputResult VARCHAR(50)
 DECLARE @Date_Opened AS DATETIME  
 -- Remove Leading and ending spaces from the input parameters  
 SET @InjuredParty_LastName = RTRIM(LTRIM(@InjuredParty_LastName))  
 SET @InjuredParty_FirstName = RTRIM(LTRIM(@InjuredParty_FirstName))  
 SET @CurrentDate = Convert(Varchar(15), GetDate(),102)  
 --SET @Date_Opened = Convert(DATETIME, @Date_Opened, 101)  
 -- Check if similiar Claim already exisits   
 -- if it exists the don't proceed further , return output code as 2  
 
   
  BEGIN  

		IF EXISTS (SELECT BX_BILL_ID FROM TBLTREATMENT WHERE BX_BILL_ID = @SERVICE_ID)
			BEGIN
			GOTO SKIP_ADD
			END


        IF EXISTS ( SELECT BX_TEMP_ID FROM TBLCASE WHERE BX_TEMP_ID = @TEMP_ID)
		BEGIN
		GOTO SKIP_ADD
		END

     
     
   DECLARE @MaxCase_Id INTEGER  
   DECLARE @Case_Id_IDENTITY INTEGER  
   DECLARE @MaxCase_AUTOID INTEGER  
  
   SELECT  @MaxCase_AUTOID=MAX(Case_AUTOID)+1 FROM TBLcASE  
     
     
   -- Insert the records  
   --BEGIN TRAN  
    -- Insert Claim Details  
     
    Insert INTO tblCase   
    (  
     Case_Id,
	 Case_Code,  
     Provider_Id,  
     InsuranceCompany_Id,  
     InjuredParty_LastName,  
     InjuredParty_FirstName,  
     InsuredParty_LastName,  
     InsuredParty_FirstName,  
     Accident_Date,  
     Policy_Number,  
     Ins_Claim_Number,  
     IndexOrAAA_Number,  
     Status,  
     Date_Opened,  
     --Last_Status,  
     Initial_Status,  
     Memo,  
     Court_Id  ,BX_ORIGINATED,BX_TEMP_ID
    )  
       
    VALUES  
  
    (  
     '',  
	 @Case_Code,
     @Provider_Id,  
     @InsuranceCompany_Id,  
     @InjuredParty_LastName,  
     @InjuredParty_FirstName,  
     @InsuredParty_LastName,  
     @InsuredParty_FirstName,  
     Convert(nvarchar(15), @Accident_Date, 101),  
     @Policy_Number,  
     @Ins_Claim_Number,  
     @IndexOrAAA_Number,  
     'OPEN - BX',  
     Convert(nvarchar(15), getdate(),101),       
     --@Last_Status,  
     'LIT',  
     'CASE TRANSFERRED FROM BX - BILLING DEPARTMENT',  
     '3',1,@TEMP_ID    
    )  
       
    --Select @NewMatterOutputResult = Max(Matter_Id) from tblMatter  
    --return @NewMatterOutputResult  
    --return @OperationResult  
    --Set  @NewMatterOutputResult = @@IDENTITY  
    -- Insert Notes Data Entry  
    /*INSERT INTO Notes   
    (Notes_Desc , Notes_Type , Claim_ID , Notes_Date , User_ID , Notes_Priority) VALUES   
         (@NotesDesc , 'A' , @ValueClaimID , @CurrentDate , @UserID , '0')  
      
    IF @Comment <> ''  
    BEGIN  
     -- Insert into Notes again??  
     INSERT INTO Notes  
     (Notes_Desc , Notes_Type , Claim_ID , Notes_Date , User_ID , Notes_Priority) VALUES   
     (@ValueMemo , 'A' , @ValueClaimID , @CurrentDate , @UserID , '0')  
    END  
   
    IF ((@Status = 'SUIT' OR @Status = 'UNTIMELY') AND @claimff = 1 AND @OrignalStatus ='SUIT')   
     Insert into Transactions VALUES(@CID ,'OTH',@CurrentDate,55,'' ,@ClientId,'System',55)  
    */  
      
   --COMMIT TRAN  
  
   --Select @MaxMatter_Id =Convert(Integer, SUBSTRING(MAX(Matter_Id),PATINDEX('%-%' , MAX(Matter_Id) )+1, 8)) from tblMatter   
   --Select @MaxMatter_Id = Max(Matter_AutoId) from tblMatter  
     
   --Set @MM_ID = @MaxMatter_Id + 1  
     
   --IF (@MaxMatter_Id = NULL)  
   SET  @Case_Id_IDENTITY = @@IDENTITY   
  
   SET @Case_Id  = 'RFA' + RIGHT(CAST(DATEPART(year, GETDATE()) AS NVARCHAR),2) + '-' + CAST(@Case_Id_IDENTITY AS NVARCHAR)  
  
   UPDATE tblCase SET Case_Id = @Case_Id where Case_AutoId = @Case_Id_IDENTITY  
  
   SET @NewCaseOutputResult = @Case_Id  



  
   --update tblCase set DateOfService_Start=Convert(nvarchar(15), @DateOfService_Start, 101),DateOfService_End=Convert(nvarchar(15), @DateOfService_End, 101),Claim_Amount=convert(varchar,@Claim_Amount),Paid_Amount=convert(varchar,@Paid_Amount),Date_BillSe
--nt=@Date_BillSent where case_id=@Case_Id  
     
     
     
   --RETURN @OperationResult  
   --RETURN  @Matter_Id  
declare  
@caid varchar(50),  
@iid varchar(50),  
@status1 varchar(50),  
@prid varchar(50)  
  
select @caid = case_id,@iid=insurancecompany_id,@status1=status,@prid=provider_id from tblCase where Case_AutoId = @Case_Id_IDENTITY  
exec procInsertDesks @CID=@caid,@insurancecompany_id=@iid,@provider_id=@prid,@status=@status1  
  
--------------------------insert captions-----------------------------------------------  
  
exec LCJ_CreateCaption @cid = @caid,@gpid = 0  
  



SKIP_ADD:


UPDATE BX_SERVICES
SET LIT_PRCSS=2
WHERE LIT_PRCSS=1 AND ID=@SERVICE_ID

  
  END -- END of ELSE   
   




END
GO
