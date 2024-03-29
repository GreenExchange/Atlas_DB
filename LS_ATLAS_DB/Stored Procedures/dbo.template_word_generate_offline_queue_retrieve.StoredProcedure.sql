USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[template_word_generate_offline_queue_retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[template_word_generate_offline_queue_retrieve] 
AS  
BEGIN  
SET NOCOUNT ON 
	SELECT
		pk_offline_queue_id,
		domain_id,
		fk_template_id,
		case_ids,
		save_as,
		NodeName,
		is_upload_docs,
		fk_configured_by_id,
		configured_date,
		is_processed,
		processed_date,
		file_name,
		file_path,
		configuredBy=U.DisplayName,
		template_name=W.template_name,
		Email,
		template_tag_array,
		template_path,
		template_name,	
		changed_status
	FROM
		tbl_template_word_offline_queue Q
		JOIN IssueTracker_Users U ON U.UserId = Q.fk_configured_by_id
		JOIN tbl_template_word W ON W.pk_template_id = Q.fk_template_id
	WHERE
		ISNULL(is_processed,0)	=	0
	ORDER BY
		pk_offline_queue_id ASC
SET NOCOUNT OFF  
END
GO
