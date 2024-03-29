USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[batch_print_offline_queue_update]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[batch_print_offline_queue_update]
	@s_a_domain_id				VARCHAR(50),
	@i_a_pk_batch_print_id		INT,
	@dt_processed_date			DATETIME,
	@s_a_file_name				VARCHAR(MAX),
	@s_a_file_path				VARCHAR(MAX),
	@s_a_processed_ids			VARCHAR(MAX)
AS
BEGIN 
SET NOCOUNT ON
	Declare @failed_caseIds varchar(max);

	Select 
		@failed_caseIds = COALESCE(@failed_caseIds + ',',' ') + LTRIM(RTRIM(s)) 
	from 
		SplitString((Select case_ids from tbl_batch_print_offline_queue where pk_batch_print_Id=@i_a_pk_batch_print_id and DomainId=@s_a_domain_id), ',')
    where LTRIM(RTRIM(s)) not in (Select LTRIM(RTRIM(s)) from SplitString(@s_a_processed_ids, ',') )
	
	UPDATE tbl_batch_print_offline_queue 
	SET
		is_processed			=	1, --CASE WHEN ISNULL(@failed_caseIds,'') = '' THEN 1 ELSE 0 END,
		in_progress				=   0,
		processed_date			=	CASE WHEN ISNULL(@failed_caseIds,'') = '' THEN @dt_processed_date ELSE NULL END,
		file_name				=	@s_a_file_name,
		file_path				=	@s_a_file_path,
		processed_case_ids		=   @s_a_processed_ids,
        failed_case_ids			=   @failed_caseIds
	WHERE
		 pk_batch_print_Id		=	@i_a_pk_batch_print_id AND 
		 DomainId    			=	@s_a_domain_id

SET NOCOUNT OFF  
END
GO
