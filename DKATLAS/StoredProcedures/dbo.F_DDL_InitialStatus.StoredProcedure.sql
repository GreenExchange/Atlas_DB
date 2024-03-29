USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_InitialStatus]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_InitialStatus] --[F_DDL_InitialStatus] 'dl'
--(
	--@DomainID VARCHAR(50)
--)	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as InitialStatus_Id,' ---Select Case Status--- ' as InitialStatus_Type, ''  as InitialStatus_Value
	UNION
	SELECT ID AS InitialStatus_Id, name as InitialStatus_Type, name as InitialStatus_Value FROM tblCaseStatus WHERE name not like '%select%' and ID <> 0 --AND DomainID = @DomainID
	 ORDER BY InitialStatus_Type
	
	SET NOCOUNT OFF ; 

END

GO
