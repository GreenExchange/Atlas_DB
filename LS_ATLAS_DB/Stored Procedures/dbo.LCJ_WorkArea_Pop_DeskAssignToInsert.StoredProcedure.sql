USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkArea_Pop_DeskAssignToInsert]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_WorkArea_Pop_DeskAssignToInsert]

(
@DomainID NVARCHAR(50),
@Case_Id NVARCHAR(300),
@Desk_Id INT,
@User_Id NVARCHAR(100),
@NDesc NVARCHAR(3000)
)


AS 

DECLARE @DESKNAME  NVARCHAR(300)

SET @DESKNAME = (Select Desk_Name from tblDesk WHERE Desk_Id = +@Desk_Id and DomainId=@DomainID)
	
	INSERT INTO tblCaseDesk
	
	(
	Case_Id,
	Desk_Id,
	DomainId	
	)
	
	VALUES
	
	(
	@Case_Id,
	@Desk_Id,
	@DomainID
	)

	INSERT INTO tblNotes (Notes_Desc,	Notes_Type,	Notes_Priority,	Case_Id,	Notes_Date,	User_Id,	DomainId) 
	VALUES ('Case Assigned to desk '+ @DESKNAME + '' ,'Activity',1,@Case_Id, getdate(),@User_Id,@DomainID)

	IF @NDesc <> '' 
		BEGIN

			INSERT INTO tblNotes (Notes_Desc,	Notes_Type,	Notes_Priority,	Case_Id,	Notes_Date,	User_Id,	DomainId) 
			VALUES (@NDesc ,'Activity',1,@Case_Id, getdate(),@User_Id,@DomainID)
		

		END

GO
