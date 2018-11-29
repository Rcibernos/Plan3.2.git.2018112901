<%@ page language="VB" autoeventwireup="false" inherits="WFSelectorGeneral, App_Web_b11o5nua" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>SelectorGeneral</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <script type="text/javascript" src="./JsLibs/JSAjustar.js"></script>     
    <script type="text/javascript" src="./JsLibs/JSAuxProcesos.js"></script> 
    <script type="text/javascript" src="JsLibs/Paginas/JSSelectorGeneral.js"></script>
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
</head>
<body style=" width:100%; " runat="server" id="MyBody">
    <form  autocomplete="off" id="form1" runat="server" style=" width:100%; ">
    <div onclick="javasctipt:AjustarTamano();">&nbsp;    
    </div>
    <div class="PWCajaInfo" id="Info" runat="server">
    <span id="MyDiv" runat="server" class="PWTextError" ></span>
    <div id="WFInfo_PieMsj" runat="server"></div>
    </div>    
    <asp:Panel ID="Panel1" runat="server">
    &nbsp;
    </asp:Panel>    
    <div id="AdicionalInfo" runat="server" style="display:none; text-align:center;">    
    <div style="display:none" runat="server" id="DivAdicionalInfo" >        
    </div>
    <div id="OkCancel" runat ="server" style="font-size:large; text-align:center; width:100%; margin:0 auto; padding-top:20px;"></div>               
    <asp:Button ID="ButtonRet" runat="server" Text="Button" />
    </div>
    <iframe  runat="server" id="IfrDnx" src="HTMLVacia.htm" style="width:0px; height:0px; opacity:0" ></iframe>
    <div style="display:none"><input type="hidden" value="" runat="server" id="infoprevent"/></div>
    </form>    
</body>
</html>