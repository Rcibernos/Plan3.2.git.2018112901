<%@ page language="VB" debug="true" autoeventwireup="false" inherits="WFInfo, App_Web_b11o5nua" enableviewstatemac="true" viewstateencryptionmode="Always" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Aviso</title>    
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>

    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    
</head>
<body  runat="server" id="MyBody"  style="overflow:hidden;" class="PWFondoInfo">
    <div id="WFInfo_Fondo">
    <form autocomplete="off" id="form1" runat="server">
    <br /><br />
    <div class="PWCajaInfo">
    <span id="MyDiv" runat="server" class="PWTextError" ></span>
    <div id="WFInfo_PieMsj" runat="server"></div>
    </div>        
    </form>
    </div>
</body>
<script type="text/javascript"  >
self.focus();
</script>
</html>
