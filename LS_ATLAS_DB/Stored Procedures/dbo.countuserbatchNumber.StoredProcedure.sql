USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[countuserbatchNumber]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[countuserbatchNumber]
(
   @BatchNumber nvarchar(50)
)
as
begin
select UserId from RelationUser_BatchNo where BatchNumber=@BatchNumber
end

GO
