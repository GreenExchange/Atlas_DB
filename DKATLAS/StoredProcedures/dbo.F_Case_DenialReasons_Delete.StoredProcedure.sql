USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Case_DenialReasons_Delete]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext LCJ_AddDataEntry1

CREATE PROCEDURE [dbo].[F_Case_DenialReasons_Delete] --[dbo].[F_Case_DenialReasons_Retrieve] 'FH13-160344' 
  
(  
	  @i_a_pk_id INT
)  
AS 
	BEGIN 
		DELETE FROM tbl_Case_Denial
		WHERE PK_ID=@i_a_pk_id
    END
GO
