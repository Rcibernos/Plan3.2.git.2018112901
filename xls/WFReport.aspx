<%@ page language="VB" autoeventwireup="false" inherits="WFReport, App_Web_yltmxo10" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body id="Mybody" runat="server"  style="width:100%; height:100%">
    <form  autocomplete="off" id="form1" runat="server" style="width:100%; height:100%;" >  
    <rsweb:ReportViewer ID="MiReportViewer" runat="server" AsyncRendering="False" Width="99%" Height="99%">
    <ServerReport  ReportServerUrl="" ReportPath=""/>        
    </rsweb:ReportViewer>    
    </form>
</body>
</html>
