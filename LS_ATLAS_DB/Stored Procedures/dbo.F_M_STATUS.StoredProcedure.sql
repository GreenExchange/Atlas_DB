USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_M_STATUS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_M_STATUS]
(
@DomainId nvarchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;
		 SELECT st.Status_Id,st.Status_Type,st.Status_Abr,st.Status_Hierarchy,st.Status_Description,st.Final_Status,st.Filed_Unfiled,st.IsActive,st.forum,st.hierarchy_Id,
		 (SELECT COUNT (ISNULL(tblcase.Case_Id,0))  FROM tblcase  as tblcase WHERE Status=st.Status_Type and DomainId=@DomainId)AS Case_Cnt
		 FROM tblStatus  st
		 WHERE DomainId = @DomainId 
		 GROUP BY st.Status_Id,st.Status_Type,st.Status_Abr,st.Status_Hierarchy,st.Status_Description,st.Final_Status,st.Filed_Unfiled,st.IsActive,st.forum,st.hierarchy_Id
		 ORDER BY Status_Type
END

GO
