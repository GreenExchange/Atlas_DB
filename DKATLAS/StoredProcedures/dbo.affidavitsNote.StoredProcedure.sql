USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[affidavitsNote]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[affidavitsNote](  
@cid varchar(50)  
)  
as  
begin  
update tbltobeprinted_aff set printed=1 where case_id=@cid  
end
GO
