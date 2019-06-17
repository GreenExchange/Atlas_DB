USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Initial_Status]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Initial_Status]   --[LCJ_DDL_Initial_Status]
@DomainId NVARCHAR(50)
AS  
begin  

	SET NOCOUNT ON;
	
	SELECT '0' as ID,' ---Select Case Status--- ' as Name, '' As value
	UNION
	SELECT DISTINCT ID, Name,Name as value FROM tblCaseStatus WHERE  DomainID = @DomainID ORDER BY Name
	
	SET NOCOUNT OFF ;

end

GO
