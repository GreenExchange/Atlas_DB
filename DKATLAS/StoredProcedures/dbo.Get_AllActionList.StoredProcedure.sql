USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_AllActionList]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Get_AllActionList]
AS
BEGIN
    select '' as Action_id,'Select Action' as Action_Type union	
	select distinct Action_id,Action_Type from tblAction where Action_Type <>''
END
select * from TblReviewingDoctor
GO
