Public Class GaugeProjection
    Inherits System.Web.UI.Page

    Dim ds2 As DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim NOWmonth As String = Now().Month
        If NOWmonth < 10 Then
            NOWmonth = "0" & NOWmonth
        End If

        Dim NOWday As String = Now().Day
        If NOWday < 10 Then
            NOWday = "0" & NOWday
        End If

        Dim START_DTS As String = Now().Year & NOWmonth & NOWday & "000000"


        ds2 = Nothing

        ds2 = SQLutil.GetPastPresentFuture(START_DTS)
        GridView2.DataSource = ds2
        GridView2.DataBind()
    End Sub

End Class