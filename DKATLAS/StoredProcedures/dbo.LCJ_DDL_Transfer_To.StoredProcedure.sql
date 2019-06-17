USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Transfer_To]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Transfer_To]
as
SELECT   
attorney_Id,
attorney_firstname + ' ' + attorney_lastname as Attorney_Name
FROM tblattorney
WHERE (1 = 1 ) ORDER BY attorney_firstname ASC
GO
