USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Patient_Name]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Patient_Name]
	@Case_Id VARCHAR(100)
AS
BEGIN
	SELECT InjuredParty_FirstName + ' ' + InjuredParty_LastName [Patient_Name] from tblcase where Case_Id=@Case_Id
END
GO
