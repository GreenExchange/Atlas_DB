USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Update_Workflow_Case_Status]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Workflow_Case_Status] 
	--@s_a_DomainId varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

	Declare @s_a_CaseId varchar(50);
	Declare @NotesType varchar(50) = 'Workflow';
	Declare @s_a_DomainId varchar(50);

	DECLARE AnswerNotReceivedCases CURSOR READ_ONLY
    FOR
	Select cd.Case_Id, cd.DomainId from tblCase_Date_Details cd inner join tblcase c on c.Case_Id = cd.Case_Id inner join tbl_Client cl on cl.DomainId = cd.DomainId
	where
	Date_Summons_Expires is not null and DATEDIFF(Day,Date_Summons_Expires, GETDATE()) >32 
	and Date_Answer_Received is null and lower(cl.CompanyType) = 'funding' --cd.DomainId = @s_a_DomainId 
	and lower(Status) != 'default letter to attorney'

	OPEN  AnswerNotReceivedCases
	FETCH NEXT FROM AnswerNotReceivedCases INTO @s_a_CaseId, @s_a_DomainId

	 WHILE @@FETCH_STATUS = 0
	 BEGIN
	  
		Update tblcase set Status = 'Default Letter To Attorney' where Case_Id = @s_a_CaseId and DomainId = @s_a_DomainId
		EXEC LCJ_AddNotes @DomainId=@s_a_DomainId, @case_id=@s_a_CaseId,@Notes_Type=@NotesType,@Ndesc = 'Status Changed To : Default Letter To Attorney', @user_Id='admin', @ApplyToGroup = 0  

		FETCH NEXT FROM AnswerNotReceivedCases INTO @s_a_CaseId, @s_a_DomainId
	 END
     
	  CLOSE AnswerNotReceivedCases
      DEALLOCATE AnswerNotReceivedCases
END
GO
