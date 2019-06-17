USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddServiceType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddServiceType]
(
@DomainId nvarchar(50),
@ServiceType varchar(100),
@ServiceDesc varchar(100)
)
as
begin
insert into tblservicetype(ServiceType, ServiceDesc, DomainID)  values (@ServiceType,@ServiceDesc,@DomainId)
end

GO
