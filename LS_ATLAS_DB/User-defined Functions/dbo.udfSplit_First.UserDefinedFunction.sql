USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedFunction [dbo].[udfSplit_First]    Script Date: 6/17/2019 2:30:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* -----------------------------------------------------------------------------------------------------------------
/ ABBREVIATIONS USED  		:	START, A-ADD, U-UPDATE, D-DELETE, E-END 
/								(E.G. SA1001 FOR START ADDING NEW CONTENTS AND EA1001 FOR END ADDING)
/------------------------------------------------------------------------------------------------------------------
/ NAME OF PROCEDURE		:	DBO.[udfSplit]
/ PURPOSE				:	THIS FUNCTION IS USED TO RETURN LAST SUB-STRING DELIMITTED WITH PROVIDED DELIMETER
/ DEVELOPED BY			:	ADARSH KUMAR BAJPAI
/ START DATE			: 	21 JAN 2007
/ REVIEWED BY			:	
/ REVIEW DATE			:	
/ PARAMETER(S)			:	(A) INPUT	: STRING
										  DELEMETER
/							(B) OUTPUT	: LAST VALUE
/
/ EXECUTION PROCEDURE	:	SELECT DBO.udfSplit('misc@2@test22@001','@')
/-------------------------------------------------- CHANGE HISTORY -------------------------------------------------
/ CHANGE ID	CALL NO.	CHANGE DATE	DEVELOPER'S NAME	PURPOSE OF CHANGE
/-------------------------------------------------------------------------------------------------------------------
/ 
/------------------------------------------------------------------------------------------------------------------*/


CREATE FUNCTION [dbo].[udfSplit_First](
    @sInputList VARCHAR(8000) -- List of delimited items
  , @sDelimiter VARCHAR(8000) = ',' -- delimiter that separates items
) RETURNS varchar(255) 

BEGIN
DECLARE @sItem VARCHAR(8000)
DECLARE @sItemIndex int
DECLARE @LastItem VARCHAR(255)
DECLARE @List TABLE (ItemIndex int, Item VARCHAR(8000))

SET @sItemIndex=0
WHILE CHARINDEX(@sDelimiter,@sInputList,0) <> 0
BEGIN
	SELECT	@sItem=RTRIM(LTRIM(SUBSTRING(@sInputList,1,CHARINDEX(@sDelimiter,@sInputList,0)-1))),
			@sInputList=RTRIM(LTRIM(SUBSTRING(@sInputList,CHARINDEX(@sDelimiter,@sInputList,0)+LEN(@sDelimiter),LEN(@sInputList))))
 
			IF LEN(@sItem) > 0
			BEGIN
				INSERT INTO @List SELECT @sItemIndex, @sItem
				SET @sItemIndex=@sItemIndex+1
			END
END

IF LEN(@sInputList) > 0
BEGIN
	INSERT INTO @List SELECT @sItemIndex,@sInputList -- Put the last item in
	Select @LastItem=Item from @List WHERE ItemIndex=0
END
	
RETURN @LastItem

END
GO
