USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[fncISAOB]    Script Date: 6/17/2019 2:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fncISAOB](@Case_id varchar(50))
returns varchar(10) as
BEGIN
Declare @OutputString varchar(10)
Declare @AOBCount int
	set @AOBCount = (select count(*) from TBLIMAGES  where DOCUMENTID ='11' and CASE_ID = @Case_id)
	if(@AOBCount =0)
		set @OutputString = 'No'
	else
		set @OutputString = 'Yes'
 
 RETURN @OutputString 
END
GO
