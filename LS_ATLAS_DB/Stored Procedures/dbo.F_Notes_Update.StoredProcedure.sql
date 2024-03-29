USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Notes_Update]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Notes_Update]      
(
@DomainId NVARCHAR(50),
@Notes_Id varchar(50),
@Notes_Type varchar(20),
@NDesc varchar(3000),
@User_Id varchar(50),
@Notes_Date Datetime
)
AS
BEGIN
UPDATE tblNotes SET Notes_Desc=@NDesc, Notes_Type=@Notes_Type,Notes_Date=@Notes_Date,[User_Id]=@User_Id,DomainId=@DomainId WHERE Notes_ID=@Notes_Id and DomainId=@DomainId
END

GO
