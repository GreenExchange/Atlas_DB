USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[FHA_Reviews_Details]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Serge Rosenthal
-- ALTER date: 03/30/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[FHA_Reviews_Details] 
		@Case_id VARCHAR(50)  
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT     TblReviews.Case_id, TblReviewingDoctor.Doctor_Name, TblReviews.Review_Date, tblServiceType.ServiceDesc, TblReviews.Review_Notes,TblReviews.User_id
FROM         TblReviewingDoctor INNER JOIN
                      TblReviews ON TblReviewingDoctor.Doctor_id = TblReviews.Review_Doctor INNER JOIN
                      tblServiceType ON TblReviews.Service_type = tblServiceType.ServiceType_ID
WHERE TblReviews.Case_id=@CASE_ID
	
END
GO
