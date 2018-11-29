<%@ page language="VB" autoeventwireup="false" inherits="WFCampoForm2Excel, App_Web_yltmxo10" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   
    <!--<meta http-equiv="cache-control" content="no-cache, no-store, max-age=0, must-revalidate" />-->
    <!--<meta http-equiv="pragma" content="no-cache" />--> 
    <!--<meta http-equiv="Expires" content="-1"/>--> 
    <!--<meta http-equiv="Last-Modified" content="0"/> -->    

    <title>WFCampoForm2Excel</title>
    <%--<style> .TDTextMaybeNumeric { } </style>--%>
</head>
<body  id="MyBody">
    <div runat="server" id="mydiv" >    
    </div>
    <form  autocomplete="off" id="form1" runat="server">        
    <div runat="server" id="divControlesocultos" style="display:none">  
    <input type="hidden" runat="server" value="" id="Nbf" />  
    <input type="hidden" runat="server" value="" id="DT" />  
    <asp:Button ID="ButtonDisplayExcel" runat="server" style="display:none" Text="Exportar a Excel"/>    
    </div>        
    </form>
</body>
<script type="text/javascript" >
function OpenXls()
{Timer=setTimeout("OpenXls2()",100);}

function OpenXls2()
{ }

onload="javascript:OpenXls();"

</script>
</html>
