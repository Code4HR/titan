<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="TITAN._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TITAN (Tidal Inundation Tracking Application for Norfolk)</title>

        <%--The <link> tag loads the esri.css stylesheet, which contains styles specific to Esri widgets and components--%>
    <link rel="stylesheet" type="text/css" href="http://js.arcgis.com/3.8/js/dojo/dijit/themes/nihilo/nihilo.css"/>
    <link rel="stylesheet" type="text/css" href="http://js.arcgis.com/3.8/js/esri/css/esri.css"/>
</head>
<body>

    <div id="splashcontainer" style="vertical-align: middle;" 
        align="center">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/TITAN.gif" />
    </div>
    <div id="splashcontainerns" align="center">

<%--        <script>

            var preloadimages = new Array("titan.gif", "titan.gif")
            var intervals = 1000
            var targetdestination = "home.aspx"
            var splashmessage = new Array()
            var openingtags = '<font face="Arial" size="4">'



            splashmessage[0] = '<img src="titan.gif">'

//            splashmessage[1] = 'Welcome to TITAN'
//            splashmessage[2] = '(Tidal Inundation Tracking Application for Norfolk)'
//            splashmessage[3] = 'BLAH BLAH BLAH'
//            splashmessage[4] = 'We are always here to provide you the better solution'
//            splashmessage[5] = 'Please stand by...'



            var closingtags = '</font>'

            var i = 0

            var ns4 = document.layers ? 1 : 0

            var ie4 = document.all ? 1 : 0

            var ns6 = document.getElementById && !document.all ? 1 : 0

            var theimages = new Array()

            if (document.images) {

                for (p = 0; p < preloadimages.length; p++) {

                    theimages[p] = new Image()

                    theimages[p].src = preloadimages[p]

                }

            }



            function displaysplash() {

                if (i < splashmessage.length) {
                    sc_cross.style.visibility = "hidden"
                    sc_cross.innerHTML = '<b><center>' + openingtags + splashmessage[i] + closingtags + '</center></b>'
                    sc_cross.style.left = ns6 ? parseInt(window.pageXOffset) + parseInt(window.innerWidth) / 2 - parseInt(sc_cross.style.width) / 2 : document.body.scrollLeft + document.body.clientWidth / 2 - parseInt(sc_cross.style.width) / 2
                    sc_cross.style.top = ns6 ? parseInt(window.pageYOffset) + parseInt(window.innerHeight) / 2 - sc_cross.offsetHeight / 2 : document.body.scrollTop + document.body.clientHeight / 2 - sc_cross.offsetHeight / 2
                    sc_cross.style.visibility = "visible"
                    i++
                }

                else {

                    window.location = targetdestination

                    return

                }

                setTimeout("displaysplash()", intervals)

            }



            function displaysplash_ns() {

                if (i < splashmessage.length) {
                    sc_ns.visibility = "hide"
                    sc_ns.document.write('<b>' + openingtags + splashmessage[i] + closingtags + '</b>')
                    sc_ns.document.close()

                    sc_ns.left = pageXOffset + window.innerWidth / 2 - sc_ns.document.width / 2
                    sc_ns.top = pageYOffset + window.innerHeight / 2 - sc_ns.document.height / 2

                    sc_ns.visibility = "show"

                    i++

                }

                else {

                    window.location = targetdestination

                    return

                }

                setTimeout("displaysplash_ns()", intervals)

            }


            function positionsplashcontainer() {

                if (ie4 || ns6) {
                    sc_cross = ns6 ? document.getElementById("splashcontainer") : document.all.splashcontainer
                    displaysplash()
                }

                else if (ns4) {
                    sc_ns = document.splashcontainerns
                    sc_ns.visibility = "show"
                    displaysplash_ns()
                }

                else

                    window.location = targetdestination

            }

            window.onload = positionsplashcontainer

            function redirect() {
                window.location = "home.aspx"
                return
            }
 
        </script>--%>

        <script>
            function redirect() {
                window.location = "home.aspx"
                return
            }
        </script>

        <form id="Form1" runat="server">
        <asp:Label ID="lblSplash01" runat="server" Text="Label" Width="750px" 
            Font-Names="Arial Narrow" Font-Bold="True" Font-Size="Medium"></asp:Label>

        <asp:Label ID="lblSplash02" runat="server" Text="Label" Width="750px" 
            Font-Names="Arial Narrow" Font-Size="Small"></asp:Label>
        <asp:Label ID="lblSplash03" runat="server" Text="Label" Width="750px" 
            Font-Names="Arial Narrow" Font-Size="Small"></asp:Label>
        <asp:Label ID="lblSplash04" runat="server" Text="Label" Width="750px" 
            Font-Names="Arial Narrow" Font-Size="Small"></asp:Label>


            <br /><br />
            <asp:Button ID="btnContinue" runat="server" Text="Continue" 
            CssClass="esriRoundedBox"/>
        </form>
    </div>
</body>
</html>
