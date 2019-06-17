USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_MST_DIAGNOSIS_CODE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_MST_DIAGNOSIS_CODE]
@SZ_DIAGNOSIS_CODE_ID		INT=NULL,
@SZ_DIAGNOSIS_CODE			NVARCHAR(100)=NULL,
@SZ_DESCRIPTION				NVARCHAR(500)=NULL,
@SZ_DIAGNOSIS_TYPE_ID		NVARCHAR(20)=NULL

AS
BEGIN

		UPDATE MST_DIAGNOSIS_CODE
		SET		
			SZ_DIAGNOSIS_CODE=@SZ_DIAGNOSIS_CODE,		
			SZ_DESCRIPTION=@SZ_DESCRIPTION,			
			SZ_DIAGNOSIS_TYPE_ID=@SZ_DIAGNOSIS_TYPE_ID
		WHERE SZ_DIAGNOSIS_CODE_ID=@SZ_DIAGNOSIS_CODE_ID			
		
END

GO
