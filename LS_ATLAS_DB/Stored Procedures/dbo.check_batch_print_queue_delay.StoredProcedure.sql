USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[check_batch_print_queue_delay]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[check_batch_print_queue_delay]
AS
BEGIN
	SELECT
		pk_batch_print_Id,
		Q.[DomainId],
		[printing_type],
		[case_ids],
		[node_name],
		[changed_status],
		is_upload_docs=CASE WHEN ISNULL(is_upload_docs,0) = 1 THEN 'Yes' ELSE 'No' END,
		[fk_configured_by_id],
		configured_date,
		is_processed,
		processed_date,
		file_name,
		file_path,
		configuredBy=U.DisplayName,
		Email,
		total_delay_hrs=CONVERT(VARCHAR(5),DATEADD(MINUTE,DATEDIFF(MINUTE,configured_date,GETDATE()),0), 114),
		BT.Name AS batch_type_name,
		EnityType=(STUFF((SELECT N', ' + ET.Name FROM tbl_batch_entity_type ET WHERE ET.ID IN (SELECT items FROM dbo.STRING_SPLIT(entity_type_ids,',')) ORDER BY ET.Name FOR XML PATH(''), TYPE).value(N'.[1]', N'nvarchar(max)'), 1, 2, N'')),
		template_name
	FROM
		tbl_batch_print_offline_queue Q
		JOIN IssueTracker_Users U ON U.UserId = Q.fk_configured_by_id
		JOIN tbl_batch_type BT ON Q.fk_batch_type_id = BT.ID
		LEFT JOIN tbl_template_word TW ON TW.pk_template_id = Q.fk_template_id
	WHERE
		ISNULL(is_processed,0)						=	0	AND 
		ISNULL(in_progress,0)						=	0	AND		
		ISNULL(IsDeleted,0)							=	0	AND
		DATEDIFF(MINUTE, configured_date, GETDATE()) >	60
	ORDER BY
		pk_batch_print_Id ASC
END
GO
