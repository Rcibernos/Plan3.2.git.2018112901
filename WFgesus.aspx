<%@ page language="VB" autoeventwireup="false" inherits="WFgesus, App_Web_irmiclv2" %>
<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Gestion de usuarios</title>    
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/> --%>
      
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
</head>
<body runat="server" id="MyBody" style="width:100%; height:100%; overflow:auto;" onresize="javascript:AjustarCapas();">
<div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;"><!--Noscript--></div> 
<div id="content" runat="server" style="visibility:visible; height:100%; overflow:auto;" class="PWContent PWContentGesUs">
    <style id="DynamicStyles" runat="server"></style>
    <form  autocomplete="off" id="form1" runat="server" style=" margin:0px; width:99%; height:100%;">
     <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
     <a runat="server" id="modalista" style="display:none;"></a>
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>   
     <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />        
     <div runat="server" id="DivCapaOpaca" style="width:100%; position:absolute; overflow: hidden; left: 0px; top: 0px; height: 46px; display:none;" class=""></div>  
     <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>                
     <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 12px; top: 352px; height: 46px; display:none;">        
     <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
     </div>     
     <uc1:WUCCabeceraPrincipal3 ID="BarraPrincipal" runat="server" TabSeleccionado="Inicio"/>
    <div id="DivBuscador" runat="server" style="width:100%; clear:both;">
    <div style="text-align:center; padding-bottom:20px;">
        <div id="DivFormularioBusqueda" runat="server" style="width:100%;"></div>
        <div id="DivBuscar" style="width:100%; margin:auto">
            <asp:button ID="ButtonBuscar" runat="server" text="Buscar" CssClass="PWButton" />&nbsp;
            <asp:button ID="ButtonLimpiar" runat="server" text="Limpiar" CssClass="PWButton" />&nbsp;
        </div>
    </div>     
    <div id="DivResultados" runat="server" style="width:100%; margin:auto"></div>
    </div>
    <div style="display:none;">
    <input runat="server" type="hidden" id="vista" value="DivBuscador" />  
    <input runat="server" type="hidden" id="ElementoSeleccionado" value="" />  
    <input runat="server" type="hidden" id="HiddenCurrentValueFormXPage" value="" />      
    <asp:Button ID="ButtonSeleccionar" runat="server" Text="" /> 
    <div id="DivControlesOcultos" style="display:none;">
     <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div> 
    </div>
    </div>    
    </form>
</div>
   
</body>
<%--<script language="javascript" type="text/javascript" > NoIncluirEnFrame();</script>--%>
<script language="javascript" type="text/javascript" >
    AjustarCapas();
</script>
<script language="javascript" type="text/javascript" >
    window.onscroll = popup_position_scroll_info;
</script>
</html>

