USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Request_Response_List]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_Request_Response_List]
(
   @List_Id int
)
as
begin
Delete from MST_REQUEST_REJECTION_MASTER where List_Id =@List_Id
End
GO
