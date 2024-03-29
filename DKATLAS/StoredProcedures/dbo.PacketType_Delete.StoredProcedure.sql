USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[PacketType_Delete]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PacketType_Delete]
(
		   @i_a_CaseType_Id			 INT,
		   @s_a_CaseType			 VARCHAR(100),     
	       @s_a_Created_By_User		 VARCHAR(100) 
)
AS
BEGIN
	 DECLARE @s_l_message					NVARCHAR(500),
			 @s_l_notes_desc				NVARCHAR(500),
			 @CaseType	                    VARCHAR(100) 
			
	 BEGIN
		IF EXISTS(select FK_CaseType_Id from dbo.tblPacket WHERE FK_CaseType_Id =@i_a_CaseType_Id  )
	    BEGIN
	       SET @s_l_message	=  'Packet Type exists in Case..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM MST_PacketCaseType  WHERE PK_CaseType_Id = @i_a_CaseType_Id 
	        
			SET @s_l_message= 'Packet Type deleted'
			SET @s_l_notes_desc = 'Packet Type deleted - ' + @s_a_CaseType 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Packet Type'
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END
GO
