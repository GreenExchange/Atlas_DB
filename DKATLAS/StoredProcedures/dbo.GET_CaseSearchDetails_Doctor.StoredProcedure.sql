USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GET_CaseSearchDetails_Doctor]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_CaseSearchDetails_Doctor] --'FH11-85139'
	@Case_Id nvarchar(20)
AS
BEGIN
	select * from CaseSearchDetails_Doctor where [Case Id]=@Case_Id
END
GO
