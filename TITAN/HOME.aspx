<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HOME.aspx.vb" Inherits="TITAN.HOME" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
    <title>TITAN (Tidal Inundation Tracking Application for Norfolk)</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <%--<meta http-equiv="X-UA-Compatible" content="IE=7,IE=9" />--%>
    <%--<meta name="apple-mobile-web-app-capable" content="yes" />--%>
    <%--<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />--%>
    
    <%--Dojo Dijits THEME--%>
    <%--<link rel="stylesheet" href="http://js.arcgis.com/3.9/js/dojo/dijit/themes/carlo/carlo.css" />--%>
    <%--<link rel="stylesheet" href="http://js.arcgis.com/3.9/js/esri/css/esri.css" /> --%>   
    
    <%--The <link> tag loads the esri.css stylesheet, which contains styles specific to Esri widgets and components--%>
    <link rel="stylesheet" type="text/css" href="http://js.arcgis.com/3.8/js/dojo/dijit/themes/nihilo/nihilo.css"/>
    <link rel="stylesheet" type="text/css" href="http://js.arcgis.com/3.8/js/esri/css/esri.css"/>


    <style type="text/css">
    html, body {
      height: 100%;
      width: 100%;
      margin: 0;
      padding:0;
    }
    

    #legendPane {
      border: solid #FFFFFF 1px;
      vertical-align:top;
      font-family: tahoma;
    }
    
        #HomeButton 
    {      
      position: absolute;
      top: 95px;
      left: 20px;
      z-index: 50;
    }
        
      #sliderWrapper {
        position:absolute; 
        right: 10px; 
        top:10px; 
        z-Index: 40;

        width: 150px;
        height: 40px;
        background: #fff;
        -moz-box-shadow: 0 0 5px #888;
        -webkit-box-shadow: 0 0 5px #888;
        box-shadow: 0 0 5px #888;
        opacity:0.8;
        filter:alpha(opacity=80);
      }
      
      #sliderLabels {
        position: relative; 
        top: -1px; 
        height: 1em; 
        font-size: 50%; 
        font-weight: bold;
        font-family: tahoma;
        color: #444;
        padding: 3px;
        margin: 5px 10px 0 10px;
      }

    #map{padding:0;}
    





  </style>

    <script type="text/javascript">        var dojoConfig = { parseOnLoad: true };</script>
    <script type="text/javascript" src="http://js.arcgis.com/3.8/"></script>
   





    <script type="text/javascript">
        var map;
        var jimlayer, visibleLayerIds = [];

        require([
        "esri/map",
        "esri/dijit/HomeButton",
        "esri/arcgis/utils",
        "esri/dijit/Scalebar",
        "esri/layers/FeatureLayer",
        "esri/dijit/Legend",
        "dojo/_base/array",
        "dojo/parser",
        "esri/layers/ArcGISTiledMapServiceLayer",
        "esri/layers/ArcGISDynamicMapServiceLayer",
        "esri/layers/ImageParameters",
        "dojo/dom",
        "dojo/on",
        "dijit/registry",
        "dijit/layout/BorderContainer",
        "dijit/layout/ContentPane",
        "dijit/form/HorizontalSlider",
        "dijit/layout/AccordionContainer",
        "dojo/domReady!"
      ],
        //function (Map, HomeButton, arcgisUtils, Scalebar, FeatureLayer, Legend, arrayUtils, parser, ArcGISTiledMapServiceLayer, ArcGISDynamicMapServiceLayer, ImageParameters, dom, on, registry, BorderContainer, ContentPane, AccordionContainer) {
        function (Map, HomeButton, arcgisUtils, Scalebar, FeatureLayer, Legend, arrayUtils, parser, ArcGISTiledMapServiceLayer, ArcGISDynamicMapServiceLayer, ImageParameters, dom, on, registry, query, AccordionContainer) {
            //            parser.parse();

            var legendLayers = [];

            map = new esri.Map("mapDiv", {
                center: [-76.262970, 36.896645],
                zoom: 12,
                showAttribution: false,
                basemap: "hybrid"

            });

            var scalebar = new esri.dijit.Scalebar({
                map: map,
                scalebarUnit: "english"
            }, dojo.byId("scalebardiv"));


            var home = new HomeButton({ map: map }, "HomeButton");
            home.startup();

            //Use the ImageParameters to set the visibleLayerIds layers in the map service during ArcGISDynamicMapServiceLayer construction.
            var imageParameters = new ImageParameters();
            imageParameters.layerIds = [0];  //Interstate Symbols
            imageParameters.layerOption = ImageParameters.LAYER_OPTION_SHOW;
            //can also be: LAYER_OPTION_EXCLUDE, LAYER_OPTION_HIDE, LAYER_OPTION_INCLUDE



            //Web Service
            var oceans = new ArcGISTiledMapServiceLayer("http://services.arcgisonline.com/ArcGIS/rest/services/Ocean_Basemap/MapServer");

            var NewBaseMapLayer = new ArcGISDynamicMapServiceLayer("http://orfmaps.norfolk.gov/orfgis/rest/services/TITAN/TITAN_BaseMap_20140528/MapServer");
            NewBaseMapLayer.setVisibleLayers([0, 2, 3, 4, 5, 7, 8]);


            //            jimlayer = new ArcGISDynamicMapServiceLayer("http://orfmaps.norfolk.gov/orfgis/rest/services/NORFTGAPP_All_Layers_20140527/MapServer",
            jimlayer = new ArcGISDynamicMapServiceLayer("http://orfmaps.norfolk.gov/orfgis/rest/services/TITAN/TITAN_FDG_20140528/MapServer",
                              { "imageParameters": imageParameters });
            jimlayer.setVisibleLayers([0]);

            //            var jimlayer = new ArcGISDynamicMapServiceLayer("http://orfmaps.norfolk.gov/orfgis/rest/services/NORFTGAPP_All_Layers_20140516/MapServer");
            //jimlayer.setVisibleLayers([1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 24]);






            //wire an event handler for the dojo slider
            map.on("load", function () {
                on(registry.byId('sliderOpacity'), 'change', changeOpacity);
            });

            function changeOpacity(op) {
                var newOp = (op / 100);
                jimlayer.setOpacity(1.0 - newOp);
                oceans.setOpacity(newOp);
            }



            legendLayers.push({ layer: jimlayer, title: 'FLOOD LAYER:' });
            legendLayers.push({ layer: NewBaseMapLayer, title: 'LEGEND:' });

            //var legend = new esri.dijit.Legend({ map: map }, "legendDiv");
            //legend.startup();


            //DISPLAY LEGEND
            map.on('layers-add-result', function () {
                var legend = new Legend({
                    map: map,
                    layerInfos: legendLayers
                }, "legendDiv");
                legend.startup();
            });


            //add the legend      \/  \/  \/
            //            map.on("layers-add-result", function (evt) {
            //                var layerInfo = arrayUtils.map(evt.layers, function (layer, index) {
            //                    return { layer: layer.layer, title: layer.layer.name };
            //                });
            //                if (layerInfo.length > 0) {
            //                    var legendDijit = new Legend({
            //                        map: map,
            //                        layerInfos: layerInfo
            //                    }, "legendDiv");
            //                    legendDijit.startup();
            //                }
            //            });
            //add the legend      /\  /\  /\


            map.addLayers([jimlayer]);
            map.addLayers([NewBaseMapLayer]);

            var NOWreading = dom.byId("txtboxReadingNOW").value;

            switch (NOWreading) {
                case "0.000":
                    dom.byId("currentOverlay").value = "0";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "0.500":
                    dom.byId("currentOverlay").value = "1";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "1.000":
                    dom.byId("currentOverlay").value = "2";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "1.500":
                    dom.byId("currentOverlay").value = "3";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "2.000":
                    dom.byId("currentOverlay").value = "4";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "2.500":
                    dom.byId("currentOverlay").value = "5";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "3.000":
                    dom.byId("currentOverlay").value = "6";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "3.500":
                    dom.byId("currentOverlay").value = "7";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "4.000":
                    dom.byId("currentOverlay").value = "8";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "4.500":
                    dom.byId("currentOverlay").value = "9";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "5.000":
                    dom.byId("currentOverlay").value = "10";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "5.500":
                    dom.byId("currentOverlay").value = "11";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "6.000":
                    dom.byId("currentOverlay").value = "12";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "6.500":
                    dom.byId("currentOverlay").value = "13";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "7.000":
                    dom.byId("currentOverlay").value = "14";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "7.500":
                    dom.byId("currentOverlay").value = "15";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "8.000":
                    dom.byId("currentOverlay").value = "16";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "8.500":
                    dom.byId("currentOverlay").value = "17";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "9.000":
                    dom.byId("currentOverlay").value = "18";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "9.500":
                    dom.byId("currentOverlay").value = "19";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
                case "10.000":
                    dom.byId("currentOverlay").value = "20";
                    currentOverlay_onclick(dom.byId("currentOverlay").value);
                    break;
            }



        });


        function currentOverlay_onclick(myLAYER) {

            visibleLayerIds = [];
            //            visibleLayerIds.push(0, 2, 8);
            //visibleLayerIds.push(1, 4, 5, 6, 7, 12);

            switch (myLAYER) {
                case "0":
                    visibleLayerIds.push(0);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "1":
                    visibleLayerIds.push(1);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "2":
                    visibleLayerIds.push(2);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "3":
                    visibleLayerIds.push(3);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "4":
                    visibleLayerIds.push(4);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "5":
                    visibleLayerIds.push(5);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "6":
                    visibleLayerIds.push(6);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "7":
                    visibleLayerIds.push(7);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "8":
                    visibleLayerIds.push(8);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "9":
                    visibleLayerIds.push(9);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "10":
                    visibleLayerIds.push(10);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "11":
                    visibleLayerIds.push(11);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "12":
                    visibleLayerIds.push(12);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "13":
                    visibleLayerIds.push(13);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "14":
                    visibleLayerIds.push(14);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "15":
                    visibleLayerIds.push(15);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "16":
                    visibleLayerIds.push(16);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "17":
                    visibleLayerIds.push(17);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "18":
                    visibleLayerIds.push(18);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "19":
                    visibleLayerIds.push(19);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
                case "20":
                    visibleLayerIds.push(20);
                    jimlayer.setVisibleLayers(visibleLayerIds);
                    break;
            }

        }




        function CloseModals(modalName) {
            //just hide the modal pop ups because breaks because of the ajax paging - does full postback
            //find control that triggered close
            var modalPopupBehaviorCtrl;
            var modalBehaviorID = "";
            if (modalName == "photo") {
                modalBehaviorID = "ModPhotoBehaviorID";
            } else if (modalName == "flood") {
                modalBehaviorID = "modFloodBehaviorID";
            } else if (modalName == "project") {
                modalBehaviorID = "modProjectBehaviorID";
            }
            //now hide modal popup
            modalPopupBehaviorCtrl = $find(modalBehaviorID);
            modalPopupBehaviorCtrl.hide();
            return false;
        }


    </script>
