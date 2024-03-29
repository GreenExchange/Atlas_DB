USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdateCase]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_UpdateCase]

(
@DomainId				nvarchar(50),
@Case_Id				nvarchar(100),
@Provider_Id				nvarchar(100),
@InsuranceCompany_Id			nvarchar(100),
@InjuredParty_LastName		nvarchar(200),
@InjuredParty_FirstName		nvarchar(200),
@InjuredParty_Address			nvarchar(255),
@InjuredParty_City			nvarchar(20),
@InjuredParty_State			nvarchar(20),
@InjuredParty_Zip			nvarchar(20),
@InjuredParty_Phone			nvarchar(20),
@InjuredParty_Misc			nvarchar(50),
@InsuredParty_LastName		nvarchar(200),
@InsuredParty_FirstName		nvarchar(200),
@InsuredParty_Address			nvarchar(255),
@InsuredParty_City			nvarchar(20),
@InsuredParty_State			nvarchar(20),
@InsuredParty_Zip			nvarchar(20),
@InsuredParty_Misc			nvarchar(50),
@Accident_Date			DATETIME,
@Accident_Address			nvarchar(255),
@Accident_City				nvarchar(20),
@Accident_State			nvarchar(20),
@Accident_Zip				nvarchar(20),
@Policy_Number			nvarchar(50),
@Ins_Claim_Number			nvarchar(50),
@IndexOrAAA_Number			nvarchar(50),
@Status				nvarchar(40),
@Initial_Status				nvarchar(20),
@Memo				nvarchar(255),
@InjuredParty_Type			nvarchar(20),
@InsuredParty_Type			nvarchar(20),
@Adjuster_Id				int,
@DenialReasons_Id			nvarchar(100),
@Court_Id				int,
@Location_Id int		,
@PortfolioId int =null,
@AttorneyFirmId int= null		 
)
AS
BEGIN
if(@Location_Id=0)
	set @Location_Id=null;

	Declare @CurrentDate AS SMALLDATETIME
	DECLARE @Date_Opened AS DATETIME
	SET @CurrentDate = Convert(Varchar(15), GetDate(),102)
	
		BEGIN
			
			
			BEGIN TRAN
				-- Insert Claim Details

				BEGIN
					declare @file_scaned as int
					declare @file_pending as int
					declare @old_file_scaned as int
					declare @old_file_pending as int
					declare @batchold as varchar(30)
					set	@batchold=(select batchcode from tblcase where case_id=@Case_Id and DomainId=@DomainId)
					set @file_scaned= (select file_scanned from tblProviderBoxDetails where batch_no=@batchold and DomainId=@DomainId)
					set @file_pending= (select file_pending from tblProviderBoxDetails where batch_no=@batchold and DomainId=@DomainId)

					set @old_file_scaned = @file_scaned-1
					set @old_file_pending = @file_pending +1
					if @old_file_scaned >=0 and @old_file_pending>=0
						Begin
							update tblProviderBoxDetails 
							set file_pending=@old_file_pending, file_scanned = @old_file_scaned
							where batch_no=@batchold
							and DomainId=@DomainId
						End
				End
			
				print '1'
				Update  tblcase  SET
				
		
					Case_Id = @Case_Id,
					Provider_Id = @Provider_Id,
					InsuranceCompany_Id = @InsuranceCompany_Id,
					InjuredParty_LastName = @InjuredParty_LastName,
					InjuredParty_FirstName = @InjuredParty_FirstName,
					InjuredParty_Address = @InjuredParty_Address,
					InjuredParty_City = @InjuredParty_City,
					InjuredParty_State = @InjuredParty_State,
					InjuredParty_Zip = @InjuredParty_Zip,
					InjuredParty_Phone = @InjuredParty_Phone,
					InjuredParty_Misc = @InjuredParty_Misc,
					InsuredParty_LastName = @InsuredParty_LastName,
					InsuredParty_FirstName = @InsuredParty_FirstName,
					InsuredParty_Address = @InsuredParty_Address,
					InsuredParty_City= @InsuredParty_City,
					InsuredParty_State = @InsuredParty_State,
					InsuredParty_Zip = @InsuredParty_Zip,
					InsuredParty_Misc = @InsuredParty_Misc,
					Accident_Date = @Accident_Date,
					Accident_Address = @Accident_Address,
					Accident_City = @Accident_City,
					Accident_State = @Accident_State,
					Accident_Zip = @Accident_Zip,
					Policy_Number = @Policy_Number,
					Ins_Claim_Number = @Ins_Claim_Number,
					IndexOrAAA_Number = @IndexOrAAA_Number,
					Status = @Status,
					Defendant_Id = '',					
					Initial_Status = @Initial_Status,
					Memo = @Memo,
					InjuredParty_Type = @InjuredParty_Type,
					InsuredParty_Type = @InsuredParty_Type,
					Adjuster_Id = @Adjuster_Id,
					DenialReasons_Type = @DenialReasons_Id,
					Court_Id = @Court_Id,
					Location_Id = @Location_Id ,
					PortfolioId=@PortfolioId,
					AttorneyFirmId=@AttorneyFirmId
			WHERE Case_Id = @Case_Id
			and DomainId=@DomainId
				 
			COMMIT TRAN

		END -- END of ELSE	
	
END


GO
