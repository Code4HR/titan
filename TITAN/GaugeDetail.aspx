<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GaugeDetail.aspx.vb" Inherits="TITAN.GaugeDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label2" runat="server" Text="Sewells Point Gauge Readings" Font-Bold="True" Font-Italic="True" Font-Size="Larger" Font-Names="Tahoma"></asp:Label>
        <hr />
    <table><tr>
           <td><asp:Label ID="Label1" runat="server" Text="Readings as of:"></asp:Label></td>
       <td><asp:TextBox ID="txtbxDTS" runat="server" Enabled="False"></asp:TextBox></td>
       </tr>
       <tr>
       <%--<td><asp:Label ID="Label2" runat="server" Text=" Tide Prediction:"></asp:Label></td>--%>
       <%--<td><asp:TextBox ID="txtbxTIDE" runat="server" Enabled="False" Width="70px"></asp:TextBox> </td>--%>
       <td><asp:Label ID="Label3" runat="server" Text=" OBSERVED Level:"></asp:Label></td>
       <td><asp:TextBox ID="txtbxOBV" runat="server" Enabled="False" Width="60px"></asp:TextBox>ft</td>
       </tr>
       <tr>
       <%--<td><asp:Label ID="Label4" runat="server" Text=" FORECASTED:"></asp:Label></td>--%>
       <%--<td><asp:TextBox ID="txtbxFORE" runat="server" Enabled="False" Width="70px"></asp:TextBox> </td>--%>

       <td><asp:Label ID="Label5" runat="server" Text="ELEVATION (Rounded):"></asp:Label></td>
       <td><asp:TextBox ID="txtbxROUNDED" runat="server" Enabled="False" Width="60px"></asp:TextBox>ft</td>
              </tr>
       <tr><td>&nbsp;</td></tr>
       <tr>
       <td>View Gauge Readings:</td>
       <td>&nbsp;</td>
       </tr>
       <tr>
       <td align="right"><asp:Label ID="Label4" runat="server" Text="1 Day"></asp:Label>&nbsp;</td>
       <td><asp:HyperLink
               ID="HyperLink1" runat="server" NavigateUrl="" Target="_blank" Text="SEWELLS POINT READING">Click Here</asp:HyperLink></td>
        </tr>
       <tr>
       <td align="right"><asp:Label ID="Label6" runat="server" Text="3 Days"></asp:Label></td>
       <td><asp:HyperLink
               ID="HyperLink2" runat="server" NavigateUrl="" Target="_blank" Text="SEWELLS POINT READING">Click Here</asp:HyperLink></td>
        </tr>
       <tr>
       <td align="right"><asp:Label ID="Label7" runat="server" Text="7 Days"></asp:Label></td>
       <td><asp:HyperLink
               ID="HyperLink3" runat="server" NavigateUrl="" Target="_blank" Text="SEWELLS POINT READING">Click Here</asp:HyperLink></td>
        </tr>
        <tr>
       <td align="right"><asp:Label ID="Label8" runat="server" Text="Hurricane Isabel (2003)"></asp:Label></td>
       <td><asp:HyperLink
               ID="HyperLink4" runat="server" NavigateUrl="" Target="_blank" Text="SEWELLS POINT READING">Click Here</asp:HyperLink></td>
        </tr>
        <tr>
       <td align="right"><asp:Label ID="Label9" runat="server" Text="Nor'easter (2009)"></asp:Label></td>
       <td><asp:HyperLink
               ID="HyperLink5" runat="server" NavigateUrl="" Target="_blank" Text="SEWELLS POINT READING">Click Here</asp:HyperLink></td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
