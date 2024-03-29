USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_AAAPendingCases]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_AAAPendingCases]   --[F_AAAPendingCases] 
AS
BEGIN
	SET NOCOUNT ON;

		select DISTINCT C.Case_Id AS [Case_ID],
		Initial_Status AS [Case_Status],
		status AS [Current_Status],
		injuredparty_name as  [Patient_Name],
		provider_name AS [Provider],
		Provider_GroupName AS [Provider_Group],
		INSURANCE_NAME AS [Insurance_Company],
		LTRIM(RTRIM(N.User_Id)) AS [Case_Opener],
		Date_Opened AS [Date_Opened],
		(select max(UserName) from tblCaseDeskHistory INNER JOIN IssueTracker_Users ON To_User_Id = UserId WHERE bt_status = 1 AND Case_Id=C.Case_ID) AS [Work_Desk_Assigned_Name],
		Assigned_Attorney AS [Attorney_assigned],
		CASE WHEN date_status_changed is null then  datediff(dd,Date_Opened,GETDATE())  ELSE datediff(dd,date_status_changed,GETDATE()) END AS [Status_Age]
		from LCJ_VW_CaseSearchDetails  c 
		INNER JOIN tblNotes N on N.Case_Id = C.Case_Id and N.Notes_Desc = 'Case Opened'
		where  Status like 'AAA Package Incomplete%'
		  
END
GO
