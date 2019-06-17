USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[template_word_generate_offline_queue_delete]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[template_word_generate_offline_queue_delete] 
(
	@s_a_domain_id				VARCHAR(50),
	@i_a_pk_offline_queue_id	INT
)
AS 
BEGIN  
SET NOCOUNT ON 
	
	DELETE FROM tbl_template_word_offline_queue WHERE pk_offline_queue_id = @i_a_pk_offline_queue_id AND domain_id = @s_a_domain_id

SET NOCOUNT OFF  
END
GO
