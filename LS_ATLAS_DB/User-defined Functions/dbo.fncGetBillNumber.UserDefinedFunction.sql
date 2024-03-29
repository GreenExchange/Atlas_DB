USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedFunction [dbo].[fncGetBillNumber]    Script Date: 6/17/2019 2:30:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fncGetBillNumber](@Case_id varchar(50))
returns varchar(MAX) as
BEGIN


	DECLARE @OutputString VARCHAR(8000)
		DECLARE @tblDenial AS TABLE (BILL_NUMBER VARCHAR(500))

		INSERT INTO @tblDenial
		select distinct BILL_NUMBER  from tbltreatment 
		where  case_id= @Case_id
		

	SET @OutputString=(SELECT(SELECT COALESCE(CAST(BILL_NUMBER AS VARCHAR(MAX))+', ','')   
	FROM			@tblDenial  FOR XML PATH('')) AS aaa); 

	if 	len(@OutputString) >1
		set @OutputString = LEFT(@OutputString, LEN(ltrim(rtrim(@OutputString))) - 1)

	-- SELECT @denialreason_type AS DenialReason
	Return @OutputString


 --DECLARE @Bill_Number VARCHAR(200)
 --DECLARE @OutputString VARCHAR(8000)
 
 --DECLARE CUR_Notes CURSOR
 --FOR select distinct Bill_Number from tbltreatment where case_id=@Case_id 
 
 --OPEN CUR_Notes
 
 --set @OutputString = ''
 --FETCH CUR_Notes INTO @Bill_Number
 
 --set @OutputString = ''
 --WHILE @@FETCH_STATUS = 0
 -- BEGIN
 --  set @OutputString = @OutputString +  @Bill_Number + convert(varchar(200),',')
 --  FETCH CUR_Notes INTO @Bill_Number
 -- END
 -- CLOSE CUR_Notes
 --DEALLOCATE CUR_Notes

	--if 	len(@OutputString) >0
	--	set @OutputString = LEFT(@OutputString, LEN(ltrim(rtrim(@OutputString))) - 1)

 --RETURN @OutputString 
END
GO
