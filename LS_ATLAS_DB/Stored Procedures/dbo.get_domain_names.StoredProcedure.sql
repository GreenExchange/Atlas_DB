USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[get_domain_names]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[get_domain_names]
AS
BEGIN
	SELECT
		'' [domain_name],
		' ~ ~ ' AS [ID],
		'--Select--' AS [Text]
	UNION ALL
	SELECT DISTINCT
		domain_name,
		domain_name+'~'+appname+'~'+webservice_url [ID],
		domain_name [Text]
	FROM 
		tbl_domain_master
	ORDER BY 
		domain_name ASC
END
GO
