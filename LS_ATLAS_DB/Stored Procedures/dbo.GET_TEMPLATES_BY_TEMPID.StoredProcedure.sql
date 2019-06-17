USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GET_TEMPLATES_BY_TEMPID]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_TEMPLATES_BY_TEMPID]
	@DomainId nvarchar(50),
	@templateid int
AS
BEGIN
	SELECT 
		I_TEMPLATE_ID [TEMPLATE_ID],
		SZ_TEMPLATE_NAME [TEMPLATE_NAME],
		SZ_TEMPLATE_FILENAME [TEMPLATE_FILE_NAME]
	FROM  
		MST_TEMPLATES 
	where I_TEMPLATE_ID = @templateid
	AND DomainId=@DomainId
END

GO
