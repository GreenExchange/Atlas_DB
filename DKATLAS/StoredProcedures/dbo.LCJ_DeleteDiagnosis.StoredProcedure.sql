USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteDiagnosis]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  Stored Procedure dbo.LCJ_DeleteDiagnosis    Script Date: 3/13/2008 3:52:10 PM ******/




CREATE PROCEDURE [dbo].[LCJ_DeleteDiagnosis]
(

@Diag_Code nvarchar(50)

)


AS
DELETE from tblDiagnosis where Diag_Code = + Rtrim(Ltrim(@Diag_Code))
GO
