USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[proccreateuserdeskrelation]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[proccreateuserdeskrelation]
(
@UserName varchar(20)
)
as
begin
declare
@cnt int
select @cnt = count(*) from tbldesk where desk_name =@UserName
if @cnt = 0
begin
	insert into tbldesk values (@UserName)
end
end
GO
