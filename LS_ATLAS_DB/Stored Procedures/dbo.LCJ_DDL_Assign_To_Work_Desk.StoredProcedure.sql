USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Assign_To_Work_Desk]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Assign_To_Work_Desk]    
AS        
begin        
	SELECT tbldesk.Desk_Id,tbldesk.Desk_Name from tbldesk inner join issuetracker_users  
	on tbldesk.desk_name=issuetracker_users.username  
	order by username  
end

GO
