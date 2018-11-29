<%@ page language="VB" autoeventwireup="false" inherits="WFFormulario, App_Web_b11o5nua" validaterequest="false" maintainscrollpositiononpostback="true" enablesessionstate="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

  
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">  
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />          
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <%--<script type="text/javascript" src="./JsLibs/jquery.js"></script>--%>
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <script  type="text/javascript">
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    
     function VisibilidadTab(IdDiv)
     { 
        HiddenTabVisto=document.getElementById("HiddenINFO_TabVisible")        
        HiddenTabVisto.value=IdDiv;      
        document.getElementById("ButtonTouchedTab").click();
     }
    </script>
</head>
<body runat="server" id ="MyBody" style='width:100%; height:100%; overflow:auto;' onresize="javascript:AjustarTamanoComponentesPagina();" >

<div id="contentform" style="height:100%; " class="PWContent PWContentFormulario"> 
<style id="DynamicStyles" runat="server"></style>
<form  autocomplete="off" id="MyForm" runat="server" style="width:100%; height:100%; z-index:1;">
        <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
        <a runat="server" id="modalista" style="display:none;"></a>
        <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager> 
        <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />                
        <div runat="server" id="DivCapaOpaca" style="width:100%; position:absolute; overflow: hidden; left: 0px; top: 0px; height: 46px; display:none;" class=""></div>  
        <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>
        <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 12px; top: 352px; height: 46px; display:none;">        
        <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
        </div>    
    <table style="width:100%; clear:both;" >
    <tr runat="server" id="TRCabecera">
        <td style="width:100%" id="WFFormulario_Cabecera" class='PWcabecera_toolbar' runat="server">
        <div style="float:left; display:inline-block;" id="WFFormulario_botonesIzq">
        <asp:ImageButton CssClass ="PWIcono PWIconoAplicacion" ID="WFFormulario_GUARDARySALIR" runat="server" ImageUrl="./images/gifs16X16/apply.gif" ToolTip="Guardar y Salir" />        
        <asp:ImageButton CssClass ="PWIcono PWIconoAplicacion" ID="WFFormulario_GUARDAR" runat="server" ImageUrl="./images/gifs16X16/save.gif" ToolTip="Guardar" />
        </div>
        <span id="WFFormulario_TituloCabecera" runat="server"  style=""></span>
        <div style="float:right; display:inline-block;" id="WFFormulario_botonesDer">
        <asp:ImageButton CssClass ="PWIcono PWIconoAplicacion" ID="WFFormulario_CERRAR" runat="server" ImageUrl="./images/gifs16X16/delete.gif" ToolTip="Cerrar" OnClientClick=""/>
        </div>       
        </td>        
    </tr> 
    <tr><td runat="server" style="width:100%; overflow:visible;" id="TDFormulario" class='PWFondoFormulario'>
    <div runat="server" id="DivFormulario" class="PWFondoFormulario" style="width:100%;  ">       
    </div>
    </td></tr>   
    </table>    
    <div runat="server" id="DivCamposOcultos" style="position: absolute; top:235px; left: 24px; width: 305px; height: 59px; display:none;">    
    <input runat="server"  type="hidden" id="HiddenINFO_TabVisible" value=""/>    
    <asp:Button ID="ButtonTouchedTab" runat="server" Text="Button" style="display:none;" />    
    <asp:HiddenField ID="INFO_Tocado" runat="server" Value ="" />
    <asp:HiddenField ID="INFO_position_scroll_info" runat="server" Value ="" />  
    <input runat="server" type="hidden" id="HiddenInfo_RedimensionarIframe" value ="1" />
    <!--Indica la clave actual para identificar del formulario dinamico generado -->
    <input type="hidden" value="" id="HiddenCurrentValueFormXPage" runat="server" />    
    </div>        
   
    </form>
 </div>
</body>


<script  language="javascript" type="text/javascript" >
    popup_position_scroll_info();
    window.onscroll = popup_position_scroll_info;
</script>
</html>

