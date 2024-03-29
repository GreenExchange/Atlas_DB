USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteCourt]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteCourt]
(
	@Court_Id int,
	@OperationResult INT OUTPUT
)


AS
	IF EXISTS(select top 1 court_id from tblcase where court_id=@Court_Id) BEGIN
		SET @OperationResult=1
		SELECT @OperationResult
	END
	ELSE
		BEGIN
			BEGIN TRAN
			DELETE from tblCourt where Court_Id = @Court_Id
			SET @OperationResult=0
			COMMIT TRAN
			SELECT @OperationResult
		END
GO
