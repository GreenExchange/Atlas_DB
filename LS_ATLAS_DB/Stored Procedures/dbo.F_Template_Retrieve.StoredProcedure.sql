USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Template_Retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[F_Template_Retrieve]
(
	@DomainId VARCHAR(50),
    @s_a_user_type VARCHAR(100)='S',
	@i_a_Template_id INT=0,
	@s_a_Case_ID VARCHAR(100)=''
)
AS
BEGIN
  IF (@i_a_Template_id = 0)
  BEGIN
	 SELECT 
		 T.I_TEMPLATE_ID,
		 T.SZ_TEMPLATE_NAME,
		 SZ_TEMPLATE_FILENAME,
		 @s_a_Case_ID AS CASE_ID
	 FROM 
		 MST_TEMPLATES  T
		 INNER JOIN
		 TXN_TEMPLATES_ACCESS  A
		 ON T.I_TEMPLATE_ID = A.TEMPLATE_ID
	 WHERE
		 A.USER_TYPE = @s_a_user_type
		 AND T.DomainId = @DomainId
	 ORDER BY SZ_TEMPLATE_NAME 
   END
   ELSE
   BEGIN
      SELECT
		 T.I_TEMPLATE_ID,T.SZ_TEMPLATE_NAME,SZ_TEMPLATE_FILENAME
	  FROM 
		  MST_TEMPLATES  T
		  INNER JOIN
		  TXN_TEMPLATES_ACCESS  A
		  ON T.I_TEMPLATE_ID = A.TEMPLATE_ID
	  WHERE
		  A.USER_TYPE = @s_a_user_type
		  AND T.I_TEMPLATE_ID = @i_a_TEMPlate_id
		  AND @DomainId = T.DomainId
	  ORDER BY SZ_TEMPLATE_NAME 
   END
END
GO
