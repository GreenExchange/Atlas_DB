USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[procInsUserDesk]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procInsUserDesk] (
@DomainID NVARCHAR(50),
@UserName varchar(50),
@did int
) as
begin
declare @cnt int
select @cnt = count(*) from tblUserDesk where UserName=@UserName and desk_id=@did and DomainId=@DomainID
if @cnt = 0 
begin
Insert into tblUserDesk values (@UserName,@did,@DomainID)
end
end

GO
