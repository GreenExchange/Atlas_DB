USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[proccreateuserdeskrelation]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[proccreateuserdeskrelation]
(
@DomainID NVARCHAR(50),
@UserName varchar(20)
)
as
begin
declare
@cnt int
select @cnt = count(*) from tbldesk where desk_name =@UserName and DomainId=@DomainID
if @cnt = 0
begin
	insert into tbldesk values (@UserName,@DomainID)
end
end

GO
