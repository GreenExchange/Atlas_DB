USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Daily_Report_Recipients]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Daily_Report_Recipients]
	--@s_a_DomainId Varchar(50)
AS
BEGIN

	SET NOCOUNT ON;

		Select 
		 ToEmail
		,EmailFrom
		,Password
		,SMTP_Port_Number
		,SMTP_Server_Name
		,isSSLEnabled
		,ReplyToEmailId
		,CCEMail
		,BCCEmail
		,iif((Select Count(*) from tblWorkflowDailyReport Where Convert(varchar(50), Sent_Date, 101) = Convert(varchar(50), GETDATE(), 101) and DomainId = R.DomainId) = 0, 0, 1) AS Report_Sent
		,R.DomainId
		from tblAutoEmailRecipients R INNER JOIN tblAutoEmailReportType RT On RT.pk_report_type_id = R.fk_report_type_id
		INNER JOIN tblDomainEmailSettings DS ON DS.Domain_Id = R.DomainId inner join tbl_Client cl on cl.DomainId = R.DomainId
		Where Lower(report_type) = 'daily report' and lower(cl.CompanyType) = 'funding' --R.DomainId = @s_a_DomainId
END
GO
