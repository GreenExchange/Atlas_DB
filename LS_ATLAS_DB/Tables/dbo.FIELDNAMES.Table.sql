USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[FIELDNAMES]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FIELDNAMES](
	[FIELDID] [int] IDENTITY(1,1) NOT NULL,
	[FIELDNAME] [varchar](100) NULL,
	[FIELDVAL] [varchar](100) NULL,
	[FieldDESC] [varchar](500) NULL,
	[DomainId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FIELDNAMES] PRIMARY KEY CLUSTERED 
(
	[FIELDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FIELDNAMES] ADD  DEFAULT ('h1') FOR [DomainId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType_1', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth_1', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign_1', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType_1', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2700 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth_1', @value=2700 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign_1', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType_1', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth_1', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign_1', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FIELDVAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType_1', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth_1', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign_1', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES', @level2type=N'COLUMN',@level2name=N'FieldDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView_1', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter_1', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy_1', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad_1', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation_1', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow_1', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FIELDNAMES'
GO
