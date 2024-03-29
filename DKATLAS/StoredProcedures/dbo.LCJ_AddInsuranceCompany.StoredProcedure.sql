USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddInsuranceCompany]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddInsuranceCompany]
(

--Client_Id	nvarchar	no	100
@InsuranceCompany_Name		nvarchar(200),
@InsuranceCompany_SuitName	nvarchar(250),
@InsuranceCompany_Type		varchar(40),
@InsuranceCompany_Local_Address	varchar(	255),
@InsuranceCompany_Local_City		varchar(100),
@InsuranceCompany_Local_State	varchar(100),
@InsuranceCompany_Local_Zip		varchar(50),
@InsuranceCompany_Local_Phone	varchar(100),
@InsuranceCompany_Local_Fax		varchar(100),
@InsuranceCompany_Contact		varchar(100),
@InsuranceCompany_Perm_Address	varchar(255),
@InsuranceCompany_Perm_City		varchar(100),
@InsuranceCompany_Perm_State	varchar(100),
@InsuranceCompany_Perm_Zip		varchar(50),
@InsuranceCompany_Perm_Phone	varchar(100),
@InsuranceCompany_Perm_Fax		varchar(100),
@InsuranceCompany_Email		varchar(100),
@Security			varchar(10),
@UserName			Nvarchar(40),
@UserPassword			nvarchar(40),
@OperationResult 		INT OUTPUT,
@NewUserError			INT OUTPUT,
@InsuranceCompany_Address2_Address varchar(255), 
@InsuranceCompany_Address2_City	   varchar(100),
@InsuranceCompany_Address2_State   varchar(100),
@InsuranceCompany_Address2_Zip     varchar(100),
@InsuranceCompany_Address2_Phone   varchar(100),
@InsuranceCompany_Address2_Fax     varchar(100)


--@OperationResult INTEGER OUT
)
AS

Set NOCOUNT ON
	DECLARE @InsuranceCompanyID AS NVARCHAR(20) ,@CurrentDate AS SMALLDATETIME
	SET @CurrentDate = Convert(Varchar(15), GetDate(),102)

	IF EXISTS(Select InsuranceCompany_Name from tblInsuranceCompany where InsuranceCompany_Name = @InsuranceCompany_Name) 
		BEGIN
			SET @OperationResult = 1
			Return 1
		END
	Else


		BEGIN
	
	
	
			DECLARE @MaxInsuranceCompany_Id_IDENTITY INTEGER
			
			-- Insert the records
			BEGIN TRAN
	
			INSERT INTO tblInsuranceCompany
			(
			InsuranceCompany_Name,
			InsuranceCompany_SuitName,
			InsuranceCompany_Type,
			InsuranceCompany_Local_Address,
			InsuranceCompany_Local_City,
			InsuranceCompany_Local_State,
			InsuranceCompany_Local_Zip,
			InsuranceCompany_Local_Phone,
			InsuranceCompany_Local_Fax,
			InsuranceCompany_Contact,
			InsuranceCompany_Perm_Address,
			InsuranceCompany_Perm_City,
			InsuranceCompany_Perm_State,
			InsuranceCompany_Perm_Zip,
			InsuranceCompany_Perm_Phone,
			InsuranceCompany_Perm_Fax,
			InsuranceCompany_Email,
			InsuranceCompany_Initial_Address,
			InsuranceCompany_Initial_City,
			InsuranceCompany_Initial_State,
			InsuranceCompany_Initial_Zip,
			InsuranceCompany_Address2_Address,
			InsuranceCompany_Address2_City,
			InsuranceCompany_Address2_State,
			InsuranceCompany_Address2_Zip,
			InsuranceCompany_Address2_Phone,
			InsuranceCompany_Address2_Fax

			)
	
			VALUES(
				
			@InsuranceCompany_Name,
			@InsuranceCompany_SuitName,
			@InsuranceCompany_Type,
			@InsuranceCompany_Local_Address,
			@InsuranceCompany_Local_City,
			@InsuranceCompany_Local_State,
			@InsuranceCompany_Local_Zip,
			@InsuranceCompany_Local_Phone,
			@InsuranceCompany_Local_Fax,
			@InsuranceCompany_Contact,
			@InsuranceCompany_Perm_Address,
			@InsuranceCompany_Perm_City,
			@InsuranceCompany_Perm_State,
			@InsuranceCompany_Perm_Zip,
			@InsuranceCompany_Perm_Phone,
			@InsuranceCompany_Perm_Fax,
			@InsuranceCompany_Email,
			@InsuranceCompany_Local_Address,
			@InsuranceCompany_Local_City,
			@InsuranceCompany_Local_State,
			@InsuranceCompany_Local_Zip,
			@InsuranceCompany_Address2_Address,
			@InsuranceCompany_Address2_City,
			@InsuranceCompany_Address2_State,
			@InsuranceCompany_Address2_Zip,
			@InsuranceCompany_Address2_Phone,
			@InsuranceCompany_Address2_Fax

			)					
	
	
			COMMIT TRAN
	
			SELECT @MaxInsuranceCompany_Id_IDENTITY = MAX(InsuranceCompany_Id) from tblinsurancecompany
					
			IF @Security = 'True'
				BEGIN
					
					IF (EXISTS(SELECT UserId FROM IssueTracker_Users WHERE Username = @Username) OR EXISTS(SELECT UserId FROM IssueTracker_Users WHERE UserTypeLogin = @InsuranceCompanyID))

					--IF EXISTS(SELECT Username FROM IssueTracker_Users WHERE Username = @Username)
						
						BEGIN

							SET @NewUserError = 1
	
							RETURN 1

						END
					Else
						
						BEGIN

								INSERT IssueTracker_Users
								(
									Username,
									RoleId,
									Email,
									DisplayName,
									UserPassword,
									UserTypeLogin,
									UserType
								) 
								VALUES 
								(
									@Username,
									'3',
									@InsuranceCompany_Email,
									@Username,
									@UserPassword,
									Rtrim(Ltrim(@InsuranceCompanyID)),
									'I'
								)
		
								SET @NewUserError = 0
			
								RETURN 0
						END
						
				END

			declare
			@cnt int,
			@iname varchar(100)
			select @iname = insurancecompany_name from tblinsurancecompany where InsuranceCompany_Id = @MaxInsuranceCompany_Id_IDENTITY
			select @cnt = count(*) from tbldesk where desk_name = @iname
			if @cnt =0
			begin
				insert into tbldesk values (@iname)
			end
	
	
	
		END -- END of ELSE
GO
