USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_NODE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_NODE]

@NODEID NVARCHAR(20)=NULL

AS 
BEGIN

begin transaction deletenode

IF NOT EXISTS(SELECT IMAGEID FROM TBLIMAGETAG
WHERE TAGID IN(SELECT NODEID FROM TBLTAGS
WHERE NODEID=@NODEID))

	BEGIN

		DELETE FROM TBLTAGS
		WHERE NODEID=@NODEID

		if @@error<>0
			begin
				rollback transaction deletenode
				return 0
			end
		
		commit transaction deletenode
		return 1
	END
ELSE

	BEGIN
		DELETE FROM TBLDOCIMAGES
		WHERE IMAGEID IN (SELECT IMAGEID FROM TBLIMAGETAG
		WHERE TAGID IN(SELECT NODEID FROM TBLTAGS
		WHERE NODEID=@NODEID))


		DELETE FROM TBLIMAGETAG
		WHERE TAGID IN(SELECT NODEID FROM TBLTAGS
		WHERE NODEID=@NODEID)

		DELETE FROM TBLTAGS
		WHERE NODEID=@NODEID

		if @@error<>0
					begin
						rollback transaction deletenode
						return 0
					end
				
				commit transaction deletenode
				return 1

	END



END

GO
