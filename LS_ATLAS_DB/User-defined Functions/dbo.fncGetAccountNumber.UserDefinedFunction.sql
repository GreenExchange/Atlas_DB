USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedFunction [dbo].[fncGetAccountNumber]    Script Date: 6/17/2019 2:30:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fncGetAccountNumber](@Case_id varchar(50))
returns varchar(MAX) as
BEGIN
 DECLARE @Account_Number VARCHAR(200)
 DECLARE @OutputString VARCHAR(8000)
 
 DECLARE CUR_Notes CURSOR
 FOR select Account_Number from tbltreatment where case_id=@Case_id and Account_Number is not null  order by Account_Number
 
 OPEN CUR_Notes
 
 set @OutputString = ''
 FETCH CUR_Notes INTO @Account_Number
 
 set @OutputString = ''
 WHILE @@FETCH_STATUS = 0
  BEGIN
   set @OutputString = @OutputString +  @Account_Number + convert(varchar(200),',')
   FETCH CUR_Notes INTO @Account_Number
  END
  CLOSE CUR_Notes
 DEALLOCATE CUR_Notes

	if 	len(@OutputString) >0
		set @OutputString = LEFT(@OutputString, LEN(ltrim(rtrim(@OutputString))) - 1)

 RETURN @OutputString 
END
GO
