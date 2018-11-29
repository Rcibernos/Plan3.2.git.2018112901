<%@ page language="VB" autoeventwireup="false" inherits="WFSelectorProcesos, App_Web_b11o5nua" maintainscrollpositiononpostback="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server"> 
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Selector de Procesos</title>
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <script type="text/javascript" language="javascript" >
    function SelectorProcesos_Seleccionar(unTR)
    {
        unTR.className = " PWTableRowSelected ";
        location.href="./WFProceso.aspx?Id=0&TA=5&TP=" + unTR.id.replace("TRSelectorProcesos","");
    }    
    </script>
        
</head>
<body runat="server" id ="MyBody" style='width:98%; height:100%;'>
    <form  autocomplete="off" id="form1" runat="server" style="height:100%;">
    <div runat="server" id="DivSelectorProcesosCabecera" class='PWcabecera_toolbar' style='width:100%; text-align:center; left: 0px; top:0px;'>Selector de Procesos</div>    
    <div runat="server" id="DivSelectorProcesosPrincipal" class="PWFondo" style="width:100%; left: 0px; top: 41px;">
    <table style="width:100%; height:400px;" border="0" id="TableSelectorProcesosPrincipal" >
    <tr><td style="width:2%;">&nbsp;</td>
        <td valign="middle" align="left" style="width:78%; min-width:100px">           
           <input id="TextSelectorProcesosFiltrar" type="text" runat="server" class=" form-control PWTextBox " maxlength="200" style="width:98%;"/>
        </td>
        <td style="width:10%; max-width:50px"><table border="0" >
             <tr><td align="center">
                 <asp:ImageButton CssClass ="PWIcono PWIconoAplicacion" ID="ButtonSelectorProcesosBuscar" runat="server" ImageUrl="~/images/gifs16X16/search.gif"  /></td></tr>
             <tr><td align="center"><span class="PWText1" runat="server" id="TxtBuscar">Buscar</span></td></tr>
             </table></td> 
             
        <td style="width:10%; max-width:50px;" valign="middle" align="center" > 
        <table border="0" >
             <tr><td align="center">
                 <img  class="PWIcono PWIconoAplicacion" id="ButtonSelectorProcesosCancelar" alt="Cancelar" src="./images/gifs16X16/delete.gif" style="cursor:pointer;" onclick="javascript:window.close();"/>
                 </td></tr>
             <tr><td align="center"><span class="PWText1" runat="server" id="TxtCancelar">Cancelar</span></td></tr>
         </table>               
        </td>        
    <td style="width:2%;">&nbsp;</td></tr>
    <tr style="height:350px;"><td >&nbsp;</td>
        <td valign="top" colspan="3">
        <div id="DivSelectorProcesosTabla" runat="server" style="height:350px; width:100%; overflow:scroll; vertical-align:top; " class="PWFondo"></div>
        </td>        
    <td >&nbsp;</td></tr>
    <tr><td colspan="4">&nbsp;</td></tr>    
    </table>
    </div>
    <%--<input type ="hidden" id="HiddenSelected" value ="" runat ="server"  />--%>
    </form>
</body>
</html>
