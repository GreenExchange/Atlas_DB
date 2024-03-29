USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_PEER_REVIEW_DOCTOR]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_PEER_REVIEW_DOCTOR]
@DomainId nvarchar(50),
@DOCTOR_ID NVARCHAR(100)
AS
BEGIN
IF NOT EXISTS (SELECT * FROM tblTreatment   WHERE PeerReviewDoctor_ID=@DOCTOR_ID and DomainId = @DomainId)
	BEGIN
				UPDATE TblReviewingDoctor  SET Active = 0 WHERE DOCTOR_ID = @DOCTOR_ID and DomainId = @DomainId
				SELECT 0 AS [delete]
	END	
ELSE
	BEGIN
				SELECT 1 AS [delete]
	END 
END

GO
