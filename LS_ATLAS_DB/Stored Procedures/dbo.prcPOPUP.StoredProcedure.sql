USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[prcPOPUP]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prcPOPUP](@vCase_ID varchar(50))
as
	declare @Out varchar(400)
	Begin
select distinct(notes_type) from tblNotes where case_id=@vCase_Id and Notes_type='POPUP'
	end

GO
