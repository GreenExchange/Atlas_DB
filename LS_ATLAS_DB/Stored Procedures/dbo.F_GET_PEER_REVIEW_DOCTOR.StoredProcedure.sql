USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_GET_PEER_REVIEW_DOCTOR]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_GET_PEER_REVIEW_DOCTOR]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
					SELECT revdoc.Doctor_id,revdoc.Doctor_Name,COUNT(treat.Case_Id) case_cnt
					FROM TblReviewingDoctor revdoc LEFT OUTER JOIN tblTreatment treat ON revdoc.Doctor_id=treat.PeerReviewDoctor_ID  
					WHERE revdoc.Active = 1
					GROUP BY revdoc.Doctor_id,revdoc.Doctor_Name
					ORDER BY revdoc.Doctor_Name
 
END

GO
