USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteFileName]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteFileName](  
@getFName varchar(100)  
) as  
begin  
    declare   
 --@getFName varchar(100),  
 @st nvarchar(200)  
 --set @getFName='9-30-2003-5-38-50-PM-0.6991308_1.tif'  
        set @st = 'UPDATE tblimages  set deleteflag=1 where filename = '''+@getFName+''''  
 execute sp_executesql @st  
 --print @st  
end

GO
