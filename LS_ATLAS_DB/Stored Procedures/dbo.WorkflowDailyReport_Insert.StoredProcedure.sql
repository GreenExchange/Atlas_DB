USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[WorkflowDailyReport_Insert]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WorkflowDailyReport_Insert]
	@s_a_DomainId varchar(50),
	@s_a_Email_To varchar(max),
	@s_a_Email_CC varchar(max),
	@s_a_Email_BCC varchar(max)
AS
BEGIN
		Insert into tblWorkflowDailyReport
		(DomainId, Email_To, Email_CC, Email_BCC, Sent_Date)
		Values
		(@s_a_DomainId,@s_a_Email_To,@s_a_Email_CC,@s_a_Email_BCC, GETDATE())
END
GO
