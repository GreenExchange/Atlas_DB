USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Add_caseid_test]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_caseid_test]
AS
BEGIN
DECLARE @caseid AS NVARCHAR(50)	
DECLARE @caseno AS INT
	SET NOCOUNT ON;
    DECLARE CUR CURSOR
 FOR select case_id from tblcase 
 OPEN CUR
 FETCH CUR INTO @caseid
  WHILE @@FETCH_STATUS = 0
  BEGIN
  set @caseno=convert(int,(select top 1 s from [dbo].SplitString(@caseid ,'-') order by s))
  print @caseno
     update tblcase
     set Caseid_no=@caseno
	 where case_id=@caseid
   FETCH CUR INTO @caseid
  END
  CLOSE CUR
 DEALLOCATE CUR

END
GO
