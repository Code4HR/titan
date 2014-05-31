Public Class GaugeDetail
    Inherits System.Web.UI.Page
    Dim ds As DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ds = Nothing
        ds = SQLutil.GetLatestReading()

        Dim tempDTS As String = Trim(ds.Tables(0).Rows(0).Item("READING_DTS").ToString)
        Dim formatDTS As String = ""
        formatDTS = Mid(tempDTS, 5, 2) & "/" & Mid(tempDTS, 7, 2) & "/" & Mid(tempDTS, 1, 4) & " " & _
                    Mid(tempDTS, 9, 2) & ":" & Mid(tempDTS, 11, 2)

        txtbxDTS.Text = formatDTS

        'txtbxTIDE.Text = Trim(ds.Tables(0).Rows(0).Item("GAUGE01_TIDE").ToString)

        txtbxOBV.Text = Trim(ds.Tables(0).Rows(0).Item("GAUGE01_OBSERVED").ToString)

        'txtbxFORE.Text = Trim(ds.Tables(0).Rows(0).Item("GAUGE01_FORECAST").ToString)

        txtbxROUNDED.Text = Trim(ds.Tables(0).Rows(0).Item("GAUGE01_OBSERVED_MAP").ToString)


        Dim URLStartYY As String = Now().Year
        Dim URLStartMM As String = Now().Month
        Dim URLStartDD As String = Now().Day

        If URLStartMM < 10 Then
            URLStartMM = "0" & URLStartMM
        End If

        If URLStartDD < 10 Then
            URLStartDD = "0" & URLStartDD
        End If

        'ONE DAY
        Dim TomorrowDate As DateTime = Now()
        TomorrowDate = TomorrowDate.AddDays(1)

        Dim URLEndYY As String = TomorrowDate.Year
        Dim URLEndMM As String = TomorrowDate.Month
        Dim URLEndDD As String = TomorrowDate.Day

        If URLEndMM < 10 Then
            URLEndMM = "0" & URLEndMM
        End If

        If URLEndDD < 10 Then
            URLEndDD = "0" & URLEndDD
        End If

        Dim navURL = "http://tidesandcurrents.noaa.gov/waterlevels.html?id=8638610&units=standard&bdate=" & _
                     Trim(URLStartYY) & Trim(URLStartMM) & Trim(URLStartDD) & _
                     "&edate=" & _
                     Trim(URLEndYY) & Trim(URLEndMM) & Trim(URLEndDD) & _
                     "&timezone=LST/LDT&datum=NAVD&interval=6&action="
        HyperLink1.NavigateUrl = navURL


        'THREE DAYS
        TomorrowDate = Now()
        TomorrowDate = TomorrowDate.AddDays(3)

        URLEndYY = TomorrowDate.Year
        URLEndMM = TomorrowDate.Month
        URLEndDD = TomorrowDate.Day

        If URLEndMM < 10 Then
            URLEndMM = "0" & URLEndMM
        End If

        If URLEndDD < 10 Then
            URLEndDD = "0" & URLEndDD
        End If

        navURL = "http://tidesandcurrents.noaa.gov/waterlevels.html?id=8638610&units=standard&bdate=" & _
                     Trim(URLStartYY) & Trim(URLStartMM) & Trim(URLStartDD) & _
                     "&edate=" & _
                     Trim(URLEndYY) & Trim(URLEndMM) & Trim(URLEndDD) & _
                     "&timezone=LST/LDT&datum=NAVD&interval=6&action="
        HyperLink2.NavigateUrl = navURL

        'SEVEN DAYS
        TomorrowDate = Now()
        TomorrowDate = TomorrowDate.AddDays(7)

        URLEndYY = TomorrowDate.Year
        URLEndMM = TomorrowDate.Month
        URLEndDD = TomorrowDate.Day

        If URLEndMM < 10 Then
            URLEndMM = "0" & URLEndMM
        End If

        If URLEndDD < 10 Then
            URLEndDD = "0" & URLEndDD
        End If

        navURL = "http://tidesandcurrents.noaa.gov/waterlevels.html?id=8638610&units=standard&bdate=" & _
                     Trim(URLStartYY) & Trim(URLStartMM) & Trim(URLStartDD) & _
                     "&edate=" & _
                     Trim(URLEndYY) & Trim(URLEndMM) & Trim(URLEndDD) & _
                     "&timezone=LST/LDT&datum=NAVD&interval=6&action="
        HyperLink3.NavigateUrl = navURL

        '2009 Nor'ester
        navURL = "http://tidesandcurrents.noaa.gov/waterlevels.html?id=8638610&units=standard&bdate=20091111&edate=20091117&timezone=LST/LDT&datum=NAVD&interval=6&action="
        HyperLink5.NavigateURL = navURL

        'Hurricane Isabel
        navURL = "http://tidesandcurrents.noaa.gov/waterlevels.html?id=8638610&units=standard&bdate=20030916&edate=20030921&timezone=LST/LDT&datum=NAVD&interval=6&action="
        HyperLink4.NavigateUrl = navURL
    End Sub

End Class