USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_COLUMN_NAME_AND_CASE_DATA]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_COLUMN_NAME_AND_CASE_DATA] --[SP_GET_COLUMN_NAME_AND_CASE_DATA] '1'
	@Type int,
	@Case_ID varchar(100)=null
	
AS  
BEGIN	

	if(@Type = 0)
		select top 1 *  from  LCJ_VW_CaseSearchDetails_RTF where case_id = @Case_ID
	else 
		SELECT UPPER(COLUMN_NAME) COLUMN_NAME FROM INFORMATION_SCHEMA.Columns where TABLE_NAME = 'LCJ_VW_CaseSearchDetails_RTF'
END
GO
