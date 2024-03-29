USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DM_File_Update]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DM_File_Update]  







	@i_a_IMAGEID			INT ,  







	@s_a_FILENAME			NVARCHAR(255),  







	@s_a_FILEPATH			NVARCHAR(255), 







	@dt_a_revisedDate		DATETIME	,







	@i_a_revisedUserid		INT			,







	@i_a_from_flag			INT			







  







AS 







BEGIN  







SET NOCOUNT ON







	UPDATE 







		dbo.TBLDOCIMAGES  







	SET 







		FILENAME		=	@s_a_FILENAME,   







		FILEPATH		=	@s_a_FILEPATH,  







		STATUS			=	1  ,







		Revisededdate	=	@dt_a_revisedDate,







		Revisededuser	=	@i_a_revisedUserid,







		from_flag		=	@i_a_from_flag







	WHERE 







		IMAGEID=@i_a_IMAGEID   







		







	UPDATE







			dbo.tblImageTag







	SET







			DateModified	=	GETDATE()







	WHERE







			ImageID			=	@i_a_IMAGEID 







	







	DECLARE @i_l_duplicate INT = 0	







	SELECT @i_l_duplicate	=	COUNT(*) FROM  dbo.tbl_ImageTag_Modifiedby	WHERE ImageId	=	@i_a_IMAGEID







			IF(@i_l_duplicate = 0)







			BEGIN







					INSERT INTO dbo.tbl_ImageTag_Modifiedby







					VALUES(@i_a_IMAGEID,@i_a_revisedUserid)







			END







			ELSE







			BEGIN







					UPDATE







							dbo.tbl_ImageTag_Modifiedby







					SET







							modified_by		=	@i_a_revisedUserid







					WHERE







							ImageId			=	@i_a_IMAGEID







			END















 SET NOCOUNT OFF







END  







  







  --select top 10 * from tblImageTag
GO
