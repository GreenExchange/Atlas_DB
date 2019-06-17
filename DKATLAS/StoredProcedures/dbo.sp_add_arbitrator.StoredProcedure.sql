USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_arbitrator]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_arbitrator]
	@i_arbitrator_id INT = NULL,
	@sz_arbitrator_name NVARCHAR(50) = NULL,
	@sz_arbitrator_location NVARCHAR(50) = NULL,
	@sz_arbitrator_phone NVARCHAR(20) = NULL,
	@sz_arbitrator_fax NVARCHAR(20) = NULL,
	@bt_is_aaa BIT = NULL
AS
BEGIN
	IF EXISTS (SELECT arbitrator_id 
					FROM TblArbitrator WHERE arbitrator_id = @i_arbitrator_id)
	BEGIN
		UPDATE TblArbitrator
		SET ARBITRATOR_NAME = @sz_arbitrator_name,
			ABITRATOR_LOCATION = @sz_arbitrator_location, 
			ARBITRATOR_PHONE = @sz_arbitrator_phone,
			ARBITRATOR_FAX = @sz_arbitrator_fax, is_aaa = @bt_is_aaa
		WHERE arbitrator_id = @i_arbitrator_id
	END
	ELSE
	BEGIN
		INSERT INTO TblArbitrator (ARBITRATOR_NAME,ABITRATOR_LOCATION,ARBITRATOR_PHONE,ARBITRATOR_FAX,IS_AAA)
			VALUES (@sz_arbitrator_name,@sz_arbitrator_location,@sz_arbitrator_phone,@sz_arbitrator_fax,@bt_is_aaa)
	END
END
GO
