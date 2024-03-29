USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_document_log_insert]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_document_log_insert]
(
	@i_a_user_id			INT,
	@i_a_node_id			INT,
	@s_a_document_name		VARCHAR(100),
	@s_a_operation			VARCHAR(100),
	@dt_a_log_date_time		DATETIME,
	@s_a_log_action         VARCHAR(MAX),
	@i_a_Case_id			VARCHAR(100)
)
AS
BEGIN		
		
	DECLARE @s_l_message VARCHAR(MAX)
    DECLARE @i_l_result  INT
	INSERT INTO dbo.tbl_document_log
	(
		fk_user_id,
		fk_node_id,
		document_name,
		operation,
		log_date_time,
		log_action,
		pk_case_id
	)
	VALUES
	(
		@i_a_user_id,
		@i_a_node_id,
		@s_a_document_name,
		@s_a_operation,
		@dt_a_log_date_time,
		@s_a_log_action,
		@i_a_Case_id
	)
	SET @s_l_message = 'document log details inserted successfully'
	SET @i_l_result  = 1
	SELECT @s_l_message AS [MESSAGE], @i_l_result AS [RESULT]
END

--select * from tbl_document_log
--select * from MST_DOCUMENT_NODES

GO
