<%@ page language="VB" autoeventwireup="false" inherits="WFRedirect, App_Web_b11o5nua" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">    
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <title>wait</title>
</head>
<body id="MyBody" runat="server" style="width:100%; height:100%;">
<%--<div runat="server" id="DivCapaOpaca" class="" style="position:absolute;overflow: hidden; left: 0px; top: 0px; height: 100%; width:100%; display:none;"></div>--%>                  
    <div runat="server" id="DivCapaRecarga" class="" style="width:100%;  height:100%; position:absolute;  overflow: hidden; left: 0px; top: 0px; display:none;">        
     <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; padding-left:-56px; margin-left:50%; padding-top:-56px; margin-top:50%;   z-index:201;" alt="Espere"/>-->
     <form  autocomplete="off" id="form1" runat="server"><div></div></form>
    </div>
</body>
</html>
