USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Pom_Packet_Details_Update]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pom_Packet_Details_Update] 
	-- Add the parameters for the stored procedure here
	@POM_PacketFileName varchar(500),
	@pom_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update tblPomCase set POM_PacketFileName=@POM_PacketFileName where pom_id=@pom_id
END
GO
