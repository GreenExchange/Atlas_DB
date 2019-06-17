USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_DomainEmailSettings]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DomainEmailSettings] 
	@s_a_Domain_Id varchar(50)
AS
BEGIN
	 SET NOCOUNT ON;
	 
	 Select pk_domain_email_id
			,EmailFrom
			,Password
			,SMTP_Port_Number
			,SMTP_Server_Name
			,isSSLEnabled
			,ReplyToEmailId
			from tblDomainEmailSettings Where Domain_Id = @s_a_Domain_Id

END
GO
