USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_ZipList_Retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[F_ZipList_Retrieve]
(
	@s_a_Value NVARCHAR(255)
)
 AS
	BEGIN
		SELECT City,ST FROM ZipList WHERE ZipCode=@s_a_Value
	END

GO
