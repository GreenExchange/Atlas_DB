USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_tblProviderUpdate]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_tblProviderUpdate]      
(      
      
@Provider_Id   int,      
@Provider_Name  nvarchar(200),      
@Provider_Type  varchar(40),      
@Provider_Billing  float,      
@Provider_Local_Address  varchar(255),      
@Provider_Local_City  varchar(100),      
@Provider_Local_State  varchar(100),      
@Provider_Local_Zip  varchar(50),      
@Provider_Local_Phone  varchar(100),      
@Provider_Local_Fax  varchar(100),      
@Provider_Contact  varchar(100),      
@Provider_Perm_Address varchar(255),      
@Provider_Perm_City  varchar(100),      
@Provider_Perm_State  varchar(100),      
@Provider_Perm_Zip  varchar(50),      
@Provider_Perm_Phone  varchar(100),      
@Provider_Perm_Fax  varchar(100),      
@Provider_Email  varchar(100),      
@Provider_Notes  nvarchar(4000),   
@Provider_GroupName  nvarchar(50),     
@Contact2  varchar(100),      
@Refered_By varchar(100),      
@Provider_IntBilling varchar(100),      
@Cost_balance money,      
@Invoice_Type varchar(100),      
@Provider_President varchar(100),      
@Provider_TaxID varchar(100),      
@Provider_FF  varchar(10),      
@Provider_ReturnFF varchar(10),  
@Provider_Rfunds tinyint  ,    
@Provider_Collection_Agent nvarchar(100)=null,
@Billing_Manager nvarchar(200)=null, 
@Provider_SeesFF   nvarchar(10)=null,  
@Provider_SeesRFF   nvarchar(10)=null,  
@Provider_InvoicedFF  nvarchar(50)=null,  
@SZ_SHORT_NAME    nvarchar(100)=null,  
@BX_SERV     bit=null,  
@BX_SHR_FEE     float=null,  
@BX_PSTG     money=null,  
@SD_CODE     varchar(5)=null,  
@BX_FEE_SCHEDULE   int = null,
@is_from_nassau BIT = NULL,
@BitVerification int=null,
@active BIT = NULL ,
@filereturn bit = null,
@Position nvarchar(4000),
@Practice nvarchar(4000)
)      
      
AS      
--IF EXISTS(SELECT UserId FROM IssueTracker_Users WHERE Username = @Username AND UserID <> @UserId)      
 --RETURN 1      
      
--DECLARE @Provider_Id nvarchar(100)      
      
--SELECT @RoleId = RoleId FROM IssueTracker_Roles WHERE RoleName = @RoleName      
UPDATE tblProvider SET      
	Provider_Name = @Provider_Name,      
	Provider_Type = @Provider_Type,      
	Provider_Billing = @Provider_Billing,      
	Provider_Local_Address = @Provider_Local_Address,      
	Provider_Local_City = @Provider_Local_City,      
	Provider_Local_State = @Provider_Local_State,      
	Provider_Local_Zip = @Provider_Local_Zip,      
	Provider_Local_Phone = @Provider_Local_Phone,      
	Provider_Local_Fax = @Provider_Local_Fax,      
	Provider_Contact = @Provider_Contact,      
	Provider_Perm_Address = @Provider_Perm_Address,      
	Provider_Perm_City = @Provider_Perm_City,      
	Provider_Perm_State = @Provider_Perm_State,      
	Provider_Perm_Zip = @Provider_Perm_Zip,      
	Provider_Perm_Phone = @Provider_Perm_Phone,      
	Provider_Perm_Fax = @Provider_Perm_Fax,      
	Provider_Email = @Provider_Email,      
	Provider_Contact2=@Contact2,      
	Provider_Notes=@Provider_Notes,      
	Provider_ReferredBy=@Refered_By,      
	Provider_IntBilling=@Provider_IntBilling,      
	Invoice_Type=@Invoice_Type,       
	cost_balance=@Cost_balance,      
	Provider_President= @Provider_President,      
	Provider_TaxID=@Provider_TaxID,      
	Provider_FF=@Provider_FF,      
	Provider_ReturnFF=@Provider_ReturnFF,  
	Provider_Rfunds=@Provider_Rfunds ,  
	Provider_GroupName=@Provider_GroupName,    
	Provider_Collection_Agent=@Provider_Collection_Agent,
	Billing_Manager=@Billing_Manager,  
	Provider_SeesFF=@Provider_SeesFF,   
	Provider_SeesRFF =@Provider_SeesRFF,  
	Provider_InvoicedFF=@Provider_InvoicedFF,  
	SZ_SHORT_NAME=@SZ_SHORT_NAME,  
	BX_SERV=@BX_SERV,     
	BX_SHR_FEE=@BX_SHR_FEE,     
	BX_PSTG=@BX_PSTG,     
	SD_CODE=@SD_CODE,     
	BX_FEE_SCHEDULE =@BX_FEE_SCHEDULE   , isFromNassau = @is_from_nassau ,
	active = @active,
	BitVerification=@BitVerification,
	FileReturn = @filereturn,
	Position = @Position,
	Practice = @Practice

	
WHERE       
  Provider_Id = Rtrim(Ltrim(@Provider_Id))
GO
