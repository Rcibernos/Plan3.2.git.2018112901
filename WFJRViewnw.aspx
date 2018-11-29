<%@ page language="VB" autoeventwireup="false" inherits="WFJRViewnw, App_Web_b11o5nua" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />    
    <title>Jasper Reports</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <script src="JsLibs/jasper/underscore.js"></script>
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>   
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />      
   
</head>
<body runat="server" id="MyBody" class="PWFondo" onresize="" style="margin:0px; width:100%; height:99%;">   
    <form id="form1" runat="server">
    <div id="container_preview_params">
	</div>
	<button disabled  id="JRViwerFiltrar" >Filtrar</button>
    <div runat="server" id="DivJRViwer" ></div>         
    <div runat="server" id="DivControlesOcultos" style="display:none;" >
    <asp:HiddenField ID="INFO_Tocado" runat="server" Value ="" />
    <asp:HiddenField ID="INFO_position_scroll_info" runat="server" Value ="" />
    <!--Indica la clave actual para identificar del formulario dinamico generado --> 
    <input type="hidden" value="" id="HiddenCurrentValueFormXPage" runat="server" /> 
    <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div>       
    </div>
    </form>
</body>
    
</html>
