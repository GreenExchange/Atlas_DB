USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Packet_Add_New_Cases]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[F_Packet_Add_New_Cases]
(
	@s_a_PacketID VARCHAR(100),
	@s_a_MultipleCase_ID VARCHAR(MAX),
	@s_a_UserName NVARCHAR(100)
)
AS
BEGIN
SET NOCOUNT ON;

	DECLARE @i_l_result INT
	DECLARE @s_l_message NVARCHAR(500)

	IF EXISTS(SELECT PacketID FROM tblPacket WHERE PacketID = @s_a_PacketID)
	BEGIN
		IF NOT EXISTS(SELECT Case_ID FROM tblCase INNER JOIN tblPacket ON tblCase.FK_Packet_ID = tblPacket.Packet_Auto_ID  WHERE tblPacket.PacketID <> @s_a_PacketID AND Case_Id  IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')))
		BEGIN		      
			BEGIN TRAN
				DECLARE @NDesc varchar(500) 
				SET @s_l_message	=  'Cases successfuly added to Packet ID : ' + @s_a_PacketID
				SET @i_l_result    =  (SELECT TOP 1 Packet_Auto_ID FROM tblPacket WHERE PacketID = @s_a_PacketID)
				
				UPDATE tblCase 
				SET FK_Packet_ID = @i_l_result
				WHERE Case_Id IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,','))
				
				set @NDesc = 'Case added to Packet : ' + @s_a_PacketID

				INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
				SELECT @NDesc,'Activity',1,s,getdate(),@s_a_UserName FROM dbo.SplitString(@s_a_MultipleCase_ID,',')      
			COMMIT TRAN 
		END
		ELSE
		BEGIN
			DECLARE @s_l_Case_ID VARCHAR(50)
			
			SET @s_l_Case_ID = (SELECT top 1 Case_ID FROM tblCase INNER JOIN tblPacket ON tblCase.FK_Packet_ID = tblPacket.Packet_Auto_ID  WHERE  tblPacket.PacketID <> @s_a_PacketID AND Case_Id  IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')))
			SET @s_l_message	= 'Packet not created. Case ID is already '+ @s_l_Case_ID +' associated with packet.'
			SET @i_l_result		=  0
		END
	END
	ELSE
	BEGIN
		SET @s_l_message	=  'Packet ID Not Exists - ' + @s_a_PacketID
		SET @i_l_result    =  0
	END

	SELECT @s_l_message AS [MESSAGE], @i_l_result AS [RESULT]	

END
GO
