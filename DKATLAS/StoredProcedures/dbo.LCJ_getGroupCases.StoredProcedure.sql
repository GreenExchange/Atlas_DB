USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_getGroupCases]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_getGroupCases](
@Case_Id varchar(50)
)
as
begin
select case_id,group_id from tblcase where group_id in (select group_id from tblcase where case_id=@case_id and group_id > 0) 
end
GO
