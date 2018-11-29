<%@ page language="VB" autoeventwireup="false" inherits="WFEntradaIntra, App_Web_b11o5nua" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    
    <!--<meta http-equiv="cache-control" content="no-cache, no-store, max-age=0, must-revalidate" />-->
    <!--<meta http-equiv="pragma" content="no-cache" />--> 
    <!--<meta http-equiv="Expires" content="-1"/>--> 
    <meta http-equiv="Last-Modified" content="0"/>

    <title></title>   
</head>
<body runat="server" id="MyBody" >
    <form  autocomplete="off" id="form1" runat="server" >    
    <br />
   ConexionString:  
    <%  
        Response.Write(Me.ConexionString)
    %>
    <br />
    Contrato:
    <%
        Response.Write(Me.IdContrato)
    %>
    <br />  
    </form>
</body>
</html>
