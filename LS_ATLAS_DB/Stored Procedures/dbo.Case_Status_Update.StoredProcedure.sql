USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Case_Status_Update]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Case_Status_Update] 
	-- Add the parameters for the stored procedure here
	@DomainID VARCHAR(50),
	@s_a_Status NVARCHAR(100),
	@s_a_Case_ID NVARCHAR(100),	
	@s_a_UserName NVARCHAR(100),
	@s_a_InjuredFName nvarchar(100),
	@s_a_InjuredLName nvarchar(100),
	@s_a_CourtID nvarchar(100)='0'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @i_l_result INT
	DECLARE @s_l_message VARCHAR(500)
	 DECLARE @Old_Case_Status NVARCHAR(300) 
	 DECLARE @Old_FName NVARCHAR(100)
	 DECLARE @Old_LName NVARCHAR(100)
	 DECLARE @Old_CourtID NVARCHAR(100)
	 DECLARE @Flag INT=0
	 DECLARE @s_l_Namemessage VARCHAR(500)=''
    -- Insert statements for procedure here
	BEGIN TRAN

		SET @Old_Case_Status=(select Status from tblCase WHERE DomainID =@DomainID AND Case_Id =@s_a_Case_ID)
		SET @Old_FName=(select InjuredParty_FirstName from tblCase WHERE DomainID =@DomainID AND Case_Id =@s_a_Case_ID)
		SET @Old_LName=(select InjuredParty_LastName from tblCase WHERE DomainID =@DomainID AND Case_Id =@s_a_Case_ID)
		SET @Old_CourtID = (select ISNULL(Court_Id,0) from tblCase WHERE DomainID =@DomainID AND Case_Id =@s_a_Case_ID)

		UPDATE tblCase 
		SET Status =@s_a_Status
			, InjuredParty_LastName=@s_a_InjuredLName, InjuredParty_FirstName=@s_a_InjuredFName
			, Court_Id = @s_a_CourtID
		WHERE DomainID =@DomainID AND Case_Id =@s_a_Case_ID

			UPDATE Auto_Billing_Packet_Info 
			SET Status =@s_a_Status, InjuredParty_LastName=@s_a_InjuredLName, InjuredParty_FirstName=@s_a_InjuredFName
			WHERE DomainID =@DomainID AND Case_Id=@s_a_Case_ID

			UPDATE Auto_Packet_Info 
			SET Status =@s_a_Status, InjuredParty_LastName=@s_a_InjuredLName, InjuredParty_FirstName=@s_a_InjuredFName
			WHERE DomainID =@DomainID AND Case_Id=@s_a_Case_ID

			IF(@s_a_Status != @Old_Case_Status)
			BEGIN
				INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id,DomainID)
				values('Case Status Changed from '+@Old_Case_Status+' to '+@s_a_Status ,'Activity', 1,@s_a_Case_ID,GETDATE(),@s_a_UserName,@DomainID)
			END

			IF(@Old_FName != @s_a_InjuredFName OR @Old_LName !=@s_a_InjuredLName)
			BEGIN
				SET  @s_l_Namemessage='Injured Party Name changed from '+@Old_FName +' '+@Old_LName+ ' to '+@s_a_InjuredFName+' '+@s_a_InjuredLName +' for Case_ID - '+  @s_a_Case_ID
				INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id,DomainID)
				values(@s_l_Namemessage,'Activity', 1,@s_a_Case_ID,GETDATE(),@s_a_UserName,@DomainID)
			END


			IF(@s_a_CourtID != @Old_CourtID)
			BEGIN
				DECLARE @s_l_CourtNameNew VARCHAR(100)
				DECLARE @s_l_CourtNameOld VARCHAR(100)
				SET @s_l_CourtNameNew = (SELECT Court_Name From tblCourt WHERE Court_Id = @s_l_CourtNameNew)
				SET @s_l_CourtNameOld = (SELECT Court_Name From tblCourt WHERE Court_Id = @s_l_CourtNameOld)
				INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id,DomainID)
				values('Court_Id changed from '+@s_l_CourtNameOld+' to '+@s_l_CourtNameNew ,'Activity', 1,@s_a_Case_ID,GETDATE(),@s_a_UserName,@DomainID)
			END

			SET @s_l_message	= 'Case details Changed successfully for Case_ID - '+ @s_a_Case_ID 
			SET @i_l_result		=  0

		COMMIT TRAN
		SELECT @s_l_message AS [Message], @i_l_result AS [RESULT]


END
GO
