USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[FHA_Get_Service_Type]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FHA_Get_Service_Type]
AS
BEGIN
	SELECT ServiceType_ID,ServiceType FROM TBLSERVICETYPE
	Order By ServiceType ASC
END

GO
