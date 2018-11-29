<%@ page language="VB" autoeventwireup="false" maintainscrollpositiononpostback="true" inherits="WFProcesoPrint, App_Web_irmiclv2" enableviewstatemac="true" viewstateencryptionmode="Always" %>
<%@ Register src="WUCResponder.ascx" tagname="WUCResponder" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server"> 
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
     <title>Imprimir Actividad</title>
     <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" /> 
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
</head>
<body id="MyBody" runat="server" >
<div id="content" runat="server"  style="visibility:visible; width:100%; height:100%; overflow:auto;">
    
    <form  autocomplete="off" id="form1" runat="server">    
        <asp:Button ID="ButtonDFichero" runat="server" Text="" style="display:none;" />
        <input type="hidden" runat="server" id="ButtonDFicheroH"  value=""/>
        <div runat="server" id="PWProcesoPrintContenido" style="vertical-align:top;" >    
        </div>
    </form>
</div>
</body>
</html>
