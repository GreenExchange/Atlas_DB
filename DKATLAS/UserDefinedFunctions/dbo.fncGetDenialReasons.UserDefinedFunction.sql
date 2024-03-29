USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[fncGetDenialReasons]    Script Date: 6/17/2019 2:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fncGetDenialReasons](@Case_id varchar(50))
returns varchar(8000) as
BEGIN
 DECLARE @denialreason VARCHAR(200)
 DECLARE @OutputString VARCHAR(8000)
 
 DECLARE CUR_Denial CURSOR
 FOR 
 
 
		select distinct tblDenialReasons.DenialReasons_Type from tbltreatment 
		INNER JOIN tblDenialReasons on tbltreatment.DenialReason_ID = tblDenialReasons.DenialReasons_Id
		where  case_id= @Case_id
	UNION
		SELECT Distinct  tblDenialReasons.DenialReasons_Type from tblTreatment 
		INNER JOIN TXN_tblTreatment on tblTreatment.Treatment_Id = TXN_tblTreatment.Treatment_Id
		INNER JOIN tblDenialReasons on TXN_tblTreatment.DenialReasons_Id = tblDenialReasons.DenialReasons_Id
		where  case_id= @Case_id
	   
	   
	--SELECT Distinct  tblDenialReasons.DenialReasons_Type from tblTreatment 
 --  INNER JOIN TXN_tblTreatment on tblTreatment.Treatment_Id = TXN_tblTreatment.Treatment_Id
 --  INNER JOIN tblDenialReasons on TXN_tblTreatment.DenialReasons_Id = tblDenialReasons.DenialReasons_Id
 --  where  case_id=@CASE_ID
   
	
	
	--SELECT denialReasons_Type FROM tblTreatment WHERE Treatment_Id =@Case_id
	--UNION select DenialReasons_Type as denialreason from tblDenialReasons 
	--INNER JOIN TXN_tblTreatment ON  tblDenialReasons.DenialReasons_Id =TXN_tblTreatment.DenialReasons_Id 
	--WHERE Treatment_Id = @Case_id
	
	--select  distinct (denialReasons_Type) as denialreason from tblDenialReasons where denialReasons_id in
	--	(select denialReasons_id from TXN_tblTreatment where  treatment_id in(select treatment_id from tbltreatment where case_id= @Case_id))
	--	or denialReasons_Type in (select distinct denialreasons_type from tbltreatment where case_id= @Case_id )

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
