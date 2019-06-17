USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[procInsCaseDesk]    Script Date: 6/17/2019 2:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procInsCaseDesk] (  
@Case_Id varchar(40),  
@did int  
) as  
begin  
declare @cnt int  
select @cnt = count(*) from tblCaseDesk where Case_Id=@Case_Id and desk_id=@did  
print @cnt  
if @cnt = 0   
begin  
Insert into tblCaseDesk (Case_Id,Desk_Id)values (@Case_Id,@did)  
end  
end
GO
