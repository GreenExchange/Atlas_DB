USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[batch_print_offline_fax_queue_retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[batch_print_offline_fax_queue_retrieve]
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
		pk_bp_fax_queue_id,
		DomainID=Q.Domain_Id,
		fk_bp_ef_status_id=Q.fk_bp_ef_status_id,
		FaxNumber,
		SentByUser,
		SentOn,
		IsAddedtoQueue=ISNULL(IsAddedtoQueue,0),
		isDeleted=ISNULL(Q.isDeleted,0),
		ResponseImageFileVirtualPath='\'+REPLACE(REPLACE(FI.FilePath,'//','\'),'/','\')+FI.Filename,
		RecipientName,
		CoverPageText,
		AddToQueueCount=ISNULL(AddToQueueCount,0),
		FaxQueueID=ISNULL(FaxQueueID,0),
		FI.BasePathId
	FROM
		tbl_batch_print_fax_queue Q
		JOIN tbl_batch_print_offline_email_fax_status R ON Q.fk_bp_ef_status_id = R.pk_bp_ef_status_id
		JOIN tblDocImages FI ON FI.ImageID = R.documentImageID AND FI.DomainId = R.DomainID
		JOIN tblBasePath FIBP ON FIBP.BasePathId = FI.BasePathId 
	WHERE
		ISNULL(Q.isDeleted,0)		=	0	AND
		ISNULL(R.isDeleted,0)		=	0	AND
		ISNULL(IsAddedtoQueue,0)	=	0
	ORDER BY
		pk_bp_fax_queue_id ASC
END
GO
