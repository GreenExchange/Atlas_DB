USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[fncGetDenialReasonsBYid]    Script Date: 6/17/2019 2:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fncGetDenialReasonsBYid](@id varchar(50))
returns varchar(8000) as
BEGIN
 DECLARE @denialreason VARCHAR(200)
 DECLARE @OutputString VARCHAR(8000)
 
 DECLARE CUR_Denial CURSOR
 FOR 
	select  distinct tblDenialReasons.DenialReasons_Type from tblDenialReasons
	INNER JOIN TXN_tblTreatment on tblDenialReasons.DenialReasons_Id = TXN_tblTreatment.DenialReasons_Id
	WHERE TXN_tblTreatment.Treatment_Id = @id
	  
	  
	 
 OPEN CUR_Denial
 
 set @OutputString = ''
 FETCH CUR_Denial INTO @denialreason
 
 set @OutputString = ''
 WHILE @@FETCH_STATUS = 0
  BEGIN
   set @OutputString = @OutputString +  @denialreason + ', '
   FETCH CUR_Denial INTO @denialreason
  END
  CLOSE CUR_Denial
 DEALLOCATE CUR_Denial

	if 	len(@OutputString) >1
		set @OutputString = LEFT(@OutputString, LEN(ltrim(rtrim(@OutputString))) - 1)

 RETURN @OutputString 
END
GO
