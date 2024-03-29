USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_AllStatus_Details]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_AllStatus_Details]
(
@User_name nvarchar(200)
)
AS
BEGIN
	SET NOCOUNT ON;
 
		 SELECT st.Status_Id,st.Status_Type AS Status,(SELECT COUNT (ISNULL(tblcase.Case_Id,0))  FROM tblcase WHERE Status=st.Status_Type)AS Case_count,status_age_limit,
		 tbluserstatus.criticaldays
		 FROM tblStatus st
		 Left Outer join tbluserstatus On Status=st.Status_Type And username = @User_name
		 --where Final_status='OPEN' and IsActive = 'YES'

		 GROUP BY st.Status_Id,st.Status_Type,st.status_age_limit,criticaldays
		 ORDER BY Status_Type
 
END


GO
