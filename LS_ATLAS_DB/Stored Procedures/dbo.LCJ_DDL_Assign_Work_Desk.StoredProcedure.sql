USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Assign_Work_Desk]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Assign_Work_Desk]  
AS  
begin  
 
SELECT UserID,UserName from issuetracker_users
order by username

end

GO
