USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Communication_Document]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Communication_Document] 
(
	@DomainId nvarchar(50),
    @case_id nvarchar(50),
    @userName nvarchar(100)	
)	
AS
Begin
Select Email_Id,Case_Id,Date_Created,Subject,Message_From,Message_To,Message_CC,Message_Date,Attachments,Attachment_Files from tblEmail 
where case_id=@case_id and User_Id=(select UserId from IssueTracker_Users  where UserName=@userName AND @DomainId = DomainId) AND DomainId = @DomainId
order by Date_Created desc
END

GO
