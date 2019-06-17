USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[case_search_saved_query_retrieve]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[case_search_saved_query_retrieve] -- [case_search_saved_query_retrieve] 'localhost',1111
(
	--@DomainID VARCHAR(100),
	@i_a_fk_user_id	INT = 1
)
AS
BEGIN

	SELECT
		ROW_NUMBER() OVER (ORDER BY query_name) As s_no,
		*
	FROM
		case_search_saved_query query
	WHERE 
		--	DomainID = @DomainID AND
			
			 UserID = @i_a_fk_user_id

	ORDER BY
			query_name ASC	  
END
GO
