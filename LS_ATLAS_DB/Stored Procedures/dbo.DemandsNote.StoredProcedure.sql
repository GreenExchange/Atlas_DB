USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[DemandsNote]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DemandsNote](    
@cid varchar(50)    
)    
as    
begin    
update tblcase set date_demands_printed=getdate() where case_id=@cid    
end

GO
