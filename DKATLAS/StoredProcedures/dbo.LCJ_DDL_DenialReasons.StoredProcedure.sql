USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_DenialReasons]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_DenialReasons]
--@DomainId NVARCHAR(50)
AS
begin

	SELECT '0' AS DenialReasons_ID , ' --- Select Reason --- 'DenialReasons_Type, '' AS DenialReasons_Value
	UNION
	SELECT   DISTINCT DenialReasons_ID, Upper(ISNULL(DenialReasons_Type, '')) AS DenialReasons_Type,
	 Upper(ISNULL(DenialReasons_Type, '')) AS DenialReasons_Value
	FROM         tblDenialReasons 
	WHERE     (1 = 1) --and DomainId=@DomainId 
	order by DenialReasons_Type
	
END
GO
