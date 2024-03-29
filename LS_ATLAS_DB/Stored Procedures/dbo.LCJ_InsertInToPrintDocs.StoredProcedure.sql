USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_InsertInToPrintDocs]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_InsertInToPrintDocs] (
@mids NVARCHAR(3000),
@Doc_Id Int
)
as
begin
declare
@ST NVARCHAR(3500)

SET @MIDS = REPLACE(@MIDS,' ','')

--TRUNCATE TABLE tblPrintDocs
delete from tblPrintDocs where Printed_On < (getDate() - 2)

SET @ST = 'SELECT DISTINCT CASE_ID, ' + cast(@Doc_Id as varchar(10)) + ' as Doc_Id, getDate() as Requested_On, Null as Requested_By, null as Printed_On FROM TBLCASE WHERE CASE_ID IN (''' + REPLACE(@MIDS,',',''',''')+ ''') order by case_id'

-- Print @ST

INSERT INTO tblPrintDocs 
EXEC SP_EXECUTESQL @ST

	
end

GO
