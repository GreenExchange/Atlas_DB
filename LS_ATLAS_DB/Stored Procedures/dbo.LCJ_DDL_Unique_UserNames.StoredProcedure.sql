USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Unique_UserNames]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Unique_UserNames]  
As 
Begin	
select '0' as userid,'...Select...' as userName
union
select distinct username [userid],userName from issuetracker_users where (userName not in('')) order by userName
end

GO
