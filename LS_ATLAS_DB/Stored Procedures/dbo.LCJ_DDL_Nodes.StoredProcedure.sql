USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Nodes]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Nodes]
@DomainId varchar(50)=''
AS 
BEGIN
		Select '---Select Type---' As NodeName
		Union
		SELECT DISTINCT NodeName FROM  MST_DOCUMENT_NODES where DomainId=@DomainId
		
END

GO
