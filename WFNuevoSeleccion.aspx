<%@ page language="VB" autoeventwireup="false" inherits="WFNuevoSeleccion, App_Web_irmiclv2" enableviewstatemac="true" viewstateencryptionmode="Always" %>
<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Nuevo Elemento</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>        
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>    
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%> 
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> 
    <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />   
</head>
<body runat="server" id="MyBody" class="PWFondoFormulario"  style=" margin:0px; width:100%; height:100%;"  >  
<style type ="text/css" > .WFNuevoSeleccionLink { display:table; margin-top:15px; padding:4px; }</style> 
<div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;"><!--Noscript--></div>
<div id="content" runat="server" style="visibility:visible; height:100%; overflow:auto;">
    <form  autocomplete="off" id="form1" runat="server" style=" margin:0px; width:100%; height:100%;">
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
    <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 12px; top: 352px; height: 46px; display:none;">        
      <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
    </div>
    <div runat="server" id="DivCabecera"><uc2:WUCCabeceraPrincipal3 ID="BarraPrincipal" runat="server" TabSeleccionado="Nuevo" /></div><br /> 
    <div id="WFNuevoSeleccion_Body" >
        <div class="row" style="width:100%">
            <div   class="col-lg-2 col-md-1 "></div>
            <div   class="col-lg-4 col-md-5 col-sm-6 col-xs-12" id="CListaAgenda" runat="server" style="padding:25px;">
                <div runat="server" id="TxtCabAgenda" class="PWTitulo3">AGENDA</div>
            </div>            
            <div   class="col-lg-4 col-md-5 col-sm-6 col-xs-12" id="CListaProcesos" runat="server" style="padding:25px;">
                <div runat="server" id="TxtCabProcesos"  class="PWTitulo3">PROCESOS</div>
            </div>
            <div   class="col-lg-2 col-md-1 "></div>
        </div>
    
    </div>      
    <div style="display:none">
     <asp:Button ID="ev" runat="server" Text="" style="display:none" />
     <%--<input runat="server" type="button"  id="ev" />--%>
     <input runat="server" type="hidden" style="display:none" id="ctrid" value="" />
    </div>          
    </form>
</div>    
</body>
<%--<script type="text/javascript" > NoIncluirEnFrame(); </script>--%>
<script type="text/ecmascript">
function MouseOverTR(aTRid){aTR=document.getElementById(aTRid);if(aTR){aTR.className="PWFondoToolBar";}}
function MouseOutTR(aTRid){aTR=document.getElementById(aTRid);if(aTR){aTR.className="";}}
function cLicknp(ctr) {$('#ctrid').val(ctr.id); $('#ev').click(); }
$('.WFNuevoSeleccionLink').click(function () { cLicknp(this); });
</script>
</html>
