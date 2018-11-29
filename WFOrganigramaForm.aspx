<%@ page language="VB" autoeventwireup="false" inherits="WFOrganigramaForm, App_Web_irmiclv2" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">    
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Organigrama</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>    
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> 
    <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
</head>
<body runat="server" id="MyBody" class="PWFondo" onresize="javascript:AjustarCapas();" style=" margin:0px; width:100%; height:100%;">   
<div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;"> <!--Noscript--></div>        
<div id="content" runat="server" style="visibility:Visible; height:100%; overflow:auto;">
    <form  autocomplete="off" id="form1" runat="server" style='margin:0px; width:100%; height:100%;' >
    <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
    <a runat="server" id="modalista" style="display:none;"></a>
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>     
    <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />
    <div runat="server" id="DivCapaOpaca" style="width:100%; position:absolute; overflow: hidden; left: 0px; top: 0px; height: 20px; display:none;" class=""></div>          
    <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>        
    <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 16px; top: 454px; height: 46px; display:none;">        
        <!-- <img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
    </div>     
     <div runat="server" id="DivCabecera" >    
     <uc1:WUCCabeceraPrincipal3 ID="BarraPrincipal" runat="server"  TabSeleccionado="Organigrama" />     
    </div>    
    <table id="TabTreeviewAndIframe" style=""><tr  style="height:100%; " >    
    <td id="TDTreeView" runat="server" style="width:20%; min-width:200px; height:100%; min-height:600px; display:inline;" class="PWFondoArbol" >    
    <!-- TABLA FILTROS -->
             <%--<table border="0" style="display:inline; width:100%;" runat="server" id="TabButonFiltros" class="PWcabecera_toolbar">
             <tr><td align="left"><span class="PWText1" runat="server" id="txtFiltro">Filtro</span></td></tr>
             <tr><td align="left">
                 <asp:DropDownList ID="DropDownListFiltro" runat="server" CssClass=" form-control PWTextBox " style="max-width:100px; width:100px;" AutoPostBack="True">
                 </asp:DropDownList>                 
                 </td></tr>
             </table>--%>
        <div style="width:100%; text-align:right; white-space:nowrap;" runat="server" id="DivSelectFiltro" class="PWCabecera_toolbarArbol">
            <asp:DropDownList ID="DropDownListFiltro" runat="server" CssClass=" form-control PWTextBox " style="min-width:100px; width:100%;" AutoPostBack="True">
            </asp:DropDownList>   
        </div>
        <!-- Arbol -->        
        <div id="DivArbol" style="overflow:visible; width:100%; height:100%; border:0px; vertical-align:top;" class="PWCajaArbol" onscroll="javascript:MantenerScrollPosition(this);">
        <asp:TreeView ID="Arbol" runat="server" 
            NodeIndent="10" BorderWidth="0px" 
                style="display:inline; overflow:auto; width:100%; height:100%; border:0px;" 
                LineImagesFolder="~/images/PrimerVistazo" ShowLines="True">
            <ParentNodeStyle Font-Bold="False" />
            <HoverNodeStyle CssClass="PWTextArbolHover"  />
           <SelectedNodeStyle Font-Underline="False" HorizontalPadding="0px"
            VerticalPadding="0px" CssClass="PWTextArbolSelected" />
            <NodeStyle HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" CssClass="PWTextArbol"  />
          </asp:TreeView>           
          </div>
    </td>
    <td id="TDBarraExpandir" runat="server" style="width:16px; max-width:16px; min-width:16px; cursor:pointer;" class="PWBarraArbol" onclick="javascript:OcultarArbol();">
    <div runat="server" id="SpanSimboloExpand"></div>
   </td>    
   <td style="width:80%; " id="TDIframe" runat="server" class="PWFondoFormulario" >
    <div runat="server" id="DivFormulario"  class="PWFondoFormulario">        
    </div>
   </td></tr>
   <tr><td colspan="3"></td></tr>
   </table>         
    <div id="DIVCamposOcultos"  style="display:none;">
    <!-- Guarda El estado del Arbol -->
    <input type ="hidden" id="INFO_ESTADO_TREEVIEW" value="block" runat="server"/>
    <input type ="hidden" id="INFO_TREEVIEW_SCROLL_MODE" value="0" runat="server"/>
    <input type ="hidden" id="INFO_SCROLL_POSITION" value="0" runat="server"/>
    <asp:HiddenField ID="INFO_Tocado" runat="server" Value="0" />
    <asp:HiddenField ID="INFO_position_scroll_info" runat="server" Value ="" />
    <!--Indica la clave actual para identificar del formulario dinamico generado -->
    <input type="hidden" value="" id="HiddenCurrentValueFormXPage" runat="server" /> 
    <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div>     
    </div>   
    </form>    
</div>
</body>
<%--<script  type="text/javascript" >NoIncluirEnFrame();</script>--%>
<script   type="text/javascript" >
    //AjustarTamanoComponentes();
    AjustarCapas();
</script>
<script   type="text/javascript" >
    ArbolSegunEstado();
</script>
<script   type="text/javascript" >
    window.onscroll = popup_position_scroll_info;
</script>
</html>
