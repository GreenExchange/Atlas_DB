USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_AllClaim]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AllClaim](@cid varchar(50),@UID VARCHAR(100)='admin')
as
select *,USER_INITIALS = (CASE @UID 
								 
								 WHEN 'admin' THEN 'adm' 
								  ELSE 'ab' END)
from LCJ_VW_CaseSearchDetails_RTF where case_id =@cid

GO
