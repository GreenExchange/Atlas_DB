USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[ReportType_DDL]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReportType_DDL]
	
AS
BEGIN

	SET NOCOUNT ON;

SELECT ' ---Select Report Type--- ' AS Report_Type,'' as Report_Type_Value
	UNION
	SELECT   DISTINCT Report_Type as Report_Type, 
					Report_Type as Report_Type_Value
	FROM         tblTransactionType 
END
GO
