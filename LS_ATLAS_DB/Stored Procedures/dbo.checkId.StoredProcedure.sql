USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[checkId]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkId]

(  
@mid varchar(50)  
)  
as  
begin 
SET NOCOUNT ON
declare
@cnt varchar(50),
@SQ NVARCHAR(100)

creATE TABLE #TEMP (CNT VARCHAR(50))

set @cnt = 0  
SET @SQ = 'SELECT CASE_ID FROM dbo.TBLCASE WHERE CASE_ID LIKE ''%' + @MID + ''''

PRINT @SQ 

INSERT INTO #TEMP
EXECUTE SP_EXECUTESQL @SQ 


SELECT ISNULL(CNT,0) AS CNT FROM #TEMP
DROP TABLE #TEMP

 
end

GO
