USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[DiscConfNote]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DiscConfNote](    
@DomainId NVARCHAR(50),
@cid varchar(50)    
)    
as    
begin    
update tblcase set date_disc_conf_letter_printed=getdate() where case_id=@cid and DomainId=@DomainId    
end

GO
