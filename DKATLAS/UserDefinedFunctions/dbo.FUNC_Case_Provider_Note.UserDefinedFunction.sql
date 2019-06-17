USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[FUNC_Case_Provider_Note]    Script Date: 6/17/2019 2:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[FUNC_Case_Provider_Note] (@case_id varchar(50))

RETURNS varchar(max)
AS
begin
Declare @note varchar(max)

	select   @note= Notes_Desc from tblnotes 
	where Case_Id=@case_id and Notes_Type='provider'
	order by Notes_ID desc
	

return @note


end
GO
