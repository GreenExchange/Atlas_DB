USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[TEST]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TEST] AS

			DECLARE @MaxMatter_ID as Integer
			DECLARE @MM_ID as  INTEGER
			DECLARE @Matter_Id as NVARCHAR(20)

			Select @MaxMatter_Id =Convert(Integer, SUBSTRING(MAX(Matter_Id),PATINDEX('%-%' , MAX(Matter_Id) )+1, 8)) from tblMatter 
			Set @MM_ID = @MaxMatter_Id + 1
			
			IF (@MaxMatter_Id = NULL)
				--SET @Matter_Id  = 'LCJ' + DATEPART(year, GETDATE()) + '-' + '1'
				SELECT @Matter_Id  = 'LCJ' + RIGHT(CAST(DATEPART(year, GETDATE()) AS NVARCHAR),2) + '-' + '1'
			ELSE
				
				--SET @Matter_Id  = 'LCJ' +  DATEPART(year, GETDATE()) + '-' + CONVERT( VARCHAR(8) , (@MaxMatter_Id + 1))
				SELECT @Matter_Id  = 'LCJ' + RIGHT( CAST(DATEPART(year, GETDATE()) AS NVARCHAR),2) + '-' + CONVERT( VARCHAR(8) , (@MM_ID))
				--RETURN CONVERT(NVARCHAR, @Matter_Id)

GO
