USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_ADMIN_GETPROVIDERS]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_ADMIN_GETPROVIDERS]


AS

Select Provider_Id, LTRIM(RTRIM(UPPER(Provider_Name))) AS Provider_Name  from tblProvider where 1=1
GO
