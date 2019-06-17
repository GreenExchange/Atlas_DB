USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_PROCESS_TYPE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_PROCESS_TYPE]
(
@DomainId nvarchar(50),
@SZ_PROCESS_NAME nvarchar(100)

)


AS

DELETE from MST_PROCESS  where SZ_PROCESS_NAME = + Rtrim(Ltrim(@SZ_PROCESS_NAME)) and DomainId = @DomainId

GO
