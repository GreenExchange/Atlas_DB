USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[get_template_tags_for_a_template]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_template_tags_for_a_template]
	@s_a_domain_id	VARCHAR(50),	
	@s_a_file_name	VARCHAR(MAX)
AS
BEGIN
	SELECT TOP 1
		template_tag_array=ISNULL(template_tag_array,'')
	FROM
		tbl_template_word
	WHERE
		DomainId					=	@s_a_domain_id AND
		LOWER(template_file_name)	=	LOWER(@s_a_file_name)
END
GO