</head>

  <body class="nihilo">
















<%--    <div id="content" style="border-style: double; border-width: thick; width: 800px">--%>
    <div id="mainWindow" data-dojo-type="dijit/layout/BorderContainer" 
         data-dojo-props="design:'headline',gutters:false" 
         style="width: 100%; height: 90%; margin: 0; background-color: #B0D4C3;">


        <div id="header" data-dojo-type="dijit.layout.ContentPane" data-dojo-props="region:'top'"
         style="background-color: #697f75;">
            <asp:Label ID="Label1" runat="server" Text="TITAN " Font-Size="XX-Large" Font-Bold="True" Font-Italic="True" Font-Names="Tahoma"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="(Tidal Inundation Tracking Application for Norfolk)" Font-Italic="True" Font-Names="Tahoma" Font-Bold="True"></asp:Label>
            <div id="subheader" style="background-color: #B0D4C3;">
            <table align="center"><tr align="center">
                    <td align="center">
                        <asp:Label ID="overlays" runat="server" Text="Flood Layer: "
                            ForeColor="Black" Font-Bold="True" Font-Italic="True" Font-Names="Tahoma" 
                            ToolTip="Select from this dropdown list a hypothetical Flood Layer you'd like to see appear on the Map..."></asp:Label>
                        <select name="currentOverlay" id="currentOverlay" 
                            style="width: 140px; font-family: tahoma; font-size: small;" data-dojo-type="dijit.form.Select"
                            onchange="return currentOverlay_onclick(this.value)">
                            <option value="0" selected="selected">Elev 0.0ft</option>
                            <option value="1">Elev 0.5 ft</option>
                            <option value="2">Elev 1.0 ft</option>
                            <option value="3">Elev 1.5 ft</option>
                            <option value="4">Elev 2.0 ft</option>
                            <option value="5">Elev 2.5 ft</option>
                            <option value="6">Elev 3.0 ft</option>
                            <option value="7">Elev 3.5 ft</option>
                            <option value="8">Elev 4.0 ft</option>
                            <option value="9">Elev 4.5 ft</option>
                            <option value="10">Elev 5.0 ft</option>
                            <option value="11">Elev 5.5 ft</option>
                            <option value="12">Elev 6.0 ft</option>
                            <option value="13">Elev 6.5 ft</option>
                            <option value="14">Elev 7.0 ft</option>
                            <option value="15">Elev 7.5 ft</option>
                            <option value="16">Elev 8.0 ft</option>
                            <option value="17">Elev 8.5 ft</option>
                            <option value="18">Elev 9.0 ft</option>
                            <option value="19">Elev 9.5 ft</option>
                            <option value="20">Elev 10.0 ft</option>
                            <option value="13">Hurricane Isabel</option>
                            <option value="15">Isabel +1 ft SLR</option>
                            <option value="17">Isabel +2 ft SLR</option>
                            <option value="19">Isabel +3 ft SLR</option>

                        </select>
                    </td>
                 </tr></table>



            </div>
        </div>


        <div data-dojo-type="dijit.layout.ContentPane" id="leftPane" data-dojo-props="region:'left'">
            <div data-dojo-type="dijit.layout.TabContainer">

                <div data-dojo-type="dijit.layout.ContentPane" id="legendPane" data-dojo-props="title:'Legend', selected:true">
                   <%--<div id="Div1">--%>



                        <%--<div data-dojo-type="dijit/layout/AccordionContainer">--%>
                            <%--<div data-dojo-type="dijit/layout/ContentPane" id="legendPane" data-dojo-props="title:'Legend', selected:true">--%>
                                <div id="legendDiv" style="font-size: x-small">
                                </div>
                            <%--</div>--%>
                        <%--</div>--%>


                   <%-- </div>--%>
                </div>
                <div data-dojo-type="dijit.layout.ContentPane" data-dojo-props="title:'Tab 2'">
                        <div style="font-size: x-small; font-family: tahoma;">
                            &nbsp;<br />
                            Scale
                        </div>
                        <div data-dojo-type="dijit/layout/ContentPane" id="scalebarPane2" data-dojo-props="title:'Scale', selected:true">
                            <div id="scalebardiv">
                            </div>
                        </div>
                        <br />
                    ___________________
                </div>


            </div>
        </div>



