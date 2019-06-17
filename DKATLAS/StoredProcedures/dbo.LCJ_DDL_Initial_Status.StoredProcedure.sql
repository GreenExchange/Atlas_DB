USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Initial_Status]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Initial_Status]   --[LCJ_DDL_Initial_Status]

AS  
begin  

	SET NOCOUNT ON;
	
	SELECT '0' as ID,' ---Select Case Status--- ' as Name, '' As value
	UNION
	SELECT DISTINCT ID, Name,Name as value FROM tblCaseStatus  ORDER BY Name
	
	SET NOCOUNT OFF ;

end

GO
