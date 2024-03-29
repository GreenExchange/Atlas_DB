USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[DDL_Forum]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DDL_Forum] -- [DDL_Forum] 'GLF'
(
	@DomainID VARCHAR(50)
)
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as Forums_ID,' ---Select Final Status--- ' as Forum_Name, '' AS Forum_Name_Value
	UNION
	SELECT Forums_ID AS Forums_ID , Forum_Name as Forum_Name, Forum_Name AS Forum_Name_Value
	FROM tbl_Forum 
	WHERE DomainId = @DomainID
	ORDER BY Forum_Name
	
	SET NOCOUNT OFF ; 

END

GO
