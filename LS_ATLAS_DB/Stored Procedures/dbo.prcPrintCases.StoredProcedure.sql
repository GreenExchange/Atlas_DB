USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[prcPrintCases]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prcPrintCases]  
(  
@case_Id nvarchar(200),  
@Process_Id varchar(10),  
@User_Name nvarchar(200)  
)  
as  
declare @User_Id varchar(200)  
begin  
if exists (select case_Id from tblPrintJobs where case_Id=@case_id)  
 begin  
set @User_Id=(Select UserId from IssueTracker_Users where UserName=@User_Name)  
  update tblPrintjobs   
  set   
  Case_Id=@case_Id,  
  Process_Id=@Process_Id,  
  Date_Submitted=getdate(),  
  Printed=0,  
  User_Id=@User_Id  
  where Case_Id=@case_id  
 end  
else  
 begin  
  insert into tblPrintJobs (Case_Id,Process_Id,Date_Submitted,Printed,User_Id)  
  values(@case_Id,@Process_Id,getdate(),0,@User_Id)  
 end  
end

GO
