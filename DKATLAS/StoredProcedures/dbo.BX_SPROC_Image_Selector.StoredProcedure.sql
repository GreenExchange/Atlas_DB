USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SPROC_Image_Selector]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BX_SPROC_Image_Selector]
@CASE_ID INT, @DOCUMENT_ID INT

AS
DECLARE @WEB VARCHAR(200),@UNC VARCHAR(200),@PAGE_COUNT_TOT INT,@DOC_COUNT_TOT INT

BEGIN
SELECT TOP(1) @WEB=WEB , @UNC=UNC FROM BX_IMAGE_DIR 

select @PAGE_COUNT_TOT =sum(page_count),@DOC_COUNT_TOT=COUNT(IMAGEID) from bx_images where (DocumentId = @DOCUMENT_ID) AND (Case_Id = @CASE_ID) AND (DeleteFlag = 0) AND (ACCT_IMAGE =0)


SELECT      ImageId, CONVERT(VARCHAR(8), ScanDate, 1) AS SCANDATE, DocumentId, 
                        @WEB + ImagePath + '/' + FileName AS Image_source_web,
						@UNC + replace(ImagePath,'/','\') + '\' + FileName AS Image_source_unc,FILENAME,page_count,@PAGE_COUNT_TOT AS PAGE_COUNT_TOT,@DOC_COUNT_TOT AS DOC_COUNT_TOT
FROM          dbo.BX_IMAGES
WHERE      (DocumentId = @DOCUMENT_ID) AND (Case_Id = @CASE_ID) AND (DeleteFlag = 0) AND (ACCT_IMAGE = 0)
ORDER BY IMAGEID ASC

END
GO
