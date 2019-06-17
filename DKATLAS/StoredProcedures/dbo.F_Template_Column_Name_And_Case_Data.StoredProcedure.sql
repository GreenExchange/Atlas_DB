USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Template_Column_Name_And_Case_Data]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Template_Column_Name_And_Case_Data] --[F_Template_Column_Name_And_Case_Data] '1',''
	@i_a_type int,
	@s_a_case_id varchar(100)=null
	
AS  
BEGIN	

	if(@i_a_type = 0)
		select top 1 *  from  LCJ_VW_CaseSearchDetails_RTF where case_id = @s_a_case_id
	else if(@i_a_type = 1)
		SELECT UPPER(COLUMN_NAME) COLUMN_NAME FROM INFORMATION_SCHEMA.Columns where TABLE_NAME = 'LCJ_VW_CaseSearchDetails_RTF'
	else 
		SELECT COLUMN_NAME FROM MST_TEMPLATES_COLUMN
		--SELECT TOP 500 UPPER(COLUMN_NAME) COLUMN_NAME FROM INFORMATION_SCHEMA.Columns where TABLE_NAME = 'LCJ_VW_CaseSearchDetails_RTF'
END
GO
