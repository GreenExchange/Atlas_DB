USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Case_Status_Update]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Priyanka Shende
-- Create date: 27-12-2018
-- Description:	To update Case Status
-- =============================================
CREATE PROCEDURE [dbo].[Case_Status_Update] 
	-- Add the parameters for the stored procedure here
	@s_a_Status NVARCHAR(100),
	@s_a_Case_ID NVARCHAR(100),	
	@s_a_UserName NVARCHAR(100),
	@s_a_InjuredFName nvarchar(100),
	@s_a_InjuredLName nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @i_l_result INT
	DECLARE @s_l_message VARCHAR(500)
	DECLARE @Old_Case_Status NVARCHAR(300) 
    -- Insert statements for procedure here
	BEGIN TRAN

			SET @Old_Case_Status=(select Status from tblCase WHERE Case_Id =@s_a_Case_ID)
				UPDATE tblCase 
				SET Status =@s_a_Status, InjuredParty_LastName=@s_a_InjuredLName, InjuredParty_FirstName=@s_a_InjuredFName
				WHERE Case_Id =@s_a_Case_ID

				--UPDATE Auto_Billing_Packet_Info 
				--SET Status =@s_a_Status, InjuredParty_LastName=@s_a_InjuredLName, InjuredParty_FirstName=@s_a_InjuredFName
				--WHERE DomainID =@DomainID AND Case_Id=@s_a_Case_ID


				 INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
				 values('Case Status Changed from '+@Old_Case_Status+' to '+@s_a_Status ,'Activity', 1,@s_a_Case_ID,GETDATE(),@s_a_UserName)

				  SET @s_l_message	= 'Case Status Changed successfully for Case_ID - '+ @s_a_Case_ID 
				  SET @i_l_result		=  0

	 COMMIT TRAN
				SELECT @s_l_message AS [Message], @i_l_result AS [RESULT]


END

GO
