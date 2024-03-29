USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Report_Hearings]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_Report_Hearings]
(
@Date_Type NVARCHAR(100),
@ForDay NVARCHAR(100),
@StartDate NVARCHAR(100),
@EndDate NVARCHAR(100),
@Defendant_Id NVARCHAR(1000),
@Provider_Id NVARCHAR(1000),
@InsuranceCompany_Id NVARCHAR(1000),
@Court_Id NVARCHAR(100),
@Status NVARCHAR(1000)
)
AS
begin
declare
@sqlselect nvarchar(2000)
		
		set @sqlselect = 'select *, Convert(nvarchar(15), Trial_Date, 101) as HearingTrial_Date  from LCJ_VW_CASESEARCHDETAILS where (1=1) '

		if @ForDay <>  '' 
			set @sqlselect = @sqlselect + ' and Datediff(d,' + @Date_Type + ','''+@ForDay + ''')=0 '
		if @Defendant_Id <> 'All' 
			set @sqlselect = @sqlselect + ' and Defendant_Id in (''' + Replace(@Defendant_Id,',',''',''') + ''') '
		if @Provider_Id <> 'All' 
			set @sqlselect = @sqlselect + ' and Provider_Id in (''' + Replace(@Provider_Id,',',''',''') + ''') '
		if @InsuranceCompany_Id <> 'All' 
			set @sqlselect = @sqlselect + ' and InsuranceCompany_Id in (''' + Replace(@InsuranceCompany_Id,',',''',''') + ''') '
		if @Status <> 'All' 
			set @sqlselect = @sqlselect + ' and Status in (''' + Replace(@Status,',',''',''') + ''') '
		if @Court_Id <> '' 
			set @sqlselect = @sqlselect + ' and Court_Id in (' + @Court_Id  + ') '
		if @StartDate <> '' and @EndDate <>  '' 
			set @sqlselect = @sqlselect + ' and '  + @Date_Type   + ' between ''' + @StartDate + ''' and ''' + @EndDate + ''' '
		set @sqlselect = @sqlselect + ' order by ' + @Date_Type + ''
		print @sqlselect 
		exec sp_executesql @sqlselect
end
GO
