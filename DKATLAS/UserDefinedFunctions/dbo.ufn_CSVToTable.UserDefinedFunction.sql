USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_CSVToTable]    Script Date: 6/17/2019 2:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_CSVToTable] ( @StringInput VARCHAR(8000) )
RETURNS @OutputTable TABLE ( [String] VARCHAR(max) )
AS
BEGIN

    DECLARE @String    VARCHAR(max)

    WHILE LEN(@StringInput) > 0
    BEGIN
        SET @String      = LEFT(@StringInput, 
                                ISNULL(NULLIF(CHARINDEX(',', @StringInput) - 1, -1),
                                LEN(@StringInput)))
        SET @StringInput = SUBSTRING(@StringInput,
                                     ISNULL(NULLIF(CHARINDEX(',', @StringInput), 0),
                                     LEN(@StringInput)) + 1, LEN(@StringInput))

        INSERT INTO @OutputTable ( [String] )
        VALUES ( @String )
    END
    
    RETURN
END
GO
