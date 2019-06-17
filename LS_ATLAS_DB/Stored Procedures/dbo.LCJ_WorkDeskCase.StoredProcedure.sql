USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkDeskCase]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_WorkDeskCase]
(

@Desk_Id int

)


 AS

Begin
	Select * from LCJ_VW_CaseSearchDetails Inner Join tblCaseDesk ON LCJ_VW_CaseSearchDetails.Case_Id = tblCaseDesk.Case_Id where tblCaseDesk.Desk_Id = @Desk_Id

End

GO
