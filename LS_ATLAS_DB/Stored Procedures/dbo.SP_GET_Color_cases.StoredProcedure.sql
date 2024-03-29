USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_Color_cases]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_Color_cases] --SP_GET_Color_cases 'FH07-42372'
@DomainId NVARCHAR(50),
@SZ_CASE_ID NVARCHAR(100)
AS
BEGIN
		select case_id  as Case_Id
            from tblcase (NOLOCK) inner join tblProvider  
			(NOLOCK) on tblcase.Provider_Id =tblProvider.Provider_Id
            and tblcase.Case_Id =@SZ_CASE_ID
			--and tblcase.Case_Id=@DomainId
END

GO
