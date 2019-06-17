USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GETFIELD_TEMPLATES]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETFIELD_TEMPLATES]
	@I_TEMPLATE_ID AS INT
AS
BEGIN
	SELECT 
		I_TEMPLATE_ID,
		SZ_MERGE_FIELD,
		SZ_DATA_FIELD
	FROM
		TXN_TEMPLATE_COLUMNS
	WHERE 
		I_TEMPLATE_ID = @I_TEMPLATE_ID	
			
END
GO
