USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Template_Retrieve]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Template_Retrieve]
(
    @s_a_user_type VARCHAR(100)='S',
	@i_a_template_id INT=0,
	@s_a_Case_ID VARCHAR(100)=''
)
AS
BEGIN
  IF (@i_a_template_id = 0)
  BEGIN
	 SELECT 
		 T.I_TEMPLATE_ID,
		 T.SZ_TEMPLATE_NAME,
		 SZ_TEMPLATE_FILENAME,
		 @s_a_Case_ID AS CASE_ID
	 FROM 
		 MST_TEMPLATES T
		 INNER JOIN
		 TXN_TEMPLATES_ACCESS A
		 ON T.I_TEMPLATE_ID = A.TEMPLATE_ID
	 WHERE
		 USER_TYPE = @s_a_user_type
	 ORDER BY SZ_TEMPLATE_NAME 
   END
   ELSE
   BEGIN
      SELECT 
		 T.I_TEMPLATE_ID,T.SZ_TEMPLATE_NAME,SZ_TEMPLATE_FILENAME
	  FROM 
		  MST_TEMPLATES T
		  INNER JOIN
		  TXN_TEMPLATES_ACCESS A
		  ON T.I_TEMPLATE_ID = A.TEMPLATE_ID
	  WHERE
		  USER_TYPE = @s_a_user_type
		  AND T.I_TEMPLATE_ID = @i_a_template_id
	  ORDER BY SZ_TEMPLATE_NAME 
   END
END
GO
