USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Packet_Delete]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[F_Packet_Delete]
(
	@s_a_PacketID VARCHAR(100),
	@s_a_UserName NVARCHAR(100)
)
AS
BEGIN
SET NOCOUNT ON;

	DECLARE @i_l_result INT
	DECLARE @s_l_message NVARCHAR(500)

	IF EXISTS(SELECT PacketID FROM tblPacket WHERE PacketID = @s_a_PacketID)
	BEGIN	      
		BEGIN TRAN
			DECLARE @NDesc varchar(500) 
			SET @s_l_message	=  'Packet successfuly removed - ' + @s_a_PacketID
			SET @i_l_result    =  (SELECT TOP 1 Packet_Auto_ID FROM tblPacket WHERE PacketID = @s_a_PacketID)
			
			UPDATE tblCase 
			SET FK_Packet_ID = NULL
			WHERE FK_Packet_ID IN (SELECT Packet_Auto_ID FROM tblPacket WHERE PacketID = @s_a_PacketID)
			
			DELETE FROM tblPacket WHERE PacketID = @s_a_PacketID 
			
			set @NDesc = 'Packet Removed : ' + @s_a_PacketID

			INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
			SELECT @NDesc,'Activity',1,Case_ID,getdate(),@s_a_UserName FROM tblCase WHERE FK_Packet_ID IN (SELECT Packet_Auto_ID FROM tblPacket WHERE PacketID = @s_a_PacketID)      
		COMMIT TRAN 
	END
	ELSE
	BEGIN
		SET @s_l_message	=  'Packet ID Not Exists - ' + @s_a_PacketID
		SET @i_l_result    =  0
	END

	SELECT @s_l_message AS [MESSAGE], @i_l_result AS [RESULT]	

END
GO