<%--MAP \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/--%>
      <div id="mapDiv" 
           data-dojo-type="dijit/layout/ContentPane" 
           data-dojo-props="region:'center'"
           style="border-style: double; border-width: thick; width: 90%; height: 100%; margin: 40;"> 

        <div id="sliderWrapper"> <!-- slider divs -->

          <div id="sliderOpacity" 
               data-dojo-type="dijit/form/HorizontalSlider" 
               data-dojo-props="showButtons:'true', value:0, minimum:0, maximum:100, discreteValues:101, intermediateChanges:true">                    
            <ol id="sliderLabels" 
                data-dojo-type="dijit/form/HorizontalRuleLabels" 
                data-dojo-props="container:'topDecoration'">
              <li>+</li>
              <li>FADE</li>
              <li>-</li>
            </ol>
          </div>
        </div> <!-- end slider divs -->
        
        <div id="HomeButton">
        </div>
      </div>
<%--MAP /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ --%>

        <div id="footer" data-dojo-type="dijit.layout.ContentPane" data-dojo-props="region:'bottom'">
            &nbsp;
        </div>



    </div>  <%-- <---bordercontainer--%>




<%--    </div>--%>




<form id="Form1" runat="server">

      <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
      </cc1:ToolkitScriptManager>
            <%--GAUGE PANEL--%>
            <asp:Panel ID="modPanelFlood" runat="server" Style="cursor: move; background-color: #DDDDDD;
                border: solid 1px Gray; color: Black">
                <iframe id="Iframe1" src="GaugeDetail.aspx" style="height: 295px; width: 370px;"
                    align="center"></iframe>
                <div style="text-align: center;">
                    <asp:Button ID="Ok_flood" runat="server" Text="CLOSE" 
                        OnClientClick="return CloseModals('flood');" CssClass="esriRoundedBox" />
                </div>
            </asp:Panel>
            <cc1:ModalPopupExtender ID="modFlood" runat="server" TargetControlID="btnGauge01"
                PopupControlID="modPanelFlood" PopupDragHandleControlID="modPanelFlood" CancelControlID="Ok_flood"
                BehaviorID="modFloodBehaviorID" />
            <%--GAUGE PROJECTION--%>
            <asp:Panel ID="modPanelProject" runat="server" Style="cursor: move; background-color: #DDDDDD;
                border: solid 1px Gray; color: Black">
                <iframe id="Iframe2" src="GaugeProjection.aspx" style="height: 395px; width: 470px;"
                    align="center"></iframe>
                <div style="text-align: center;">
                    <asp:Button ID="Ok_project" runat="server" Text="CLOSE" 
                        OnClientClick="return CloseModals('project');" CssClass="esriRoundedBox" />
                </div>
            </asp:Panel>
            <cc1:ModalPopupExtender ID="modProject" runat="server" TargetControlID="btnProject01"
                PopupControlID="modPanelProject" PopupDragHandleControlID="modPanelProject" CancelControlID="Ok_project"
                BehaviorID="modProjectBehaviorID" />


            <div id="footer2" style="background-color: #B0D4C3; clear: both; text-align: center;
            height: 80px; vertical-align: middle;">
            <asp:Button ID="btnGauge01" runat="server" Text="Sewells Point Gauge" Width="150px" 
                    Font-Names="Tahoma" Font-Size="Small" Font-Bold="False" 
                    CssClass="esriRoundedBox" />&nbsp;&nbsp;
            <asp:Button ID="btnProject01" runat="server" Text="Tide Projections" Width="150px" 
                    Font-Names="Tahoma" Font-Size="Small" CssClass="esriRoundedBox" />&nbsp;&nbsp;
            <asp:Button ID="btnRefresh" runat="server" Text="Current Elevation" Width="150px" 
                    Font-Names="Tahoma" Font-Size="Small" CssClass="esriRoundedBox" />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Copyright © City of Norfolk" Font-Names="Tahoma" Font-Size="Smaller"></asp:Label>
            <asp:HiddenField ID="txtboxReadingNOW" runat="server" />
        </div>
</form>

</body>
</html>
