USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_DenialReasons]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_DenialReasons] 
	@DomainId NVARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as DenialReasons_Id,' ---Select Denial Reasons--- ' as DenialReasons_Type
	UNION
	SELECT DenialReasons_Id AS DenialReasons_Id, LTRIM(RTRIM(DenialReasons_Type)) as InitialStatus_Type FROM tblDenialReasons 
	WHERE DenialReasons_Type not like '%select%' and DenialReasons_Id <> 0 and DenialReasons_Type <>''
		and DomainId = @DomainId
	ORDER BY DenialReasons_Type
	
	SET NOCOUNT OFF ; 
	

END

GO
