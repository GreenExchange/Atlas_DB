USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblNotes_Deleted]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotes_Deleted](
	[Notes_ID] [int] NOT NULL,
	[Notes_Desc] [nvarchar](3000) NULL,
	[Notes_Type] [nvarchar](20) NULL,
	[Notes_Priority] [nvarchar](3) NULL,
	[Case_Id] [nvarchar](100) NOT NULL,
	[Notes_Date] [smalldatetime] NULL,
	[User_Id] [nvarchar](50) NULL,
	[DATE_DELETED] [datetime] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblNotes_deleted] PRIMARY KEY CLUSTERED 
(
	[Notes_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblNotes_Deleted] ADD  CONSTRAINT [DF_tblNotes_Deleted_DATE_DELETED]  DEFAULT (getdate()) FOR [DATE_DELETED]
GO
ALTER TABLE [dbo].[tblNotes_Deleted] ADD  DEFAULT ('h1') FOR [DomainId]
GO
