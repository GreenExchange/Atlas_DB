USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteServerTo]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteServerTo]
(
	@DomainId nvarchar(50),
	@Served_To int,
	@OperationResult INT OUTPUT
)


AS
	IF EXISTS(select top 1 * from tblcase (NOLOCK)  where Served_To = @Served_To AND DomainId = @DomainId) BEGIN
		SET @OperationResult=1
		SELECT @OperationResult
	END
	ELSE
		BEGIN
			BEGIN TRAN
			DELETE from tblServed  where ID = @Served_To AND @DomainId = DomainId
			SET @OperationResult=0
			COMMIT TRAN
			SELECT @OperationResult
		END

	
GO
