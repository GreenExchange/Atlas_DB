USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_WorkArea_AssignTo]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_WorkArea_AssignTo] 

AS

select Desk_Id, UPPER(Desk_Name) as Desk_Name from tblDesk where Desk_Name 
not in (select Provider_Name from tblProvider) 
and Desk_Name 
not in (select InsuranceCompany_Name from tblInsuranceCompany) 
and Desk_Name not in (Select Status_type from tblStatus) ORDER BY 2
GO
