USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCase_Date_Details]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCase_Date_Details](
	[Auto_Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [varchar](50) NULL,
	[DomainId] [varchar](50) NULL,
	[Date_Open_Verification_Response_Sent1] [datetime] NULL,
	[Date_Open_Verification_Response_Sent2] [datetime] NULL,
	[CASE_EVALUATION_DATE] [datetime] NULL,
	[LITIGATION_PAYMENT_DATE] [datetime] NULL,
	[Appeal_Date] [datetime] NULL,
	[Summons_and_Complaint_Date] [datetime] NULL,
	[Date_Summons_Expires] [datetime] NULL,
	[Plaintiff_Disccovery_Request_Package] [datetime] NULL,
	[Plaintiff_Discovery_Responses_Completed] [datetime] NULL,
	[Date_Case_Purchased] [datetime] NULL,
	[Defense_Discovery_Receipt_Date] [datetime] NULL,
	[Motion_For_Ext_of_Time_1] [datetime] NULL,
	[Motion_For_Ext_of_Time_2] [datetime] NULL,
	[Pre_Trial_Conf_Date] [datetime] NULL,
	[Case_Evaluation_Summary_Due_Date] [datetime] NULL,
	[Case_Evaluation_Accept_or_Reject] [bit] NULL,
	[Settlement_Conference] [varchar](100) NULL,
	[Facilitation_Date] [datetime] NULL,
	[Witness_and_Exhibit_List_Due_Date] [datetime] NULL,
	[Trial_Notebook_Due_Date] [datetime] NULL,
	[Dismissal_Date] [datetime] NULL,
	[Date_Answer_Received] [datetime] NULL,
	[First_Party_Suit_Filed_Date] [datetime] NULL,
	[Complaint_Print_Date] [datetime] NULL,
	[Date_Filed] [datetime] NULL,
	[Proof_of_Service_Date] [datetime] NULL,
	[Scheduling_Order_Issue_Date] [datetime] NULL,
	[Witness_list_Due_Date] [datetime] NULL,
	[Motion_Cutoff_Date] [datetime] NULL,
	[Discovery_Cutoff_Date] [datetime] NULL,
	[Pretrial_Statement_Due_Date] [datetime] NULL,
	[Pretrial_Conf_Date] [datetime] NULL,
	[Plaintiff_Propounded_Discovery_Sent_Date] [datetime] NULL,
	[Discovery_Stip_Sent_Date] [datetime] NULL,
	[Plaintiff_Discovery_Responses_Completed_Date] [datetime] NULL,
	[Defense_Deposition_Date] [datetime] NULL,
	[Plaintiff_Deposition_Date] [datetime] NULL,
	[Settlement_Date] [datetime] NULL,
	[Settlement_FU_letter_Date_1] [datetime] NULL,
	[Settlement_FU_letter_Date_2] [datetime] NULL,
	[Client_Release_Execution_Request_Date] [datetime] NULL,
	[Release_FU_Date] [datetime] NULL,
	[Case_Evaluation_Status] [int] NULL,
	[Case_Evaluation_Status_Date] [datetime] NULL,
	[Facilitation_Summary_Due_Date] [datetime] NULL,
	[Settlement_Conference_Date] [datetime] NULL,
	[Final_Pretrial_Statement_Trial_Notebook_Sent_Date] [datetime] NULL,
	[Closing_Statement_Date] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[trial_date] [datetime] NULL,
	[Complaint_Amended_Print_Date] [datetime] NULL,
	[Release_Received_Date] [datetime] NULL,
	[Adjuster_Depo_Date] [datetime] NULL,
	[Defense_Answer_To_Discovery_Due_Date] [datetime] NULL,
	[Defense_Answers_to_our_Discovery_Completed_Date] [datetime] NULL,
	[Payment_Received_Date] [datetime] NULL,
 CONSTRAINT [PK_tblCase_Date_Details] PRIMARY KEY CLUSTERED 
(
	[Auto_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Date_Open_Verification_Response_Sent1]  DEFAULT (NULL) FOR [Date_Open_Verification_Response_Sent1]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Date_Open_Verification_Response_Sent2]  DEFAULT (NULL) FOR [Date_Open_Verification_Response_Sent2]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_CASE_EVALUATION_DATE]  DEFAULT (NULL) FOR [CASE_EVALUATION_DATE]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_LITIGATION_PAYMENT_DATE]  DEFAULT (NULL) FOR [LITIGATION_PAYMENT_DATE]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Appeal_Date]  DEFAULT (NULL) FOR [Appeal_Date]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Summons_and_Complaint_Date]  DEFAULT (NULL) FOR [Summons_and_Complaint_Date]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Date_Summons_Expires]  DEFAULT (NULL) FOR [Date_Summons_Expires]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Plaintiff_Disccovery_Request_Package]  DEFAULT (NULL) FOR [Plaintiff_Disccovery_Request_Package]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Plaintiff_Discovery_Responses_Completed]  DEFAULT (NULL) FOR [Plaintiff_Discovery_Responses_Completed]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Date_Case_Purchased]  DEFAULT (NULL) FOR [Date_Case_Purchased]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Defense_Discovery_Receipt_Date]  DEFAULT (NULL) FOR [Defense_Discovery_Receipt_Date]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Motion_For_Ext_of_Time_1]  DEFAULT (NULL) FOR [Motion_For_Ext_of_Time_1]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Motion_For_Ext_of_Time_2]  DEFAULT (NULL) FOR [Motion_For_Ext_of_Time_2]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Pre_Trial_Conf_Date]  DEFAULT (NULL) FOR [Pre_Trial_Conf_Date]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Case_Evaluation_Summary_Due_Date]  DEFAULT (NULL) FOR [Case_Evaluation_Summary_Due_Date]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Case_Evaluation_Accept_or_Reject]  DEFAULT (NULL) FOR [Case_Evaluation_Accept_or_Reject]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Settlement_Conference]  DEFAULT (NULL) FOR [Settlement_Conference]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Facilitation_Date]  DEFAULT (NULL) FOR [Facilitation_Date]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Witness_and_Exhibit_List_Due_Date]  DEFAULT (NULL) FOR [Witness_and_Exhibit_List_Due_Date]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Trial_Notebook_Due_Date]  DEFAULT (NULL) FOR [Trial_Notebook_Due_Date]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Dismissal_Date]  DEFAULT (NULL) FOR [Dismissal_Date]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  CONSTRAINT [DF_tblCase_Date_Details_Date_Answer_Received]  DEFAULT (NULL) FOR [Date_Answer_Received]
GO
ALTER TABLE [dbo].[tblCase_Date_Details] ADD  DEFAULT ((0)) FOR [Case_Evaluation_Status]
GO
