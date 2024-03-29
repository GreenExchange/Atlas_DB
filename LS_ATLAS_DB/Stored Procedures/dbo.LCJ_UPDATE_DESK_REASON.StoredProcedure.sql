USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UPDATE_DESK_REASON]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_UPDATE_DESK_REASON]
@CASE_ID NVARCHAR(50),
@Change_Reason nvarchar(200)=null,
@history_id int =null
as 
begin
	set @history_id=(Select history_id from tblCaseDeskHistory where bt_status=1 and case_id=@case_id)
	update tblCaseDeskHistory
	set change_reason=@change_reason
	where history_id=@history_id
end

GO
