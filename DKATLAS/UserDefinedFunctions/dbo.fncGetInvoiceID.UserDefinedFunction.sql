USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[fncGetInvoiceID]    Script Date: 6/17/2019 2:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fncGetInvoiceID](@Case_id varchar(50))
returns varchar(MAX) as
BEGIN
 DECLARE @Invoice_Id VARCHAR(200)
 DECLARE @OutputString VARCHAR(8000)
 
 DECLARE CUR_Notes CURSOR
 FOR select distinct isnull(Invoice_Id,'') from tblTransactions where transactions_type in ('PreCToP','PreC','C') and case_id=@Case_id 
 OPEN CUR_Notes
 
 set @OutputString = ''
 FETCH CUR_Notes INTO @Invoice_Id
 
 set @OutputString = ''
 WHILE @@FETCH_STATUS = 0
  BEGIN
   set @OutputString = @OutputString +  @Invoice_Id + convert(varchar(200),',')
   FETCH CUR_Notes INTO @Invoice_Id
  END
  CLOSE CUR_Notes
 DEALLOCATE CUR_Notes

	if 	len(@OutputString) >0
		set @OutputString = LEFT(@OutputString, LEN(ltrim(rtrim(@OutputString))) - 1)

 RETURN @OutputString 
END
GO
