USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_RTF_TEMPLATE_Notes]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADD_RTF_TEMPLATE_Notes]
(
	@DomainId nvarchar(50),
	@Notes_Desc nvarchar(2000),
	@UID varchar(50),
	@template_name varchar(200),
	@type int
)
as
begin
	if (@type = 1)
	begin
		insert into tblRTFNotes(Notes_Desc,Notes_Date,template_name,User_Id,DomainId)
		values (@Notes_Desc, getdate(),@template_name,@UID,@DomainId)
	end
end

GO
