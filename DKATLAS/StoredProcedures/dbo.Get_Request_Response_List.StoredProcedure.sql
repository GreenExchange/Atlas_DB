USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Request_Response_List]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Request_Response_List]
as
begin
select * from MST_REQUEST_REJECTION_MASTER 
End
GO
