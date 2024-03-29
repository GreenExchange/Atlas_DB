USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[STP_CheckPacketedCases]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_CheckPacketedCases] 
	-- Add the parameters for the stored procedure here
	@DomainId nvarchar(50),
	@strCaseID nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  ISNULL(PacketID,'') as PacketID, 
	cas.Case_Id  
	FROM dbo.tblCase cas
	INNER  JOIN dbo.tblPacket pkt ON cas.FK_Packet_ID = pkt.Packet_Auto_ID 
	where cas.DomainId=@DomainId AND pkt.PacketID=@strCaseID
END
GO
