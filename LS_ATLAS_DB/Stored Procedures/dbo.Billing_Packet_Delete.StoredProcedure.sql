USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Billing_Packet_Delete]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Billing_Packet_Delete] ----  [Billing_Packet_Delete] 'GLF','GLF18-102656','admin'
	-- Add the parameters for the stored procedure here
	@DomainID VARCHAR(50),
	@s_a_PktCaseID VARCHAR(100),	
	@s_a_UserName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @i_l_result INT
	DECLARE @s_l_message VARCHAR(500)
	DECLARE @s_l_Existing_Case_IDS VARCHAR(1000) = ''

	SELECT @s_l_Existing_Case_IDS = tblCase.Case_ID + COALESCE(','+@s_l_Existing_Case_IDS ,'')   FROM tblCase 
	INNER JOIN Billing_Packet ON tblCase.Case_Id = Billing_Packet.Case_ID and tblcase.DomainId = Billing_Packet.DomainID 
	WHERE tblCase.DomainID = @DomainID AND Billing_Packet.Packeted_Case_ID=@s_a_PktCaseID

	Set @s_l_Existing_Case_IDS = IIF( CHARINDEX( ',', @s_l_Existing_Case_IDS, LEN(@s_l_Existing_Case_IDS) ) > 0
          , LEFT( @s_l_Existing_Case_IDS, LEN( @s_l_Existing_Case_IDS) - 1 ), @s_l_Existing_Case_IDS)

	IF (ISNuLL(@s_l_Existing_Case_IDS,'') != '')
	BEGIN

	 BEGIN TRAN

	-- Unpacket the packded cases
		DECLARE @tblDateStatusChagne TABLE
		(
			CASE_ID VARCHAR(100),
			DomainID VARCHAR(100),
			Date_Status_Changed DATETIME
		)

		INSERT INTO @tblDateStatusChagne
		SELECT case_id, DomainID, Date_Status_Changed  FROM tblcase WHERE DomainID =@DomainID AND Case_Id IN (SELECT s FROM dbo.SplitString(@s_l_Existing_Case_IDS,','))

		UPDATE tblCase 
				SET Status =Old_Status		
		WHERE DomainID =@DomainID AND Case_Id IN (SELECT s FROM dbo.SplitString(@s_l_Existing_Case_IDS,','))


		UPDATE CAS
		SET Date_Status_Changed = DT.Date_Status_Changed
		FROM TBLCASE CAS 
		INNER JOIN @tblDateStatusChagne DT ON CAS.Case_Id = DT.CASE_ID


		---- Update Auto_Billing_Packet and Auto_Billing_Packet_Info table
		EXEC [Auto_Billing_Case_Insert] @DomainID =  @DomainID, @s_a_MultipleCase_ID = @s_l_Existing_Case_IDS

		INSERT INTO Case_Delete_Log ([Log_Desc],[Case_Id],[User_Id],[Deleted_Date],[DomainId])
		VALUES('Packted Case Case Deleted ' + @s_a_PktCaseID + ' ' +@s_l_Existing_Case_IDS,
					@s_a_PktCaseID,
					@s_a_UserName,
					GETDATE(),
					@DomainID)

		---- Delete case ------------------------------------------------------------------------------------------------------
		Delete from Billing_Packet where Packeted_Case_ID=@s_a_PktCaseID AND DomainId=@DomainID
		DELETE from tbl_Case_Status_Hierarchy WHERE case_id =@s_a_PktCaseID AND DomainId=@DomainID
		DELETE from dbo.tbl_document_log WHERE pk_case_id =@s_a_PktCaseID AND DomainId=@DomainID
		DELETE from dbo.tblNotes WHERE Case_Id =@s_a_PktCaseID AND DomainId=@DomainID
		DELETE from dbo.tblTreatment WHERE Case_Id =@s_a_PktCaseID AND DomainId=@DomainID
		DELETE from dbo.tblTransactions WHERE Case_Id =@s_a_PktCaseID AND DomainId=@DomainID
		DELETE from dbo.tblSettlements WHERE Case_Id =@s_a_PktCaseID  AND DomainId=@DomainID
		DELETE from dbo.tblCase WHERE Case_Id =@s_a_PktCaseID AND DomainId=@DomainID
		DELETE FROM TBLDOCIMAGES where imageID in
		(
		SELECT imageID FROM  tblImageTag WHERE TagID IN 
		(SELECT NodeID FROM  dbo.tblTags WHERE CaseId in  (@s_a_PktCaseID))
		) AND DomainId=@DomainID

		DELETE FROM  tblImageTag WHERE TagID IN 
		(SELECT NodeID FROM  dbo.tblTags WHERE CaseId in  (@s_a_PktCaseID)) AND DomainId=@DomainID
		----------------------------------------------------------------------------------------------------------------------
		

		
	
		SET @s_l_message	= 'Packet data deleted successfully. - '+ @s_a_PktCaseID 
		SET @i_l_result		=  0 

	COMMIT TRAN
	END
	ELSE
	BEGIN

		SET @s_l_message	= 'Packet can not be deleted. No data available for '+ @DomainID+ ' => '+ @s_a_PktCaseID 
		SET @i_l_result		=  0
	END
	SELECT @s_l_message AS [Message], @i_l_result AS [RESULT]
END
	

GO
