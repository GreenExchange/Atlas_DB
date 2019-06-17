USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GET_CaseSearchDetails_Doctor]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_CaseSearchDetails_Doctor] --'FH11-85139'
	@DomainId NVARCHAR(50),
	@Case_Id nvarchar(20)
AS
BEGIN
	select * from CaseSearchDetails_Doctor (NOLOCK) where [Case Id]=@Case_Id and DomainId = @DomainId
END
GO
