USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADD_PROCESSTYPE]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ADD_PROCESSTYPE]--'test'
(
@SZ_PROCESS_NAME nvarchar(300)
)
AS
BEGIN
	
	BEGIN

    
	BEGIN TRAN
	
		
		INSERT INTO MST_PROCESS
		(
		SZ_PROCESS_CODE,
		SZ_PROCESS_NAME
				
		)

		VALUES(
		'PROC-',
		@SZ_PROCESS_NAME
		
		)					

		DEclare @MaxID as int
		DECLARE @SZ_MAX_CODE AS NVARCHAR(20)
		SET @SZ_MAX_CODE = (SELECT MAX(substring(SZ_PROCESS_CODE,0,10)) FROM MST_PROCESS)
		DEclare @SZ_PROCESS_CODE as nvarchar(20)

		set	@MaxID=	(select MAX(substring(SZ_PROCESS_CODE,6,4)) + 1 from MST_PROCESS)

		set @SZ_PROCESS_CODE= 'PROC-' + convert(varchar,(RIGHT ('0'+ CAST (@MaxID as nvarchar), 3)))			
print(@SZ_PROCESS_CODE)

		update MST_PROCESS set SZ_PROCESS_CODE=@SZ_PROCESS_CODE where SZ_PROCESS_CODE='PROC-'

		COMMIT TRAN

	END

END
GO
