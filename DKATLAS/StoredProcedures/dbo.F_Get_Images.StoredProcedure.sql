USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Get_Images]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Get_Images]   --[dbo].[F_Get_Images] 'CaseID','FH07-42372'                 







(            







 @FilePatyStyle VARCHAR(100) = 'CaseID',    -- 'CaseID','Patient','Insurance','Company'            







 @Case_Id VARCHAR(50) ='FH07-42372',            







 @SearchInputType VarChar(100) = 'Search By ShowDocs'            







)            







AS              







 BEGIN            







             







             







 IF(ISNULL(@SearchInputType,'') ='Search By DM')            







 BEGIN            







   SELECT             







   Case WHEN @FilePatyStyle='CaseID' THEN T.CaseID +'@'+(ISNULL(LCJ.InjuredParty_FirstName,'') +' '+ISNULL( InjuredParty_LastName,'')) + '/' + NodeName  







      WHEN @FilePatyStyle = 'Patient' THEN (ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,'')) +'@'+ T.CaseID  + '/' + NodeName             







      WHEN @FilePatyStyle = 'Insurance' THEN LCJ.INSURANCE_NAME+'/'+(ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,'')) +'@'+ T.CaseID   + '/' + NodeName          







      WHEN @FilePatyStyle = 'Provider' THEN LCJ.Provider_Name+'/'+(ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,'')) +'@'+ T.CaseID       + '/' + NodeName      







       END AS FolderDirectory,            







     T.CaseID  AS Case_Id,            







      LCJ.InjuredParty_FirstName +' '+InjuredParty_LastName AS PATIENT_NAME,LCJ.INSURANCE_NAME,LCJ.Provider_Name,            







     I.ImageID ,(FilePath+Filename)AS Filename             







  from             







    dbo.TBLDOCIMAGES I            







    inner Join dbo.tblImageTag IT on IT.ImageID=i.ImageID            







    inner Join dbo.tblTags T on T.NodeID = IT.TagID             







    INNER JOIN LCJ_VW_CaseSearchDetails LCJ ON T.CaseID=LCJ.Case_Id            







   WHERE T.CaseID=@Case_Id --and Filename like '%.pdf%'           







 END              







 IF(ISNULL(@SearchInputType,'') ='Search By ScanDocs')            







 BEGIN            







   SELECT             







   Case WHEN @FilePatyStyle='CaseID' THEN A.Case_Id +'@'+(ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,''))            







      WHEN @FilePatyStyle = 'Patient' THEN (ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,'')) +'@'+ A.Case_Id              







      WHEN @FilePatyStyle = 'Insurance' THEN LCJ.INSURANCE_NAME+'/'+(ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,'')) +'@'+ A.Case_Id            







      WHEN @FilePatyStyle = 'Provider' THEN LCJ.Provider_Name+'/'+(ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,'')) +'@'+ A.Case_Id             







       END AS FolderDirectory,            







   A.Case_Id  AS Case_Id,REPLACE(B.Document_Type,'/','-') AS Doc_Type,A.FileName AS [FileName],A.ImagePath AS ImgPath ,            







      LCJ.InjuredParty_FirstName +' '+InjuredParty_LastName AS PATIENT_NAME,LCJ.INSURANCE_NAME,LCJ.Provider_Name            







   FROM tblImages A INNER JOIN tblDocumentType B ON A.DocumentId=B.Document_ID            







   INNER JOIN LCJ_VW_CaseSearchDetails LCJ ON A.Case_Id=LCJ.Case_Id            







   WHERE A.Case_Id=@Case_Id            







 END              







 IF(ISNULL(@SearchInputType,'') ='Search By ShowDocs')            







 BEGIN







 







 Select 	--(ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( InjuredParty_LastName,'')) +'@'+ Case_Id +'/'+SZ_PROCESS_NAME  AS FolderDirectory,







 







      Case WHEN @FilePatyStyle='CaseID' THEN Case_ID +'@'+(ISNULL(LCJ.InjuredParty_FirstName,'') +' '+ISNULL( InjuredParty_LastName,'')) + '/' + SZ_PROCESS_NAME  







           WHEN @FilePatyStyle = 'Patient' THEN (ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,'')) +'@'+ Case_ID  + '/' + SZ_PROCESS_NAME             







           WHEN @FilePatyStyle = 'Insurance' THEN LCJ.INSURANCE_NAME+'/'+(ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,'')) +'@'+ Case_ID   + '/' + SZ_PROCESS_NAME          







           WHEN @FilePatyStyle = 'Provider' THEN LCJ.Provider_Name+'/'+(ISNULL(InjuredParty_FirstName,'') +' '+ISNULL( LCJ.InjuredParty_LastName,'')) +'@'+ Case_ID       + '/' + SZ_PROCESS_NAME      







       END AS FolderDirectory,  







       







       







       







          Case_ID  AS Case_Id,    







          LCJ.InjuredParty_FirstName +' '+InjuredParty_LastName AS PATIENT_NAME,LCJ.INSURANCE_NAME,LCJ.Provider_Name          







      ,SZ_FILENAME AS Filename             







     







			From TXN_DOCUMENT_UPLOAD 







			INNER JOIN MST_PROCESS ON TXN_DOCUMENT_UPLOAD.SZ_PROCESS_ID=MST_PROCESS.SZ_PROCESS_CODE







			INNER JOIN LCJ_VW_CaseSearchDetails LCJ ON TXN_DOCUMENT_UPLOAD.SZ_CASE_ID=LCJ.Case_Id       







			WHERE TXN_DOCUMENT_UPLOAD.SZ_CASE_ID = 	@Case_Id AND SZ_FILENAME <> ''







 END         







         







         







 --SELECT             







 --REPLACE(        







 --LCJ.Provider_Name+'/'+(ISNULL(InjuredParty_LastName,'') +' '+ISNULL( LCJ.InjuredParty_FirstName,'')) +'-'+ A.Case_Id,':','')          







 --AS FolderDirectory,            







 --  A.Case_Id  AS Case_Id,REPLACE(B.Document_Type,'/','-') AS Doc_Type,A.FileName AS [FileName],A.ImagePath AS ImgPath ,            







 --     LCJ.InjuredParty_FirstName +' '+InjuredParty_LastName AS PATIENT_NAME,LCJ.INSURANCE_NAME,LCJ.Provider_Name            







 --  FROM tblImages A INNER JOIN tblDocumentType B ON A.DocumentId=B.Document_ID            







 --  INNER JOIN LCJ_VW_CaseSearchDetails LCJ ON A.Case_Id=LCJ.Case_Id            







 --  WHERE  Provider_Name like  'Jade Chiropractic%' And DocumentID =423 and YEAR(scanDate) > 2009 and DeleteFlag <> 1 -- and InjuredParty_FirstName like 'D%'        







 --   order by Case_Id        







           







           







 --SELECT  LCJ.Provider_Name+'/'+(ISNULL(InjuredParty_LastName,'') +' '+ISNULL( LCJ.InjuredParty_FirstName,'')) +'-'+ T.CaseID  AS FolderDirectory,            







 --    T.CaseID  AS Case_Id,           --     LCJ.InjuredParty_FirstName +' '+InjuredParty_LastName AS PATIENT_NAME,LCJ.INSURANCE_NAME,LCJ.Provider_Name,         







 --    I.ImageID ,(FilePath+Filename)AS Filename,          







 --    DateInserted          







 -- from             







 --   dbo.TBLDOCIMAGES I            







 --   inner Join dbo.tblImageTag IT on IT.ImageID=i.ImageID            







 --   inner Join dbo.tblTags T on T.NodeID = IT.TagID             







 --   INNER JOIN LCJ_VW_CaseSearchDetails LCJ ON T.CaseID=LCJ.Case_Id            







 --  WHERE --T.CaseID=@Case_Id and           







 --  Filename like '%.pdf%' and Provider_Name like  '%Chiropractic%'          







 --  AND NodeName like 'PAYMENTS - PROVIDER'          







 --  ORDER BY DateInserted           







             







           







END
GO
