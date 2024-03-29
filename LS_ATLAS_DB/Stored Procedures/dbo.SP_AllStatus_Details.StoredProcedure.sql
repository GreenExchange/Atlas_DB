USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_AllStatus_Details]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_AllStatus_Details]
(
@DomainId nvarchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;
		(SELECT 
		 'Status' As StatusType
		  ,st.Status_Id
		 ,st.Status_Type AS Status
		 ,(SELECT COUNT (ISNULL(tblcase.Case_Id,0))  FROM tblcase WHERE Status=st.Status_Type And DomainId = @DomainId)AS Case_count
		 --,status_age_limit
		 ,(select criticaldays from tbluserstatus where Status=st.Status_Type and StatusType='status' And DomainId = @DomainId)[Criticaldays]
		 FROM tblStatus st  
		 where --Final_status='OPEN' and IsActive = 'YES' and
		  DomainId = @DomainId
		 GROUP BY st.Status_Id,st.Status_Type,st.status_age_limit)
		 Union
		 (Select 
		 'Rebuttal' As StatusType
		 ,PK_Rebuttal_Status_ID as Status_Id
		 ,Rebuttal_Status as Status
		 ,(SELECT COUNT (ISNULL(tblcase.Case_Id,0))  FROM tblcase WHERE Rebuttal_Status=rs.Rebuttal_Status And DomainId = @DomainId)AS Case_count
		 ,(select criticaldays from tbluserstatus where Status=rs.Rebuttal_Status and StatusType='rebuttal' And DomainId = @DomainId)[Criticaldays]
		 from Rebuttal_Status rs where DomainId = @DomainId
	     GROUP BY rs.PK_Rebuttal_Status_ID,rs.Rebuttal_Status)
		 order by StatusType desc, Status
		 
END


GO
