USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[DiscConfNote]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DiscConfNote](    
@cid varchar(50)    
)    
as    
begin    
update tblcase set date_disc_conf_letter_printed=getdate() where case_id=@cid    
end
GO
