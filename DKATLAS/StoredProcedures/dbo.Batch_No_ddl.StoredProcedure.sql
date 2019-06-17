USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Batch_No_ddl]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Batch_No_ddl]
AS
begin

    SELECT '0' as Batch_AutoId,' --- Select Batch No--- ' as batch_no
    UNION
	SELECT   DISTINCT Batch_AutoId, Upper(ISNULL(batch_no, '')) AS batch_no
	FROM tblProvListBoxDetails
	WHERE     (1 = 1) order by Batch_No



end


	
GO
