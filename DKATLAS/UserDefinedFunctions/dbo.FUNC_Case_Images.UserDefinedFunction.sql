USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[FUNC_Case_Images]    Script Date: 6/17/2019 2:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[FUNC_Case_Images]
(@CASE_ID varchar(50)
)
RETURNS  int
AS
BEGIN
	
	declare @value int
SELECT @value=COUNT(ImageId) FROM tblImages WHERE Case_Id = @CASE_ID

return @value 

END
GO
