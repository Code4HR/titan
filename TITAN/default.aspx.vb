Public Class _default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        lblSplash01.Text = "Welcome to the Tidal Inundation Tracking Application for Norfolk (TITAN).</br></br>"


        lblSplash02.Text = "<b>TITAN</b> was developed by the City of Norfolk GIS Bureau in the Department of Communications & Technology. </br>" & _
        "It is intended to be used by City of Norfolk employees and citizens as a resource to increase awareness of </br>" & _
        "coastal flooding impacts throughout the City.  </br></br>" & _
        "Tidal flooding depicted in the application represents local tide water levels throughout the City based on </br>" & _
        "adjustments relative to the National Oceanographic and Atmospheric Administration (NOAA) Tide Gauge 8638610 at </br>" & _
        "Sewells Point, Virginia located in Norfolk.  Water level relationships to Sewells Point observations are based </br>" & _
        "on a 2009-2010 tide gauge program contracted through the City Stormwater Division of the Public Works Department. </br></br>"

        lblSplash03.Text = "Actual flooding during storm events will likely be more extensive than shown on TITAN if combined  </br>" & _
        "with rainfall.  Additionally, areas not showing flooding caused by tidal events may flood solely from rainfall during  </br>" & _
        "a storm.  In no event will the City of Norfolk be liable for any damages including: loss of data, lost profits,  </br>" & _
        "business interruption, loss of business information or other pecuniary loss that might arise from the use of this  </br>" & _
        "application or the information it contains.  This application is for general information only and shall not be used  </br>" & _
        "for the design, modification, or construction of improvement to real property or flood plain determination. </br></br>"

        lblSplash04.Text = "For questions concerning TITAN, please contact the GIS TEAM: <b>ITGISTEAM@norfolk.gov</b> "



    End Sub


    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click

        Response.Redirect("HOME.aspx")
    End Sub
End Class