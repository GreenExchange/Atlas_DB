USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[selectBAtchNumbers]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectBAtchNumbers]
as
begin
select BatchNumber from tblProvListBoxDetails
end
GO
