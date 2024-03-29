USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[FHA_Reviews_Add]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Serge Rosenthal
-- ALTER date: 03/30/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[FHA_Reviews_Add]
@Doctor int,@Service_Type tinyint,@Case_id varchar(50), @Review_Date varchar(20), @Review_Notes varchar (500),@user_id varchar(50)
AS
DECLARE @Notes varchar(200)
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO TBLREVIEWS (Case_id,Review_Doctor,Review_Date,Service_Type,Review_Notes)
VALUES (@CASE_ID,@DOCTOR,@REVIEW_DATE,@SERVICE_TYPE,@REVIEW_NOTES)

SET @NOTES = 'PEER REVIEW INFORMATION ADDED FOR THIS CASE'

EXEC lcj_addnotes @case_id=@case_id,@notes_type='Activity',@NDesc=@notes,@user_id=@user_id,@applytogroup=0

 END
GO
