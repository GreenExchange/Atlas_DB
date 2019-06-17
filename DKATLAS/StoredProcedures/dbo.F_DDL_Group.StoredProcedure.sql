USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_Group]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_Group]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 0 as Group_ID, '' as Email,' ---Select Group--- ' as group_name
	UNION
	SELECT pk_group_id as Group_ID, Email,group_name
	FROM tbl_group 
	ORDER BY group_name
	
	SET NOCOUNT OFF ; 


END
GO
