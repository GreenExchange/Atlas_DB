USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_FILE_NODE]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_DELETE_FILE_NODE]

@NODEID NVARCHAR(20)=NULL

AS 
BEGIN

begin transaction deletenode

IF NOT EXISTS(SELECT IMAGEID FROM TBLIMAGETAG
			WHERE IMAGEID=@NODEID)

	BEGIN
	
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
		WHERE IMAGEID=@NODEID

			if @@error<>0
					begin
						rollback transaction deletenode
						return 0
					end

		DELETE FROM TBLIMAGETAG
		WHERE IMAGEID=@NODEID

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
