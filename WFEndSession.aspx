<%@ page language="VB" autoeventwireup="false" inherits="WEndSession, App_Web_b11o5nua" enableviewstatemac="true" viewstateencryptionmode="Always" culture="auto" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Fin de Sesion</title>    
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
</head>
<body runat="server" id="MyBody"  style="overflow:hidden;" class="PWFondoInfo">
    <form autocomplete="off" id="form1" runat="server" style="width :100%;">
    <br /><br />
    <div runat="server" id="MyDiv" class="PWCajaInfo">    
    <span class="PWTextError" style="font-size:large; padding:20px; display:none;" runat="server" id="Msj1">
    Debido a un tiempo de inactividad la sesión ha caducado. Si quiere continuar deberá identificarse de nuevo</span>
    <span class="PWTextError" style="font-size:large; padding:20px;" runat="server" id="Msj2">
    Debido a un tiempo de inactividad la sesión ha caducado. Si quiere continuar deberá identificarse de nuevo</span>
    <br /><br />    
    <div runat="server" id="Reconectar" style="display:none;">
    <table  style="width:100%"><tr><td style="width:40%">&nbsp;</td>
    <td style="width:10%"><input type="button" runat="server" id="continuar" class="PWButton" value="Continuar" onclick="location.href='./default.aspx';" style="width:100px; float:none"/></td>
    <td style="width:10%"><input type="button" runat="server" id="cerrar" class="PWButton" value="Cerrar" onclick="window.close();" style="width:100px; float:none"/></td>
    <td style="width:40%">&nbsp;</td></tr></table>
    </div>
    </div>
    </form>
</body>
<script  type="text/javascript" >

if (parent) 
if (parent.location.href!=location.href)
{ parent.location.href = location.href; }

var idioma = window.navigator.language || navigator.browserLanguaje || navigator.userLanguage;
var iniciales = idioma.substring(0, 2);
if (iniciales == "en") {
    document.getElementById("Msj1").innerHTML = "Because downtime session has expired. If you wish to continue you must login again"
    document.getElementById("continuar").value = "Continue"
    document.getElementById("cerrar").value = "Close"
}
else if (iniciales == "fr") {
    document.getElementById("Msj1").innerHTML = "Parce que les temps d'arrêt session a expiré. Si vous souhaitez poursuivre, vous devez vous connecter à nouveau"
    document.getElementById("continuar").value = "Reporter"
    document.getElementById("cerrar").value = "Près"
}
else if (iniciales == "de") {
    document.getElementById("Msj1").innerHTML = "Denn Ausfallzeiten Sitzung ist abgelaufen. Wenn Sie fortfahren möchten, müssen Sie sich neu anmelden"
    document.getElementById("continuar").value = "weitergehen"
    document.getElementById("cerrar").value = "schließen"
}
else if (iniciales == "ca") {
    document.getElementById("Msj1").innerHTML = "A causa d'un temps d'inactivitat la sessió ha caducat. Si vol continuar haurà d'identificar de nou"
    document.getElementById("continuar").value = "Continuar"
    document.getElementById("cerrar").value = "Cerrar"
}
else if (iniciales == "gl") {
    document.getElementById("Msj1").innerHTML = "Que o tempo de inactividade da sesión caducou. Se quere continuar ten que poñerse de novo"
    document.getElementById("continuar").value = "Continuar"
    document.getElementById("cerrar").value = "Cerrar"
}
else if (iniciales == "eu") {
    document.getElementById("Msj1").innerHTML = "Downtime saioa amaitu egin delako. Jarraitu nahi izanez gero berriro hasi behar duzu"
    document.getElementById("continuar").value = "egiteko baino gehiago"
    document.getElementById("cerrar").value = "itxi"
}

</script>
</html>
