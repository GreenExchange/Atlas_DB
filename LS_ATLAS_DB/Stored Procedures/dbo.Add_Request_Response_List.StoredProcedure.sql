USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Add_Request_Response_List]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Request_Response_List]
(
   @DomainId nvarchar(50),
   @ListName nvarchar(500),
   @List_Type nvarchar(50)
)
as
begin
insert into MST_REQUEST_REJECTION_MASTER values(@DomainId,@ListName,@List_Type)
End

GO
