USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_PeerReviewDoctor]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Get_PeerReviewDoctor]
AS
BEGIN
    select '' as Doctor_id,'--Select Doctor--' as Doctor_Name union	
	select distinct Doctor_id,Doctor_Name from TblReviewingDoctor where Active=1 order by 2
END
GO
