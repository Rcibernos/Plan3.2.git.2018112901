<%@ page language="VB" autoeventwireup="false" inherits="clientes_REE_ReeGestionDeUsuarios, App_Web_wtmsna5m" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Usuarios</title>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="../../Css/default.css" />
    <%--<link href="../../JsLibs/calendar/temporadas.css" rel="stylesheet" type="text/css" />--%>    
    <%--<link href="../../JsLibs/calendar/aqua.css" rel="stylesheet" type="text/css" />--%>      
    <script type="text/javascript" src="../../JsLibs/JSAjustar.js"></script>       
    <script type="text/javascript" src="../../JsLibs/JSAuxProcesos.js"></script> 
    <%--<script type="text/javascript" src="../../JsLibs/calendar/utils.js"></script>--%>
    <%--<script type="text/javascript" src="../../JsLibs/calendar/calendar.js"></script>--%>
    <%--<script type="text/javascript" src="../../JsLibs/calendar/calendar-setup.js"></script>--%>
    <%--<script type="text/javascript" src="../../JsLibs/calendar/calendar-sp.js"></script>--%> 
    <script type="text/javascript" src="../../JsLibs/Paginas/JSProceso.js"></script>    
    <%--<script type="text/javascript" src="../../JsLibs/floating/floating-1.7.js"></script>--%>            
</head>
<body runat="server" id="MyBody">
    <form  autocomplete="off" id="form1" runat="server">
    <div > 
    <table style="width:100%;">
    <tr><td colspan="3" style="height:50px; text-align:center"><span class="PWText3" runat="server" id="SpanTitulo"></span></td></tr>
    <tr id="TRnombreUsuario" runat="server">
    <td style="width: 30px; max-width:30px;"></td>
    <td  style="width: 60px; max-width:60px;"><span class="PWlabel">C&oacute;digo</span></td>
    <td style="height: 19px" >
    <%--<input runat="server" />--%>    
    <input type="text" id="nombreUsuario" value="" class="PWTextBoxDisabled" readonly="readonly" runat="server"/>&nbsp;
    </td></tr>
    <tr  id="TRdescripcionUsuario" runat="server">
    <td ></td>
    <td class="PWlabel"><span class="PWlabel">Nombre</span></td>
    <td >
    <input type="text" id="descripcionUsuario" value="" class="PWTextBoxDisabled" readonly="readonly"  runat="server" style="width: 430px"/>
    </td></tr>
    <tr><td colspan="3" style="height:50px;"></td></tr>
    <tr><td colspan="3" style="height:50px;">
    <div runat="server" id="resultadoLlamada" style="width:100%; height:127px; text-align:center;" class="PWTexto1">        
    </div>  
    </td></tr>
    <tr><td colspan="3">    
    
    <asp:Button ID="ButtonNuevo" runat="server" Text="Nueva alta" cssclass="PWButton" style="width:150px !important; display:inline" /> 
    <asp:Button ID="ButtonAceptar" runat="server" Text="Aceptar" cssclass="PWButton" style="width:150px !important; display:inline" />           
    <asp:Button ID="ButtonBorrar" runat="server" Text="Dar De Baja" cssclass="PWButton" style="width:150px !important; display:inline" />       
    <input id="ButtonSeleccionarUsuario" type="button" value="Seleccionar usuario" class="PWButton" style="width:150px !important; display:inline" runat="server" />         
    </td></tr>    
    
    </table> <br />
    
    </div>
    </form>
</body>
<script type="text/javascript">
/*
Timer=setTimeout(Doit,1000)

 function Doit()
 {
   document.forms[0].nombreusuarioAux.value=document.forms[0].nombreusuario.value; 
   Timer=setTimeout(Doit,1000);
 }
*/ 
 
</script>
</html>
