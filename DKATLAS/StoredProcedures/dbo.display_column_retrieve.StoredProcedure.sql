USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[display_column_retrieve]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[display_column_retrieve]  
@i_a_user_id int =1  
AS  
BEGIN  
   
	 --Retrieve Unmapped columns  
  
	 select   
	  *     
	 from   
	  tbl_display_column   
	 where  
	  ISNULL(is_default,0)=0  
	 ORDER BY   
	  column_order, display_name  
  
  
	 --Retrieve mapped columns  
  
	 select   
	  *     
	 from   
	  tbl_display_column   
	 where  
	  ISNULL(is_default,0)=1  
	 ORDER BY   
	  column_order , display_name  
END  
GO
