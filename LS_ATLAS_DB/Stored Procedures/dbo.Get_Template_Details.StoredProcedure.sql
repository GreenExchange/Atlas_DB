USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Template_Details]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Template_Details] 
	@s_a_template_name varchar(100),
	@s_a_DomainId varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    Select 
		 template_name
		,template_file_name
		,template_path
		,template_tag_array 
	from tbl_template_word 
	where LTRIM(RTRIM(template_name)) = LTRIM(RTRIM(@s_a_template_name)) and DomainId= @s_a_DomainId
END
GO
