USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[CaseAttorneyMapping]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseAttorneyMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CaseId] [varchar](50) NOT NULL,
	[AttorneyId] [int] NOT NULL,
	[DomainId] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CaseAttorneyMapping]  WITH CHECK ADD  CONSTRAINT [FK_CaseAttorneyMapping_IssueTracker_Users_UserId] FOREIGN KEY([AttorneyId])
REFERENCES [dbo].[IssueTracker_Users] ([UserId])
GO
ALTER TABLE [dbo].[CaseAttorneyMapping] CHECK CONSTRAINT [FK_CaseAttorneyMapping_IssueTracker_Users_UserId]
GO
