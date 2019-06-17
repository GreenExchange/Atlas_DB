USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_Case_Bill_Count]    Script Date: 6/17/2019 2:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnc_Case_Bill_Count] (@case_id varchar(50))
returns int
as

begin

declare @value int
select  @value=COUNT(treatment_id) from tblTreatment where Case_Id =@case_id

return @value

end
GO
