USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Change_Status]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Change_Status] --[Change_Status]'System'
	
	@LOGIN_USERNAME VARCHAR(50)
	
AS
BEGIN
		declare @CASE_ID as nvarchar(max) 
		declare @desc as  nvarchar(500)
		--declare @LOGIN_USERID AS INT		
		DECLARE @strsql as nvarchar(max) 
		declare @index integer
set @index = 1		
create table #temp(
 Case_Id nvarchar(500)
 )
 insert into #temp 
select Case_ID from tblCase where status like '%Closed%' and Initial_Status = 'ARB'
begin
while @index <= (select COUNT (*) from #temp) 
begin

	set @CASE_ID=(Select a.Case_Id from (SELECT ROW_NUMBER() OVER (ORDER BY Case_Id ASC) AS RowNum,Case_Id FROM #temp)a where a.RowNum =@index)
	--if NOT Exists(select case_id from tblNotes where Case_Id = @CASE_ID and Notes_Desc = 'Initial_Status changed from ARB to CLOSED')
	--BEGIN	

		update tblcase set Initial_Status='CLOSED' where Case_Id =@CASE_ID 

		DECLARE @NotesDESC VARCHAR(1000)
		SET @NotesDESC ='Initial_Status changed from ARB to CLOSED'

		insert into tblnotes (Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
		values (@NotesDESC,'Activity',1,@CASE_ID,getdate(),@LOGIN_USERNAME)
	
	--END		

	  set @index = @index + 1
end
end
END



GO
