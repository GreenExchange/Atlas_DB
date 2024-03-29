USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GetAttachmentsPath]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAttachmentsPath] --'FH10-68763'
	@Case_ID varchar(50)
AS
BEGIN
	SELECT
		ImagePath + '\' + FileName [InputFilePath]
	FROM
		tblExhibitSequence INNER JOIN tblimages
		ON Exhibit_Id = DocumentID
	WHERE 
		tblimages.Case_Id = @Case_ID
		and tblExhibitSequence.Case_Id = @Case_ID
		and DocumentID in(select exhibit_id from tblexhibitsequence where case_id=@Case_ID)	
	ORDER BY Sequence ASC
END

GO
