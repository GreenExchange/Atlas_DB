USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_PeerReviewDoctor]    Script Date: 6/17/2019 2:29:45 AM ******/
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
@DomainId NVARCHAR(50)
AS
BEGIN
    select '' as Doctor_id,'--Select Doctor--' as Doctor_Name union	
	select distinct Doctor_id,Doctor_Name from TblReviewingDoctor where Active=1 and DomainId=@DomainId order by 2
END


GO
