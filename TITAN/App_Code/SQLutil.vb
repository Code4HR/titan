Imports System.Data.Sql
Imports System.Data
Imports System.Data.SqlClient


Public Class SQLutil

    Public Shared Function GetLatestReading() As DataSet
        Dim ds As New DataSet

        Dim qry As String = "Select [READING_DTS],[GAUGE01_ID],[GAUGE01_TIDE],[GAUGE01_OBSERVED],[GAUGE01_FORECAST]," & _
                            "[GAUGE01_OBSERVED_MAP]" & _
                            "from GISNORFOLK.TidalGaugeNOW"

        Dim con As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager. _
                                           ConnectionStrings("DefaultConnection").ConnectionString)
        Dim cmd As SqlCommand = New SqlCommand(qry, con)

        Dim da As New SqlDataAdapter(cmd)

        Try

            da.Fill(ds)
            If ds.Tables.Count > 0 Then
                HttpContext.Current.Session("GaugeRecord") = ds

            End If

        Catch ex As Exception

            HttpContext.Current.Session("GaugeRecord") = Nothing
            Return Nothing

        End Try

        con.Close()
        cmd.Dispose()
        Return ds

    End Function


    Public Shared Function GetPastPresentFuture(ByVal START_DTS As String) As DataSet
        Dim ds As New DataSet

        Dim qry As String = "Select [READING_DTS] as Date, [G01_TIDE] as Tide, [G01_OBSERVED] as Observed, " & _
                            "[G01_FORECAST] as Forecast, [G01_OBSERVED_MAP] as Elevation " & _
                            "from [GISNORFOLK].[TidalGaugeByDate] WHERE [READING_DTS] > '" & START_DTS & "'"

        Dim con As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager. _
                                           ConnectionStrings("DefaultConnection").ConnectionString)
        Dim cmd As SqlCommand = New SqlCommand(qry, con)

        Dim da As New SqlDataAdapter(cmd)

        Try

            da.Fill(ds)
            If ds.Tables.Count > 0 Then
                HttpContext.Current.Session("GaugeRecord") = ds

            End If

        Catch ex As Exception

            HttpContext.Current.Session("GaugeRecord") = Nothing
            Return Nothing

        End Try

        con.Close()
        cmd.Dispose()
        Return ds

    End Function




End Class
