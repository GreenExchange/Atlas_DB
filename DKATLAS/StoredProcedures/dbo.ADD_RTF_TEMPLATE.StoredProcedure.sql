USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[ADD_RTF_TEMPLATE]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADD_RTF_TEMPLATE] -- ADD_RTF_TEMPLATE 'DAMBROSIO & DAMBROSIO, P.C. ( FOR SUPPLY COMPANY).rtf','Oss'
	@filename varchar(200),
	@usertype varchar(10)
AS
BEGIN
	DECLARE @temp_id AS int
	Declare @count as int

	declare @value nvarchar(50)
	declare @delimit nvarchar(4)
	select
      @delimit = '.rtf'
	
	SET
      @value = SUBSTRING(@filename,1,CHARINDEX(@delimit,@filename)-1)
	select
      @value as retSplittedValue

	if((select count(*) from MST_TEMPLATES where SZ_TEMPLATE_PATH = @filename) = 0)
	Begin
		insert into dbo.MST_TEMPLATES(SZ_TEMPLATE_NAME,SZ_TEMPLATE_FORMAT,SZ_TEMPLATE_PATH,SZ_TEMPLATE_FILENAME)
		values(@value,'RTF',@filename, @filename)

		select @temp_id = I_TEMPLATE_ID from MST_TEMPLATES where SZ_TEMPLATE_PATH = @filename

		--insert into dbo.TXN_TEMPLATES_ACCESS (TEMPLATE_ID,USER_TYPE)
		--values( @temp_id,@usertype)
	End


END
GO
