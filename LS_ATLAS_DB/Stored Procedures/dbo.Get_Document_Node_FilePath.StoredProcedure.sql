USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Document_Node_FilePath]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Document_Node_FilePath]
	-- Add the parameters for the stored procedure here
	@DomainId nvarchar(50),
	@i_a_Image_id bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  B.PhysicalBasePath + filepath + [filename],[filename],filepath from tbldocimages D left join tblBasePath B ON B.BasePathId = D.BasePathId where imageid =@i_a_Image_id and DomainId=@DomainId 
END
GO
