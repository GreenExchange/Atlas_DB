USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[selectBAtchNumbers]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectBAtchNumbers]
(
@DomainId NVARCHAR(50)
)
as
begin
select BatchNumber from tblProvListBoxDetails
WHERE @DomainId = DomainId
end

GO
