USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddServiceType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddServiceType]
(
@ServiceType varchar(100),
@ServiceDesc varchar(100)
)
as
begin
insert into tblservicetype(ServiceType, ServiceDesc) values (@ServiceType,@ServiceDesc)
end
GO
