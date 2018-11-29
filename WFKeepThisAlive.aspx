<%@ page language="VB" autoeventwireup="false" inherits="WFKeepThisAlive, App_Web_b11o5nua" enableviewstatemac="true" viewstateencryptionmode="Always" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body runat="server" id="MyBody">
    <form  autocomplete="off" id="form1" runat="server" style="display:none;">
    <div>        
    </div>
    </form>            
    <script type="text/javascript" >
    var Timer;
    function SetTimer(Cont,Mseg,key) { Timer = setTimeout("Reloader(" + Cont + ",'" + key + "')", Mseg); }
    function Reloader(Param,key) { if (key == "") { location.href = "./WFKeepThisAlive.aspx?par=" + Param; } else { location.href = "./WFKeepThisAlive.aspx?par=" + Param + "&check=" + key; }  }
    </script>
</body>
</html>
