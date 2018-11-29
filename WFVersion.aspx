<%@ page language="VB" autoeventwireup="false" inherits="Default2, App_Web_g53dfrix" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title></title>
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>

    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <script type="text/javascript" src="./JsLibs/JSAjustar.js"></script>     
    <script type="text/javascript" src="./JsLibs/JSAuxProcesos.js"></script> 
</head>
<body>
<div id="errnoscript"  runat="server"  style="width:100%; text-align:center; visibility:hidden;"><!--Noscript--></div>
<div id="content" runat="server"  style="visibility:visible;" class="PWContent">
    <form  autocomplete="off" id="form1" runat="server">
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
    <div runat="server" id="DivCabecera" class='PWCabecera' >          
      <uc2:WUCCabeceraPrincipal3 ID="BarraPrincipal" runat="server" />
    </div> 
    <div runat="server" id="Info"  style="width:99.9%;clear:both; margin-left:80px;"></div> 
    <div id="DivControlesOcultos"  style="display:none;">
    <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div>  
    </div>
    </form>
</div>
</body>

<%--<script type="text/javascript" > NoIncluirEnFrame();</script>--%>
</html>
