USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetExistingSettlements]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetExistingSettlements] 

(

@Case_Id NVARCHAR(100)

)

AS

--SELECT * from tblSettlements WHERE Case_Id = +@Case_Id

Declare @st as nvarchar(1000)
set @st = 'select * from tblSettlements where case_id in (''' + Replace(@Case_Id,',',''',''') + ''') '
print @st
exec sp_executesql @st
GO
