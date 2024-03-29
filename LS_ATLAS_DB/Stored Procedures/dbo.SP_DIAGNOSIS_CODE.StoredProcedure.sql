USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_DIAGNOSIS_CODE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DIAGNOSIS_CODE]
@SZ_DIAGNOSIS_CODE NVARCHAR(20),
@SZ_DESCRIPTION NVARCHAR(20),
@FLAG AS NVARCHAR(20)
AS
BEGIN
	
	IF @FLAG= 'ALLList'
	BEGIN	
			SELECT	SZ_DIAGNOSIS_CODE_ID,
					SZ_DIAGNOSIS_CODE,
					SZ_DESCRIPTION
			FROM MST_DIAGNOSIS_CODE
			WHERE   SZ_DIAGNOSIS_CODE like @SZ_DIAGNOSIS_CODE + '%'
					and SZ_DESCRIPTION like @SZ_DESCRIPTION + '%'
			ORDER BY SZ_DESCRIPTION	ASC
				
	END

END

GO
