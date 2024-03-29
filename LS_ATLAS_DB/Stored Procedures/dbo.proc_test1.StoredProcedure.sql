USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[proc_test1]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_test1]	
AS
BEGIN	
	SET NOCOUNT ON;
    DECLARE @username as varchar(50)
    DECLARE @userid as varchar(50)
    DECLARE @caseid as varchar(50)
    DECLARE @date as datetime
    DECLARE @tagid as int
    DECLARE @FileName as varchar(200)
    DECLARE @Filepath as varchar(200)
    declare @a as int
    
    DECLARE CUR CURSOR
    FOR select sz_user_id,sz_case_id,Dt_upload_time from dbo. TXN_DOCUMENT_UPLOAD where SZ_FILENAME like '%ARBITRATION_DOC%'
	
    OPEN CUR
    FETCH CUR INTO @username,@caseid,@date
    WHILE @@FETCH_STATUS = 0
    BEGIN
    SET @userid=(select UserId from dbo.IssueTracker_Users where UserName =(LTRIM (Rtrim(@username))))
   
    set @FileName =(@caseid+'_ARB_FILED_'+ replace(convert(varchar, @date, 101), '/','-')+'.pdf')
    set @Filepath = (@caseid+'/ARB Docs/')
     SELECT @a=COUNT(*) FROM tblDocImages WHERE FilePath = @Filepath AND Filename = @FileName and ImageID in   
	 (SELECT ImageID FROM tblImageTag WHERE TagID IN (SELECT NodeID FROM tblTags WHERE ltrim(rtrim( caseid)) = ltrim(rtrim( @caseid))))
if(@a>1)
begin
print (@caseid)
print (@a)
end
    FETCH CUR INTO @username,@caseid,@date
    END
    CLOSE CUR
    DEALLOCATE CUR
END

GO
