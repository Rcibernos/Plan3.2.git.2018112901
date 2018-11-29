<%@ page language="VB" autoeventwireup="false" inherits="WFEstructuraForm, App_Web_irmiclv2" maintainscrollpositiononpostback="true" validaterequest="false" enablesessionstate="true" enableviewstate="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Src="WUCTabButtonNet.ascx" TagName="WUCTabButtonNet" TagPrefix="uc2" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc3" %>
<%@ Register src="WUCMiniTabbuttonNet.ascx" tagname="WUCMiniTabbuttonNet" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Estructura</title>        
    <%--favicon--%>    
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>    
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script> 
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    
    <%--<link rel="stylesheet" href="JsLibs/modal/jquery-modal.css" />--%>  
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    
</head>
<body runat="server" id="MyBody" class="PWFondo" onresize="javascript:AjustarCapas();" style=" margin:0px; width:100%; height:99%;">   

<div id="errnoscript"  runat="server" style="width:100%; text-align:center; visibility:hidden">        
  <!--Noscript-->        
</div>    
<div id="content"  runat="server" style="visibility:visible; height:100%; " class="PWContent PWContentRepositorioForm">
    <style id="DynamicStyles" runat="server"></style>
    <form  autocomplete="off" id="form1" runat="server" style='margin:0px; width:100%; height:100%;' >
    <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
    <a runat="server" id="modalista" style="display:none;"></a>
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>     
    <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />
    <div runat="server" id="DivCapaOpaca" style="width:100%; position:absolute; overflow: hidden; left: 0px; top: 0px; height: 20px; display:none;" class=""></div>          
    <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>            
    <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 16px; top: 454px; height: 46px; display:none;">        
         <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>-->
    </div>     
    <div runat="server" id="DivCabecera" class='PWCabecera'>    
     <%--<uc5:WUCCabeceraPrincipal2 ID="BarraPrincipal" runat="server" TabSeleccionado="" />--%>
     <uc3:WUCCabeceraPrincipal3 ID="BarraPrincipal" runat="server" />
    </div>   
    <div id="WFRepositorioform_Body">
    <table id="WFRepositorioform_Tabla" style="" >
    <tr style="vertical-align:top;">
    <td id="TDTreeView" runat="server" style=" display:none; " class="PWFondoArbol">           
    <div id="DivArbol" runat="server" style="" class="PWCajaArbol" onscroll="javascript:MantenerScrollPosition(this);">           
    </div>              
   </td>
   <td id="TDBarraExpandir" runat="server" style="" class="PWBarraArbol" onclick="javascript:OcultarArbol();">
    <div runat="server" id="SpanSimboloExpand" class="" ></div>
   </td>
   <td style="" id="TDIframe" runat="server" class="PWFondo"> 
   <table style="width:100%"  >     
    <tr>
    <td style="" id="TDRepositoriofomr_Formulario">
    <div runat="server" id="DivFormulario"  class="PWFondoFormulario" >        
    </div>
   </td>
    </tr>
   </table>
   </td>
   <td id="WFRepositorioform_Resto"></td>
   </tr>
   <tr><td colspan="3"></td></tr>
   </table>  
   </div>        
    <div id="DIVCamposOcultos" style="display:none;">
    <!-- Guarda El estado del Arbol -->
    <input type ="hidden" id="INFO_ESTADO_TREEVIEW" value="inline" runat="server"/>
    <input type ="hidden" id="INFO_TREEVIEW_SCROLL_MODE" value="0" runat="server"/>
    <input type ="hidden" id="INFO_SCROLL_POSITION" value="0" runat="server"/>    
    <asp:HiddenField ID="INFO_Tocado" runat="server" Value="0" />
    <asp:HiddenField ID="INFO_position_scroll_info" runat="server" Value ="" />  
    <!--Indica la clave actual para identificar del formulario dinamico generado -->
    <input type="hidden" value="" id="HiddenCurrentValueFormXPage" runat="server" />                
    <asp:Button ID="HiddenSelector" runat="server" Text="" style="display:none;" />     
    <input type="Hidden" value="" id="HiddenSelected" runat="server" />   
    <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div>             
    </div>   
    </form> 
</div>   
    
    
    
</body>
<%--<script  language="javascript" type="text/javascript" >NoIncluirEnFrame();</script>--%>
<script type="text/javascript" >
    //AjustarTamanoComponentes();
    AjustarCapas();
</script>
<script  type="text/javascript" >
    ArbolSegunEstado();    
</script>
<script type="text/javascript" >
    PosicionarScroll();      
</script>
<script type="text/javascript" >
    window.onscroll = popup_position_scroll_info;

</script>
</html>
