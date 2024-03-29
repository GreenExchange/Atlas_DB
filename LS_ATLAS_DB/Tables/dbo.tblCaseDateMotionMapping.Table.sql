USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCaseDateMotionMapping]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCaseDateMotionMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CaseDateDetailsID] [int] NULL,
	[DomainId] [nvarchar](100) NULL,
	[MotionTypeId] [int] NULL,
	[MotionHearingDate] [datetime] NULL,
	[Motion_for_PL_or_DEF] [bit] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblCaseDateMotionMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCaseDateMotionMapping]  WITH CHECK ADD  CONSTRAINT [FK_tblCaseDateMotionMapping_tblCase_Date_Details] FOREIGN KEY([CaseDateDetailsID])
REFERENCES [dbo].[tblCase_Date_Details] ([Auto_Id])
GO
ALTER TABLE [dbo].[tblCaseDateMotionMapping] CHECK CONSTRAINT [FK_tblCaseDateMotionMapping_tblCase_Date_Details]
GO
ALTER TABLE [dbo].[tblCaseDateMotionMapping]  WITH CHECK ADD  CONSTRAINT [FK_tblCaseDateMotionMapping_tblMotionType] FOREIGN KEY([MotionTypeId])
REFERENCES [dbo].[tblMotionType] ([MotionTypeId])
GO
ALTER TABLE [dbo].[tblCaseDateMotionMapping] CHECK CONSTRAINT [FK_tblCaseDateMotionMapping_tblMotionType]
GO
