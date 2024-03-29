USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Case_Date_WorkFlow_History]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Case_Date_WorkFlow_History]
	@s_a_CaseId varchar(50),
	@s_a_DomainId varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     Select Notes_Desc, User_Id as Done_By, Convert(Varchar(50), Notes_Date, 101) as Done_Date 
	 from tblNotes(NOLOCK) where Notes_Type = 'Workflow' and Case_Id = @s_a_CaseId and DomainId = @s_a_DomainId order by Notes_ID desc
END
GO
