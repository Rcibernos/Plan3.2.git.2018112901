<%@ page language="VB" autoeventwireup="false" inherits="WFBusquedaForm, App_Web_b11o5nua" maintainscrollpositiononpostback="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">       
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>B&uacute;squeda</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>    
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%-- <link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/> --%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
</head>
<body runat="server" id="MyBody" class="PWFondo" onresize="javascript:AjustarTamanoComponentes();" style=" margin:0px; width:100%; height:100%;"> 
<div id="content" class="PWContent PWContentBusquedaForm" >
    <form  autocomplete="off" id="form1" runat="server" style='width:100%; height:100%;' >
    <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
    <a runat="server" id="modalista" style="display:none;"></a>
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>    
    <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />
    <div runat="server" id="DivCapaOpaca" class="" style=" z-index:200;  vertical-align:middle; text-align:center; position:absolute; overflow: hidden; left: 19px; top: 388px; height: 48px; display:none; width: 346px;"></div>  
    <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>
     <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 16px; top: 454px; height: 46px; display:none;">        
         <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
    </div>     
    <script  language="javascript" type="text/javascript" > ShowPantallaEnEspera(); </script>    
    <div runat="server" id="DivCabecera" class='PWcabecera_toolbar' style="width:99%; text-align:center; xposition: xabsolute; left: 8px; top: 4px;"></div>
    <div runat="server" id="DivBarra" class='PWCaja3' style="width:54%; position: absolute; left: 0px; top: 28px;">
    <table width="100%" ><tr>
    <td class='PWCaja2' >
          <%--<uc1:WUCBarraPrincipal ID="BarraPrincipal" runat="server" Modo="Busqueda"   />--%>             
    </td>
    <td></td>
    <td>
    <table style="width:100%;">
         <tr>         
         <td style=" max-width:50px; min-width:24px;  width:50px;">&nbsp;</td>
         <td style="text-align:center;"><span class="PWText3" >xxxxxxxxxxxxx</span></td>
         <td style=" max-width:50px; min-width:24px;  width:50px;">&nbsp;</td>
         </tr>
         </table>        
    </td>    
    </tr>
    </table>
    </div>
    <div runat="server" id="DivBusquedas" style="overflow: auto;" class="PWFondo">
    </div>
    <div runat="server" id="DivPaneles"  style=" border:1px; overflow:auto; " class="PWFondo">
    <div runat="server" id="DivForm" style="width:100%;" class="PWFondoFormulario"></div>
    <div runat="server" id="DivBotones" style="width:100%; text-align:center; height:30px; vertical-align:middle; margin-right:20px;  margin-bottom:5px; padding-bottom:5px;" class="PWFondoToolBar">
        <div style="height:5px;">&nbsp;</div>
          &nbsp;<asp:LinkButton ID="LinkButtonRefrescar"  OnClientClick="javascript:ShowPantallaEnEspera();"  runat="server" CssClass="PWButton" style="text-decoration:none;">Refrescar</asp:LinkButton>
          &nbsp;<asp:LinkButton ID="LinkButtonLimpiar" OnClientClick="javascript:ShowPantallaEnEspera();" runat="server" CssClass="PWButton" style="text-decoration:none;">Limpiar</asp:LinkButton>            
          &nbsp;<img   src="./images/default/mini_up.png" alt="Ocultar" runat="server" id="ImgSimboloExpand" style="max-width:16px; min-width:16px; cursor:pointer;" onclick="javascript:MostrarOcultarform(this);"/>
        <div style="height:5px">&nbsp;</div>
    </div>
    <iframe runat="server" frameBorder="0" id="IframeResultados" scrolling="no" src="./WFVacia.aspx" style="width:100%; height:0px" class="PWFondo"/>
    </div>    
    <div runat="server" id="DivZonaControlesOcultos" style="display:none;">     
    <!-- ZONA DE CONTROLES GENERALES OCULTOS -->
    <!-- Controles para el FileUpload -->        
    <input id="FileUploadGenerico" type="file" runat="server" style="display:none;" />
    <input id="FileUploadGenericoIDCampo" type="hidden" runat="server" style="display:none;"/>
    <asp:Button ID="FileUploadGenericoButton" runat="server" Text="Button" style="display:none;  " />
    <!-- Redimension Iframe -->
    <input type="button" style="display:none;" id="HiddenDimensionButtonOf_IframeResultados" onclick="javascript:CambiaTamanoIframe();";/>    
    <input type="hidden" value="" id="HiddenNombreIFRameContenedorDeEstaPagina"  runat="server"/>    
    <input type="hidden" value="" id="MyCalculateHeight" />
    <input type="hidden" value="" id="MyCalculateWidth" />
    <input type="hidden" value="1" id="HiddenVistaform" runat="server" />
    <!--Indica la clave actual para identificar del formulario dinamico generado -->
    <input type="hidden" value="" id="HiddenCurrentValueFormXPage" runat="server" />        
    </div>    
    </form>
</div>
<script   language="javascript" type="text/javascript" >
AjustarTamanoComponentes();
VisibilidadFormularioBusqueda();                      
</script>
</body>
<script  language="javascript" type="text/javascript" >
HidePantallaEnEspera(); 
</script>    
</html>