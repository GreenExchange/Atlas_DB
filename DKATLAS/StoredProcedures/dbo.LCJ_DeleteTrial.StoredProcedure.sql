USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteTrial]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteTrial]
(

@Trial_id nvarchar(3000)

)


AS

DELETE from tblTrials where Trial_ID = + @Trial_id
GO
