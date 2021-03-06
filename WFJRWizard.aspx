﻿<%@ page language="VB" autoeventwireup="false" inherits="WFJRWizard, App_Web_irmiclv2" %>
<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">       
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />    
    <title>Reports Wizard</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <script src="JsLibs/jasper/underscore.js"></script>
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <%--<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>--%>   
</head>
<body runat="server" id="MyBody" class="PWFondo" onresize="javascript:AjustarCapas();"    style="margin:0px; width:100%; height:99%;" >   
   <div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;" >           
  <!--Noscript-->
</div>
<div id="content" runat="server"  class="PWContent PWContentInicioForm">
    <style id="DynamicStyles" runat="server"></style>
    <form  autocomplete="off" id="form1" runat="server" style=" margin:0px; width:100%; height:100%;">    
    <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
    <a runat="server" id="modalista" style="display:none;"></a>
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true" EnablePageMethods="true"></asp:ScriptManager>    
    <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />        
        <div runat="server" id="DivCapaOpaca" style="width:100%; position:absolute; overflow: hidden; left: 0px; top: 0px; height: 46px; display:none;" class=""></div>  
        <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>                
        <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 12px; top: 352px; height: 46px; display:none;">        
        <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
        </div>
    <div runat="server" id="DivCabecera" class='PWCabecera'  >                
            <uc1:wuccabeceraprincipal3 ID="BarraPrincipal" runat="server" TabSeleccionado="Inicio" />          
    </div>
      <%--<div id="container_preview_params"></div>
	<button disabled  id="JRViwerFiltrar" >Filtrar</button>--%>          
    <div runat="server" id="DivJRViwer" style="width:100%; height:600px; min-height:600px;" >
        <iframe runat="server" style="display:none" id="iframeA" src=""/>
        <ul id="container_folders" class="col-lg-3 col-md-4 col-sm-6 col-xs-6 jasperPlan" style="display:none">
            <li><button type="button" id="btn_mureports" runat="server">Mis informes</button></li>
        </ul>
        <div id="container_wizard" class="col-lg-9 col-md-8 col-sm-6 col-xs-6 jasperPlan " style="display:none">
            <div id="container_reports"></div>    
            <div id="container_myreports"></div>
            <div id="container_report_info"></div>
            <div id="container_report_params"></div>
            <div id="container_report_name"></div>
            <div id="container_report_params_visible"></div>            
        </div> 
        <div id="container_preview" class="col-lg-9 col-md-8 col-sm-6 col-xs-6 jasperPlan "></div>  
        <iframe id="container_preview_ifr" style="width:100%; height:100%; min-height:1000px;" runat="server" ></iframe> 
    </div>         
    <div runat="server" id="DivControlesOcultos" style="display:none;" >
    <asp:HiddenField ID="INFO_Tocado" runat="server" Value ="" />
    <asp:HiddenField ID="INFO_position_scroll_info" runat="server" Value ="" />
    <!--Indica la clave actual para identificar del formulario dinamico generado --> 
    <input type="hidden" value="" id="HiddenCurrentValueFormXPage" runat="server" /> 
    <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div>       
    </div>
</form>
</div>
</body>
    <script type="text/javascript">        
    </script>
</html>
