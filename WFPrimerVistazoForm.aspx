<%@ page language="VB" autoeventwireup="false" inherits="WFPrimerVistazoForm, App_Web_g53dfrix" maintainscrollpositiononpostback="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>
<%@ Register Src="WUCMiniTabButton.ascx" TagName="WUCMiniTabButton" TagPrefix="uc4" %>
<%@ Register Src="WUCTabButton.ascx" TagName="WUCTabButton" TagPrefix="uc2" %>
<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Primer vistazo</title>           
    <script type="text/javascript" src="JsLibs/JSMovArbol.js"></script>    
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>    
</head>
<body runat="server" id="MyBody" class="PWFondo" onresize="javascript:AjustarTamanoComponentes(true);" style=" margin:0px; width:100%; height:100%; overflow:visible;"   >   
<div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;"><!--Noscript--></div>
<div id="content" runat="server" style="visibility:visible; height:100%; overflow:visible;">
    <style id="DynamicStyles" runat="server"></style>
    <form  autocomplete="off" id="form1" runat="server" style="overflow:visible;">
    <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager> 
    <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />    
    <div runat="server" id="DivCapaOpaca" style="width:100%; position:absolute; overflow: hidden; left: 0px; top: 0px; height: 20px; display:none;" class=""></div>          
    <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>            
    <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 11px; top: 372px; height: 46px; display:none;">        
        <!--<img class="PWSobreCapaRecarga" runat="server" id="ImgCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
    </div>              
    <div id="BRRR" style="position:absolute; z-index:10; background-color:Red; width:2px; max-width :3px; min-width :3px; display:none; " 
    onmouseup="javascript:ResEnd(event,'TabTreeviewAndIframe','TDTreeView','TDIframe','TDBarraExpandir','BRRR');" onmouseout="javascript:ResEndx(event,'TabTreeviewAndIframe','TDTreeView','TDIframe','TDBarraExpandir','BRRR');"   >
    </div>    
    <div runat="server" id="DivCabecera" >   
            <%--<uc5:WUCCabeceraPrincipal2 ID="BarraPrincipal" runat="server" TabSeleccionado="PrimerVistazo" />--%>            
            <uc1:WUCCabeceraPrincipal3 ID="BarraPrincipal" runat="server" TabSeleccionado="PrimerVistazo"/>
    </div>  
    <div id="WFPrimervistazoForm_Body">
    <table id="TabTreeviewAndIframe" style="" >
    <tr style="height:100%; vertical-align:top" >    
    <td id="TDTreeView" runat="server" 
      style="display:inline;" 
      class="PWFondoArbol" >
    <div id="DivTreeView" style=""  >     
   
    <div style="width:100%; text-align:right; white-space:nowrap;" runat="server" id="DivSelectFiltroXUsuario" class="PWCabecera_toolbarArbol">
            <asp:DropDownList ID="SelectFiltroXUsuario" runat="server" AutoPostBack="True" CssClass=" form-control PWTextBox " style="width:100%">
            </asp:DropDownList>
     </div>
     <div id="DivArbol" runat="server" style="overflow:visible; width:100%; height:100%; border:0px; vertical-align:top;" class="PWCajaArbol" onscroll="javascript:MantenerScrollPosition(this);">          
     </div>        
   </div>   
   </td>  
   <td id="TDBarraExpandir" runat="server" style="" class="PWBarraArbol" onclick="javascript:OcultarArbol(); Ajustada=0; AjustarTamanoComponentes(false);">
   <div runat="server" id="SpanSimboloExpand" class="" ></div>
   </td>        
   <td style="" 
       id="TDIframe" runat="server" >
        <iframe runat="server" id="iframeListaActiv"  src="./WFVacia.aspx" 
         scrolling="no" style="border:0px; width:100%; height:100%; overflow:visible; position:absolute;" frameBorder="0"></iframe>
    </td></tr></table>
    </div>     
    
    <div style="display:none;" id="DivZonaControlesOcultos" runat="server">
    <input type="button" style="display:none;" id="HiddenDimensionButtonOf_iframeListaActiv" onclick="javascript:CambiaTamanoIframe();";/>
    <input type="hidden" value="" id="MyCalculateHeight" /> 
    <input type ="hidden" id="INFO_TREEVIEW_SCROLL_MODE" value="0" runat="server"/>
    <input type ="hidden" id="INFO_SCROLL_POSITION" value="0" runat="server"/> 
    <input type="hidden" value="" id="MyIframeContentHeight" />
    <input type="hidden" value="" id="MyIframeContentWidth" />      
    <asp:Button ID="HiddenSelector" runat="server" Text="" style="display:none;" />     
    <input type="Hidden" value="" id="HiddenSelected" runat="server" />
    <asp:HiddenField ID="INFO_Tocado" runat="server" Value="0" />
    <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div>
    </div>        
    </form>   
</div>
   
    
   
</body>
<%--<script  language="javascript" type="text/javascript" > NoIncluirEnFrame();</script>--%>
<script type="text/javascript" >
    AjustarTamanoComponentes(true);    
</script>
<script type="text/javascript" >    
</script>
<script type="text/javascript">   
</script>
</html>

