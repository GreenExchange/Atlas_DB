USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[handleMoneyNULL]    Script Date: 6/17/2019 2:53:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE    FUNCTION [dbo].[handleMoneyNULL](@input as Money)
RETURNS  Money  AS  
BEGIN 
declare @out as money

IF (@input = NULL) 
	set @out = 0
else
	set @out = @input

return @out
END
GO
