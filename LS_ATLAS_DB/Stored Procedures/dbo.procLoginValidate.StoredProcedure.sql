USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[procLoginValidate]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procLoginValidate](
@DomainID varchar(50),
@uid varchar(50),
@pwd varchar(50)
)
as
begin

	select * from issuetracker_users a where UserName=@uid and UserPassword = @pwd and DomainID =@DomainID
end

GO
