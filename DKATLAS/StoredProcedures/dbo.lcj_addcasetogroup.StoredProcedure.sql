USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[lcj_addcasetogroup]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lcj_addcasetogroup](
@Case_IdNew nvarchar(50),
@Case_IdOld nvarchar(50),
@Result nvarchar output
)
as
begin
declare
@cnt1 int,
@cnt2 int,
@gids nvarchar(200),
@group_id int,
@max_seq int

select @cnt1 = count(*) from tblcase where case_id=@Case_IdNew and group_data=1
if @cnt1 > 0 
begin
set @Result = 2
end
else
begin
    select @group_id = group_id from tblcase where case_id=@Case_IdOld
    select @max_seq = max(group_case_sequence) from tblcase where group_id = @group_id

    update tblcase set group_id=@group_id,group_data=1, group_case_sequence = @max_seq + 1 where case_id=@Case_IdNew

    select @gids = group_all from tblcase where case_id=@Case_IdOld

    update tblcase set group_all = @gids +',' + @Case_IdNew where group_id = @group_id
    set @Result = 0
end

end
select * from tblgroup
GO
