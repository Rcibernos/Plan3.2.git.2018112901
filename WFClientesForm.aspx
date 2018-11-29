<%@ page language="VB" autoeventwireup="false" inherits="WFClientesForm, App_Web_b11o5nua" maintainscrollpositiononpostback="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Clientes</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <script type="text/javascript" src="./JsLibs/JSAjustar.js"></script>       
    <script type="text/javascript" src="./JsLibs/JSAuxProcesos.js"></script>
    <script type="text/javascript" src="JsLibs/Paginas/JSClientesForm.js"></script>
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/> --%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
</head>
<body runat="server" id="MyBody" class="PWFondo" onresize="javascript:AjustarTamanoComponentes();" style=" margin:0px; width:100%; height:100%;">  
    
    <form  autocomplete="off" id="form1" runat="server" style='width:100%; height:100%;' >     
    <%--<input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />
    <div runat="server" id="DivCapaOpaca" class="" style=" z-index:200;  vertical-align:middle; text-align:center; position:absolute; overflow: hidden; left: 19px; top: 388px; height: 48px; display:none; width: 346px;"></div>  
    <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>
     <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 16px; top: 454px; height: 46px; display:none;">        
         <img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        
    </div>     
    <script  language="javascript" type="text/javascript" > ShowPantallaEnEspera(); </script>    
    <div runat="server" id="DivCabecera" class='PWCabecera' style="width:53%; text-align:center; position: absolute; left: 8px; top: 4px;">Clientes</div>
    <div runat="server" id="DivBarra" class='PWCaja3' style="width:54%; position: absolute; left: 0px; top: 28px;">
    <table width="100%" ><tr>
    <td class='PWCaja2' >
          <uc1:WUCBarraPrincipal ID="BarraPrincipal" runat="server" Modo="Clientes"   />             
    </td>
    <td></td>
    <td>
    <table style="width:100%;">
         <tr>         
         <td style=" max-width:50px; min-width:24px;  width:50px;">&nbsp;</td>
         <td style="text-align:center;"><span class="PWText3"><% Response.Write(Me.NombreCliente)%></span></td>
         <td style=" max-width:50px; min-width:24px;  width:50px;">&nbsp;</td>
         </tr>
         </table>
    </td>    
    </tr>
    </table>
    </div>
    <div runat="server" id="DivTreeView" style="left: 0px; top:67px; position:absolute;  overflow: hidden; width:214px; height: 267px;" class="PWFondo">                 
        <div runat="server" id="DivBuscador" style="width:100%" class="PWFondoFormulario">
        <table>
        <tr>
            <td><asp:TextBox ID="TextBoxBusqueda" runat="server"></asp:TextBox></td>
            <td><asp:ImageButton CssClass ="PWIcono PWIconoAplicacion" ID="ImageButtonBusqueda" runat="server" ImageUrl="./images/gifs16X16/search.gif"  /></td>            
        </tr>            
        </table>
        </div>
        <div runat="server" id="DivArbol" class="PWFondo" >       
       </div>
    </div>
    <div runat="server" id="DivForm"  style="position: absolute; top: 71px; left:220px; border:1px; overflow:auto; width: 432px; height: 260px;" class="PWFondoFormulario"></div>    
    <div runat="server" id="DivZonaControlesOcultos" style="display:none;">
        <asp:Button ID="Button_SeleccionDeCliente" runat="server" Text="" style="display:none;"/>
        <input type="hidden" id="INFO_SeleccionDeCliente" runat="server" value="" />
    </div>--%>
    
    </form>
</body>
<script  language="javascript" type="text/javascript" > AjustarTamanoComponentes(); </script>
<script  language="javascript" type="text/javascript" >HidePantallaEnEspera(); </script>    
</html>