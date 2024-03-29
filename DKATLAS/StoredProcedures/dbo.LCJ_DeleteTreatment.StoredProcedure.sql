USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteTreatment]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteTreatment]
(

@Treatment_Id nvarchar(3000),
@User_Id VARCHAR(50)
)


AS
begin

DECLARE @DOS_START VARCHAR(12)
DECLARE @DOS_END VARCHAR(12)
DECLARE @CASE_ID VARCHAR(50)
DECLARE @desc varchar(1000)
SET @DOS_START = (SELECT CONVERT(VARCHAR(20),DateOfService_Start,100) from tblTreatment where Treatment_Id = + @Treatment_Id)
SET @DOS_END = (SELECT CONVERT(VARCHAR(20),DateOfService_End,100) from tblTreatment where Treatment_Id = + @Treatment_Id)
SET @CASE_ID = (SELECT Case_Id from tblTreatment where Treatment_Id = + @Treatment_Id)

SET @desc = 'Bill deleted for DOS ' + @DOS_START + ' - ' + @DOS_END
EXEC LCJ_ADDNOTES @CASE_ID,'Activity',@desc,@User_Id,0


DELETE from TXN_tblTreatment where Treatment_Id = + @Treatment_Id
DELETE from TXN_CASE_PEER_REVIEW_DOCTOR where Treatment_Id = + @Treatment_Id
DELETE from TXN_CASE_Treating_Doctor where Treatment_Id = + @Treatment_Id
DELETE from tblTreatment where Treatment_Id = + @Treatment_Id

end
GO
