USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[reset_all_batchprint_in_progress_queue]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[reset_all_batchprint_in_progress_queue]
AS
BEGIN	
	UPDATE
		tbl_batch_print_offline_queue
	SET
		in_progress				=	0
	WHERE
		ISNULL(in_progress,0)	=	1
END

GO
