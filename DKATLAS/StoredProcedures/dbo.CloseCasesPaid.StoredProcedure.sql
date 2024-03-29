USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[CloseCasesPaid]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CloseCasesPaid]
as
begin
declare
@cid varchar(50),
@c money,
@cdate datetime,
@sc money,
@i money,
@idate datetime,
@si money,
@ff money,
@ffdate datetime,
@sff money,
@af money,
@afdate datetime,
@saf money

set @c = 0
set @i = 0
set @ff = 0
set @af = 0


declare
mycur cursor local for
select case_id,settlement_amount,settlement_int,settlement_ff,settlement_af
from lcj_vw_Casesearchdetails where status not like '%CLOSED%' and settlement_af >0 and case_id not in (select case_id from tobecollected)
open mycur
fetch next from mycur into @cid,@sc,@si,@sff,@saf
while @@fetch_status=0
begin




select @c = transactions_amount,@cdate=transactions_date from tbltransactions where case_id=@cid and transactions_type='C'
select @i = transactions_amount,@idate=transactions_date from tbltransactions where case_id=@cid and transactions_type='I'
select @ff = transactions_amount,@ffdate=transactions_date from tbltransactions where case_id=@cid and transactions_type='FFC'
select @af = transactions_amount,@afdate=transactions_date from tbltransactions where case_id=@cid and transactions_type='AF'

set @c = isnull(@c,0)
set @i = isnull(@i,0)
set @ff = isnull(@ff,0)
set @af = isnull(@af,0)

if (convert(varchar,@c) = convert(varchar,@sc)) and (convert(varchar,@i) = convert(varchar,@si)) and (convert(varchar,@ff) = convert(varchar,@sff)) and (convert(varchar,@af) = convert(varchar,@saf))
begin
print '---------------can be closed----------------------'
print @cid
print convert(varchar,@c) + '----' + convert(varchar,@sc)
print convert(varchar,@i) + '----' +  convert(varchar,@si)
print convert(varchar,@ff) + '----' + convert(varchar,@sff)
print convert(varchar,@af) + '-------' + convert(varchar,@saf)

insert into tblnotes values ('CASE PAID AND CLOSED BY SYSTEM','Activity',0,@cid,getdate(),'system')
update tblcase set status='CLOSED' where case_id=@cid


end
else
begin
print '---------------cannot be closed----------------------'
insert into tobecollected
select @cid,
'settlement amount = ' +  convert(varchar,@sc) + '; Principal Received = '+ convert(varchar,@c),
'settlement Int= ' +  convert(varchar,@si) + '; Int Received = '+ convert(varchar,@i),
'settlement FF = ' +  convert(varchar,@sff) + '; FF Received = '+ convert(varchar,@ff),
'settlement AF= ' +  convert(varchar,@saf) + '; AF Received = '+ convert(varchar,@af)

print @cid
print convert(varchar,@c) + '----' + convert(varchar,@sc)
print convert(varchar,@i) + '----' +  convert(varchar,@si)
print convert(varchar,@ff) + '----' + convert(varchar,@sff)
print convert(varchar,@af) + '-------' + convert(varchar,@saf)

end

fetch next from mycur into @cid,@sc,@si,@sff,@saf
end
close mycur
deallocate mycur
end
GO
