USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Testing]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Testing]
AS

Declare     @Nodeid int,
            @Caseid nvarchar(50)


Declare curP cursor For

select nodeid,caseid from tblTags where ParentID is null

OPEN curP 
Fetch Next From curP Into @Nodeid, @Caseid

While @@Fetch_Status = 0 Begin    

    update tblTags SET ParentID =@Nodeid
    where CaseID =@Caseid and ParentID is not null


Fetch Next From curP Into @Nodeid, @Caseid

End -- End of Fetch

Close curP
Deallocate curP

GO
