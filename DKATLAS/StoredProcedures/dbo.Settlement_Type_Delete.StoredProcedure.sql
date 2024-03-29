USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Settlement_Type_Delete]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Settlement_Type_Delete]
(
   @i_a_Settlement_Type_Id INT,
   @s_a_Settlement_Type VARCHAR(100),
	@s_a_Created_By_User VARCHAR(100)
  
)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc				NVARCHAR(500)
			
	 BEGIN
		IF EXISTS(SELECT Settled_Type FROM tblSettlements WHERE Settled_Type = @i_a_Settlement_Type_Id)
	    BEGIN
	       SET @s_l_message	=  'Settlement Type exists in Case..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM tblSettlement_Type  WHERE SettlementType_Id = @i_a_Settlement_Type_Id 
	        
			SET @s_l_message= 'Settlement Type deleted'
			SET @s_l_notes_desc = 'Settlement Type deleted - ' + @s_a_Settlement_Type 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Settlement Type'
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END

GO
