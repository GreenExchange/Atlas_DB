USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[procLoginValidate]    Script Date: 6/17/2019 2:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procLoginValidate](
@uid varchar(50),
@pwd varchar(50)
)
as
begin
select * from issuetracker_users a where UserName=@uid and UserPassword = @pwd
end
GO
