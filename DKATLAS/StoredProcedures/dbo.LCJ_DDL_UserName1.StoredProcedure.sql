USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_UserName1]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_UserName1]
  
As
 
Begin
	select '...Select user to assign...' [userid], '' [userName]
	union
	select username ,USERID  from issuetracker_users where (userName not in('')) order by USERID
end
GO
