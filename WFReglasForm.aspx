<%@ page language="VB" autoeventwireup="false" inherits="WFReglasForm, App_Web_irmiclv2" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="WUCTabButtonNet.ascx" TagName="WUCTabButtonNet" TagPrefix="uc2" %>
<%@ Register Src="WUCMiniTabbuttonNet.ascx" TagName="WUCMiniTabbuttonNet" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">    
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Reglas</title>    
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>    
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <link rel="stylesheet" runat="server" id="MyStylesheet" href="./Css/default.css" />
</head>
<body runat="server" id="MyBody" class="PWFondo" style=" margin:0px; width:100%; height:99%;">   
<div id="errnoscript"  runat="server"  style="width:100%; text-align:center; visibility:hidden;"> <!--Noscript--></div>
<div id="content"  runat="server"  style="height:100%; overflow:auto; visibility:visible;" class="PWContent PWContentReglasForm">
     <form  autocomplete="off" id="form1" runat="server" style='margin:0px; width:99%; height:100%;' >
     <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>     
    <div runat="server" id="DivCapaOpaca" style="width:100%; position:absolute; overflow: hidden; left: 0px; top: 0px; height: 20px; display:none;" class=""></div>          
    <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>            
    <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 16px; top: 454px; height: 46px; display:none;">        
         <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
    </div>           
    <div style="clear:both;">
    <div id="DivReglas" style="width:100%"> 
        <div style="width:100%; text-align:center; position:fixed; top:0px;" id="WFReglasForm_Cabecera" class="PWcabecera_toolbar" runat="server"> 
        </div>   
        <div runat="server" id="DivTablaReglas" style="width:100%; padding:5px;">
       <table style="border:0px; width:100%; margin-top:30px;" class="table table-condensed">
            <thead class="PWTableHeader" runat="server" id="WFReglasForm_TheadReglas" style="">
            <tr runat="server" id="WFReglasForm_ThReglas">            
            <%--<td id="THEliminar" runat="server" class="PWTableCellHeader"></td>
            <td id="THEstado" runat="server" class="PWTableCellHeader">Estado</td> 
            <td id="THReglasOrden" runat="server" class="PWTableCellHeader">Orden</td>                    
            <td id="THReglasNombre" runat="server" class="PWTableCellHeader">Nombre</td>
            <td id="THReglasTipo" runat="server" class="PWTableCellHeader">Tipo</td>            
            <td id="THReglasObjeto" runat="server" class="PWTableCellHeader">Resultado</td> 
            <td id="THReglasDictamen" runat="server" class="PWTableCellHeader">Dictamen</td> 
            <td id="THReglasTipoEjec" runat="server" class="PWTableCellHeader">Tipo Ejecución</td>            
            <td id="THReglasOrigenDatos" runat="server" class="PWTableCellHeader">Origen de Datos</td>     --%>                   
            </tr>
            </thead>
            <tbody runat="server" id="TBodyReglas">
            </tbody>
        </table>
        </div>
        <div runat="server" id="DivControlesReglas" style="margin:10px; padding:10px;">
           <span style="float:left;">            
            <span class="PWButton" onclick="location.href='./WFReglaEdicionForm.aspx'" style="cursor:pointer;" runat="server" id="Button_NuevaReglaSpan">
                <%--<img runat="server" id="Button_NuevaReglaImg" src="./images/default/add.png" alt=""  style="vertical-align:baseline;"/>--%>
                <span runat="server" id="Button_NuevaReglaTxt"  style="vertical-align:baseline;">Nueva regla</span>                
            </span>&nbsp;                           
        </span> 
        </div>               
    </div>     
    <div id="DIVCamposOcultos" style="display:none;"> 
    <asp:Button ID="BTRenumerar" runat="server" Text="Button"  />   
    <input type="hidden" value="" id="HDRenumerar" runat="server"/>
    </div>            
    </div>
    </form>
</div>
</body>
<%--<script type="text/javascript" >NoIncluirEnFrame();</script>--%>
</html>
