USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblDefendant]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDefendant](
	[Defendant_id] [int] IDENTITY(1,1) NOT NULL,
	[Defendant_Name] [varchar](100) NULL,
	[Defendant_DisplayName] [varchar](100) NULL,
	[Defendant_Address] [varchar](255) NULL,
	[Defendant_City] [varchar](100) NULL,
	[Defendant_State] [varchar](100) NULL,
	[Defendant_Zip] [varchar](20) NULL,
	[Defendant_Phone] [varchar](20) NULL,
	[Defendant_Fax] [varchar](20) NULL,
	[Defendant_Email] [varchar](100) NULL,
	[active] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[lawfirmname] [varchar](max) NULL,
 CONSTRAINT [PK_tblDefendant] PRIMARY KEY CLUSTERED 
(
	[Defendant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDefendant] ADD  CONSTRAINT [DF_tblDefendant_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[tblDefendant] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblDefendant] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4710 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=5175 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'Defendant_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant', @level2type=N'COLUMN',@level2name=N'active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[tblDefendant].[Defendant_Name], [tblDefendant].[Defendant_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDefendant'
GO
