USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[autocaseclosedwithdrawn]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[autocaseclosedwithdrawn]
as
begin
declare 
@cid varchar(50)
declare 
mycur cursor local for
select case_id
from 
lcj_vw_Casesearchdetails where settlement_amount = 0.00 and settlement_int =0.00 
and settlement_ff=0.00 and settlement_af=0.00
and status not like '%closed%'
open mycur
fetch next from mycur into @cid
while @@fetch_status=0
begin
insert into tblnotes values ('CASE WITHDRAWN AND CLOSED BY SYSTEM','Activity',0,@cid,getdate(),'system')
update tblcase set status='CLOSED' where case_id=@cid 
fetch next from mycur into @cid
end
close mycur
deallocate mycur
end
GO
