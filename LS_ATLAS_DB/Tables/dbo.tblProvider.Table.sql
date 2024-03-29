USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblProvider]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProvider](
	[Provider_Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider_Code] [nvarchar](100) NULL,
	[Provider_Name] [nvarchar](100) NULL,
	[Provider_Suitname] [nvarchar](100) NULL,
	[Provider_Type] [varchar](40) NULL,
	[Provider_Local_Address] [varchar](255) NULL,
	[Provider_Local_City] [varchar](100) NULL,
	[Provider_Local_State] [varchar](100) NULL,
	[Provider_Local_Zip] [varchar](50) NULL,
	[Provider_Local_Phone] [varchar](100) NULL,
	[Provider_Local_Fax] [varchar](100) NULL,
	[Provider_Contact] [varchar](100) NULL,
	[Provider_Perm_Address] [varchar](255) NULL,
	[Provider_Perm_City] [varchar](100) NULL,
	[Provider_Perm_State] [varchar](100) NULL,
	[Provider_Perm_Zip] [varchar](50) NULL,
	[Provider_Perm_Phone] [varchar](100) NULL,
	[Provider_Perm_Fax] [varchar](100) NULL,
	[Provider_Email] [varchar](100) NULL,
	[Provider_Billing] [float] NULL,
	[Provider_Contact2] [varchar](100) NULL,
	[Provider_IntBilling] [float] NULL,
	[Invoice_Type] [varchar](10) NULL,
	[cost_balance] [money] NULL,
	[Provider_Notes] [nvarchar](4000) NULL,
	[Provider_ReferredBy] [nvarchar](100) NULL,
	[Provider_President] [nvarchar](100) NULL,
	[Provider_TaxID] [nvarchar](50) NULL,
	[Provider_FF] [nchar](10) NULL,
	[Provider_ReturnFF] [nchar](10) NULL,
	[Provider_SeesFF] [nvarchar](10) NULL,
	[Provider_SeesRFF] [nvarchar](10) NULL,
	[Provider_InvoicedFF] [nvarchar](50) NULL,
	[provider_Rfunds] [tinyint] NULL,
	[Provider_GroupName] [nvarchar](50) NULL,
	[Provider_Collection_Agent] [nvarchar](100) NULL,
	[Provider_attachChecks] [nvarchar](50) NULL,
	[Temp_Tag] [decimal](4, 4) NULL,
	[Active] [bit] NULL,
	[SZ_SHORT_NAME] [nvarchar](100) NULL,
	[BX_SERV] [bit] NULL,
	[BX_SHR_FEE] [float] NULL,
	[BX_PSTG] [money] NULL,
	[SD_CODE] [varchar](5) NULL,
	[BX_FEE_SCHEDULE] [int] NULL,
	[isFromNassau] [bit] NULL,
	[BitVerification] [int] NULL,
	[FH_ACTIVE] [bit] NULL,
	[FileReturn] [bit] NULL,
	[Position] [nvarchar](4000) NULL,
	[Practice] [nvarchar](4000) NULL,
	[Billing_Manager] [nvarchar](200) NULL,
	[Email_For_Arb_Awards] [nvarchar](200) NULL,
	[Email_For_Invoices] [nvarchar](200) NULL,
	[Email_For_Closing_Reports] [nvarchar](200) NULL,
	[Email_For_Monthly_Report] [nvarchar](200) NULL,
	[LawFirm_Attorney] [varchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[Funding_Company] [nvarchar](100) NOT NULL,
	[Provider_Initial_Billing] [float] NULL,
	[Provider_Initial_IntBilling] [float] NULL,
	[Provider_Contact3] [varchar](100) NULL,
	[Provider_Rebuttal] [varchar](100) NULL,
	[Settlement_Principal] [decimal](18, 2) NULL,
	[Settlement_Interest] [decimal](18, 2) NULL,
	[packet_type] [varchar](100) NULL,
	[Vendor_Service] [bit] NULL,
	[Vendor_Fee_Type] [varchar](50) NULL,
	[Vendor_Fee] [float] NULL,
	[Vendor_Name] [varchar](200) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_Provider_Billing]  DEFAULT ((0)) FOR [Provider_Billing]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_Provider_IntBilling]  DEFAULT ((0)) FOR [Provider_IntBilling]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_Invoice_Type]  DEFAULT ('E') FOR [Invoice_Type]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_cost_balance]  DEFAULT ((0)) FOR [cost_balance]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_Provider_SeesFF]  DEFAULT ((1)) FOR [Provider_SeesFF]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_Provider_SeesRFF]  DEFAULT ((1)) FOR [Provider_SeesRFF]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_BX_SERV]  DEFAULT ((0)) FOR [BX_SERV]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_FH_ACTIVE]  DEFAULT ((1)) FOR [FH_ACTIVE]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF__tblProvid__Domai__6D9742D9]  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_Provider_Initial_Billing]  DEFAULT ((0.00)) FOR [Provider_Initial_Billing]
GO
ALTER TABLE [dbo].[tblProvider] ADD  CONSTRAINT [DF_tblProvider_Provider_Initial_IntBilling]  DEFAULT ((0.00)) FOR [Provider_Initial_IntBilling]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3750 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Local_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Perm_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Billing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Billing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Billing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Billing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Billing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Contact2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_IntBilling'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_IntBilling'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_IntBilling'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_IntBilling'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_IntBilling'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Invoice_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Invoice_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Invoice_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Invoice_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Invoice_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'cost_balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'cost_balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'cost_balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'cost_balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'cost_balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReferredBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReferredBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReferredBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReferredBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReferredBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_President'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_President'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_President'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_President'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_President'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_TaxID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_TaxID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_TaxID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_TaxID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_TaxID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_FF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_FF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_FF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_FF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_FF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReturnFF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReturnFF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReturnFF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReturnFF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_ReturnFF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'provider_Rfunds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'provider_Rfunds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'provider_Rfunds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'provider_Rfunds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'provider_Rfunds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Collection_Agent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Collection_Agent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Collection_Agent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Collection_Agent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Collection_Agent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Collection_Agent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Collection_Agent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Provider_Collection_Agent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Temp_Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Temp_Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Temp_Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Temp_Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider', @level2type=N'COLUMN',@level2name=N'Temp_Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[tblProvider].[Provider_Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProvider'
GO
