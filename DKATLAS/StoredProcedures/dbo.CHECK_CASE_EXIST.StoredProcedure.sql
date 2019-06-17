USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_CASE_EXIST]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CHECK_CASE_EXIST]	
	@CaseID nvarchar(100)
as
IF EXISTS(SELECT Case_ID FROM dbo.tblCase WHERE Case_Id=@CaseID)
	select 1 [Result]
Else
	select 0 [Result]
GO
