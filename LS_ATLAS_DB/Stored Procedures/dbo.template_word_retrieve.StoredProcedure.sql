USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[template_word_retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[template_word_retrieve] 
(
	 @DomainId			varchar(50)	=	'',
	 @i_a_template_id	int			=	0,	 
	 @i_a_user_id		int			=	1,
	 @s_a_case_id		varchar(50)	=	''
)
AS  
BEGIN  
SET NOCOUNT ON 

	DECLARE @s_a_user_name VARCHAR(50)

	SET @s_a_user_name = (select UserName FROM IssueTracker_Users WHERE UserID = @i_a_user_id )

		if(@i_a_template_id !=0)
		begin
				SELECT  
					pk_template_id,
					template_name,
					remarks,
					template_file_name,	
					template_path,
					ISNULL(fk_default_node_id,'0') AS fk_default_node_id,		
					'TemplateManagerWordEditor.aspx?case_id='+
					CONVERT(varchar,@s_a_case_id)+
						'&Name=' +template_name+
			 
						'&file_number=' +@s_a_case_id+
						--'&status=' +@s_a_case_id+
						'&ID=' +CONVERT(varchar,	pk_template_id) +
						'&USERID=' +CONVERT(varchar,	@i_a_user_id) +
						'&USERNAME=' +@s_a_user_name		+	   
						'&DomainID=' +@DomainId	  as Link,
						template_tag_array,
						template_path+'|'+template_tag_array+'|'+CAST(pk_template_id AS VARCHAR(MAX)) as template_path_template_tag_array,
						ISNULL(tbl_template_word.Status_Id,'0') AS Status_Id,
						Status_Type,
						NodeName

				FROM   
						tbl_template_word
						LEFT JOIN tblStatus ON tblStatus.Status_Id=tbl_template_word.Status_Id
						LEFT JOIN MST_DOCUMENT_NODES ON MST_DOCUMENT_NODES.NodeID=tbl_template_word.fk_default_node_id
				WHERE
					tbl_template_word.DomainId = @DomainId
					AND pk_template_id = @i_a_template_id
				order by 
						template_name
		end
		ELSE
		BEGIN
				SELECT  
					pk_template_id,
					template_name,
					remarks,
					template_file_name,	
					template_path,		
					ISNULL(fk_default_node_id,'0') AS fk_default_node_id,	
					'TemplateManagerWordEditor.aspx?case_id='+
					CONVERT(varchar,@s_a_case_id)+
						'&Name=' +template_name+
			 
						'&file_number=' +@s_a_case_id+
						--'&status=' +@s_a_case_id+
						'&ID=' +CONVERT(varchar,	pk_template_id) +
						'&USERID=' +CONVERT(varchar,	@i_a_user_id) +
						'&USERNAME=' +@s_a_user_name	+	   
						'&DomainID=' +@DomainId	as Link,
					template_tag_array,
					template_path+'|'+template_tag_array+'|'+CAST(pk_template_id AS VARCHAR(MAX)) as template_path_template_tag_array,
					ISNULL(tbl_template_word.Status_Id,'0') AS Status_Id,
						Status_Type,
						NodeName
				FROM   
						tbl_template_word
						LEFT JOIN tblStatus ON tblStatus.Status_Id=tbl_template_word.Status_Id
						LEFT JOIN MST_DOCUMENT_NODES ON MST_DOCUMENT_NODES.NodeID=tbl_template_word.fk_default_node_id
				WHERE
					tbl_template_word.DomainId = @DomainId
					order by 
						template_name
		END
 SET NOCOUNT OFF  
END
GO
