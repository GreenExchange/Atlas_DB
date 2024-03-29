USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Financial_Report_Track_Add]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Financial_Report_Track_Add] 
	@s_a_DomainID nvarchar(50),
	@i_a_provider_id int,
	@s_a_provider_name nvarchar(50),
	@s_a_report_month nvarchar(50),
	@s_a_file_path nvarchar(500),
	@s_a_mail_sent nvarchar(50),
	@s_a_file_name nvarchar(500)
AS
BEGIN
    Declare @i_a_basepath_id int;

    Select @i_a_basepath_id = BasePathId from [dbo].[tblBasePath](NOLOCK) where BasePathId=(Select ParameterValue from [tblApplicationSettings] where ParameterName='BasePathId')

	Insert into Financial_Report_Track 
	(DomainID, provider_id, provider_name, report_month, file_path, mail_sent, sent_date, file_name, BasePathId)
	Values
	(@s_a_DomainID, @i_a_provider_id, @s_a_provider_name, @s_a_report_month, @s_a_file_path, @s_a_mail_sent, GetDate(), @s_a_file_name, @i_a_basepath_id);
END
GO
