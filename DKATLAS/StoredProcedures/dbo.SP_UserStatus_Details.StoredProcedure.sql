USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_UserStatus_Details]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_UserStatus_Details]
(
@User_name nvarchar(200)
)

AS
BEGIN
	SET NOCOUNT ON;
		 SELECT st.Status_Id,st.Status_Type AS Status,(SELECT COUNT (ISNULL(tblcase.Case_Id,0))  FROM tblcase WHERE Status=st.Status_Type)AS Case_count,(SELECT COUNT (ISNULL(tblcase.Case_Id,0))  FROM tblcase where DateDiff(dd,ISNULL(Date_Status_Changed,Date_Opened),GETDATE()) > (select CriticalDays from tblUserStatus where Status=st.Status_Type) and Status=st.Status_Type) AS critical_cases,status_age_limit,
		 (select criticaldays from tbluserstatus where Status=st.Status_Type)[Criticaldays]
		 FROM tblStatus st inner join tblUserStatus us on status=st.Status_Type 
		 where us.username=@User_name
		 --isnull(st.IsActive,1)<>0
		 
		 --WHERE     IsActive='1' or IsActive='' or IsActive is null or IsActive='YES'
		 GROUP BY st.Status_Id,st.Status_Type,st.status_age_limit
		 ORDER BY Status_Type
END


GO
