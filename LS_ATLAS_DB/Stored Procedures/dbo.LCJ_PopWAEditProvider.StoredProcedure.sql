USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_PopWAEditProvider]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_PopWAEditProvider]
(

@Provider_Id		nvarchar(100),
@Case_Id		nvarchar(100)

)

AS

UPDATE tblCase SET

		Provider_Id = @Provider_Id
		
WHERE 
		Case_Id = Rtrim(Ltrim(@Case_Id))

GO
