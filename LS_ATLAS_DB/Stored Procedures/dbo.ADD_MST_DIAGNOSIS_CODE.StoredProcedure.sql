USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_MST_DIAGNOSIS_CODE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADD_MST_DIAGNOSIS_CODE]
@DomainId					NVARCHAR(50),
@SZ_DIAGNOSIS_CODE_ID		INT=NULL,
@SZ_DIAGNOSIS_CODE			NVARCHAR(100)=NULL,
@SZ_DESCRIPTION				NVARCHAR(500)=NULL,
@SZ_DIAGNOSIS_TYPE_ID		NVARCHAR(20)=NULL

AS
BEGIN

		INSERT INTO MST_DIAGNOSIS_CODE
		(
			
			SZ_DIAGNOSIS_CODE,	
			SZ_DESCRIPTION,		
			SZ_DIAGNOSIS_TYPE_ID,
			DomainId
		)
		VALUES
		(
			
			@SZ_DIAGNOSIS_CODE,	
			@SZ_DESCRIPTION,		
			@SZ_DIAGNOSIS_TYPE_ID,
			@DomainId
		)
END

GO
