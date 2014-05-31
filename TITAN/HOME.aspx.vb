Public Class HOME
    Inherits System.Web.UI.Page

    Public ds As DataSet
    Public ds2 As DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ds = Nothing
        ds = SQLutil.GetLatestReading()

        txtboxReadingNOW.Value = Trim(ds.Tables(0).Rows(0).Item("GAUGE01_OBSERVED_MAP").ToString)

    End Sub


End Class