USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedFunction [dbo].[fncGetServiceType]    Script Date: 6/17/2019 2:30:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fncGetServiceType](@Case_id varchar(50))
returns varchar(8000) as
BEGIN
 DECLARE @servicetype VARCHAR(200)
 DECLARE @OutputString VARCHAR(8000)
 
 DECLARE CUR_ServiceType CURSOR
 FOR select  distinct (service_type)  from  tbltreatment where case_id= @Case_id 

 OPEN CUR_ServiceType
 
 set @OutputString = ''
 FETCH CUR_ServiceType INTO @servicetype
 
 set @OutputString = ''
 WHILE @@FETCH_STATUS = 0
  BEGIN
   set @OutputString = @OutputString +  @servicetype + ', '
   FETCH CUR_ServiceType INTO @servicetype
  END
  CLOSE CUR_ServiceType
 DEALLOCATE CUR_ServiceType

	if 	len(@OutputString) >1
		set @OutputString = LEFT(@OutputString, LEN(ltrim(rtrim(@OutputString))) - 1)

 RETURN @OutputString 
END
GO
