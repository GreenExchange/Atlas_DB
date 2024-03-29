USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_advanced_search_saved_query_retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_advanced_search_saved_query_retrieve]
(
	@i_a_fk_user_id	INT = 1
)
AS
BEGIN

	SELECT
		ROW_NUMBER() OVER (ORDER BY query_name) As s_no,
		*
	FROM
		tbl_advanced_search_saved_query query
	WHERE 
			UserID = @i_a_fk_user_id
	ORDER BY
			query_name ASC	  
END

GO
