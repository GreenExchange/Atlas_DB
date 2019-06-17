USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Available_AttorneyNamesForFirm]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Available_AttorneyNamesForFirm]    
(
@AttorneyFirmId int,
@DomainId varchar(50)
	) 
AS    
BEGIN      
    select UserId as Id,Name from  [dbo].[tbl_AttorneyUser] where AttorneyFirmId=@AttorneyFirmId and DomainId=@DomainId
END
GO
