USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Case_DenialReasons_Delete]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext LCJ_AddDataEntry1

CREATE PROCEDURE [dbo].[F_Case_DenialReasons_Delete] --[dbo].[F_Case_DenialReasons_Retrieve] 'FH13-160344' 
  
(  
	  @DomainId nvarchar(50),
	  @i_a_pk_id INT
)  
AS 
	BEGIN 
		DELETE FROM tbl_Case_Denial
		WHERE PK_ID=@i_a_pk_id AND @DomainId = DomainId
    END

GO
