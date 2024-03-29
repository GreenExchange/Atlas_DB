USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Update_Cases_Transferred_Status]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Cases_Transferred_Status]--[Update_Cases_Transferred_Status] 'LIT','AAA OPEN','FH11-82954','tech','','Activity'
	@initial_status varchar(100),
	@status varchar(100),
	@case_id varchar(20),
	@User_Id varchar(50),
    @Note_Desc nvarchar(2000),
    @Note_Type varchar(50)
AS
BEGIN
	Declare @NDesc varchar(max)
	Declare @NDesc_init varchar(max)
    Declare @count as int
    Declare @patientname as nvarchar(100)
    Declare @Init_Status as nvarchar(50)
    Declare @DOA as nvarchar(100)
    Declare @ClaimAmt as nvarchar(100)   
    set @patientname=(select InjuredParty_LastName+' '+InjuredParty_FirstName from tblcase where case_id=@case_id)
    set @DOA=(select convert(nvarchar(50),Accident_Date,103) from tblcase where case_id=@case_id)
    set @ClaimAmt=(select Claim_Amount from tblcase where case_id=@case_id)

    set @count=(select count(*) from tblcase where InjuredParty_LastName+' '+InjuredParty_FirstName=@patientname and convert(nvarchar(50),Accident_Date,103)=@DOA and Claim_Amount=@ClaimAmt)

if @count=2
begin
set @Init_Status=(select initial_status from tblcase where InjuredParty_LastName+' '+InjuredParty_FirstName=@patientname and convert(nvarchar(50),Accident_Date,103)=@DOA and Claim_Amount=@ClaimAmt and case_id<>@case_id)

if(@Init_Status='ARB')
set @initial_status='LIT'
else
set @initial_status='ARB'
end
print @initial_status
    set @NDesc = 'Status changed from '+ (select status from tblcase where case_id = @Case_Id) +' to ' + @status
	set @NDesc_init = 'Initial_Status changed from '+(select initial_status from tblcase where case_id = @Case_Id)+ ' to '+ @initial_status
	
	if(@status<>'')
	begin
	update tblcase
	set status = @status
	where case_id = @case_id
	
	insert into tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
	values (@NDesc,'Activity',1,@Case_Id,getdate(),@User_Id)
	End
	
	if(@initial_status<>'')
	begin
	update tblcase
	set initial_status = @initial_status
	where case_id = @case_id
	
	insert into tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
	values (@NDesc_init,'Activity',1,@Case_Id,getdate(),@User_Id)
	End   
	
    if(@Note_Desc<>'')
	begin
	insert into tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
	values (@Note_Desc,@Note_Type,1,@Case_Id,getdate(),@User_Id)
	End
    
END
GO
