<%@ page language="VB" autoeventwireup="false" inherits="WFConfigVisib, App_Web_b11o5nua" enableviewstatemac="true" viewstateencryptionmode="Always" validaterequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Configuración</title>            
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <script type="text/javascript" src="./JsLibs/JSAjustar.js"></script> 
    <script type="text/javascript" src="./JsLibs/JSAuxProcesos.js"></script>   
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
</head>
<body runat="server" id="MyBody">
<div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;"><!--Noscript--></div>    
<div id="content" srunat="server" tyle="visibility:visible; width:100%; height:100%; overflow:auto;">
    <style id="DynamicStyles" runat="server"></style>
    <form  autocomplete="off" id="form1" runat="server" class="PWFondo">
    <div runat="server" id="DivBloqueCabecera" style="position:fixed; top:0px; width:100%; background-color:#fff; line-height: 30px;">               
    <div runat="server" id="secciones" style="text-align:left; padding:10px 0px 10px 0px; width:100%;">
        <asp:Button ID="LBVisibilidaes" runat="server" Text="Visibilidades" CssClass="PWButton"  />        
        <asp:Button ID="LBConfiguracion" runat="server" Text="Configuración" CssClass="PWButton"  />        
        <asp:Button ID="LBOpciones" runat="server" Text="Opciones" CssClass="PWButton"  />        
        <asp:Button ID="LBSelector" runat="server" Text="Selector" CssClass="PWButton"  />                 
        &nbsp;
        <%--<input type ="button" class="PWButton" runat="server" id="LinkVolver" value="Inicio" onclick="href='./WFInicio.aspx'"  />--%>    
        <%--<asp:Button ID="ButtonGuardarCambios2" runat="server" Text="Guardar Cambios" CssClass="PWButton"  />--%>                
        <asp:Button ID="ButtonCheckBoxDesarrollo" runat="server" Text="" CssClass="PWButton" style="display:none; " />
        <span style="display:inline; white-space:nowrap; width:100px;" class="form-control PWTextBox PWTextBoxDisabled">
            <input type="checkbox" id="CheckBoxDesarrollo" runat="server" onclick ="document.getElementById('ButtonCheckBoxDesarrollo').click(); " style="vertical-align:middle;" />Repositorio PLAN
        </span>
    </div>    
    <div style="width:100%; text-align:center;" class="PWcabecera_toolbar"  >
    <span runat="server" id="TXTElmentovisible"></span>            
        <img runat="server" id="LinkVolver" alt="Inicio" onclick="href='./WFInicio.aspx'" src="./images/default/cabecera_boton_salir.png"  class="PWCabButton"  style="float:right"/>          
        <asp:ImageButton ID="BTActEstatic" runat="server" style="float:right" class="PWCabButton" />                   
        <asp:Button ID="BTEsquemaXMLHD" runat="server" Text="" style="display:none; float:right" class="PWCabButton"/>         
        <span id="BTEsquemaXMLV" runat="server" style="float:right" class="PWCabButton"/>
        <asp:ImageButton ID="WFOpcionesButtonGuardarCambios2" runat="server" style="float:right" class="PWCabButton"/>  
        <%--<asp:ImageButton ID="ButtonGuardarYSalir" runat="server" style="float:right" class="PWCabButton"/>--%>                
    </div>    
    </div>
    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0" >
    <asp:View ID="visibilidades" runat="server">    
    <table style="width:100%; margin-top:150px;"><tr><td style="width:50px; max-width:30px">&nbsp;</td>
    <td runat="server" id="DivVisibilidades" >    
    </td>    
    <td style="width:50px; max-width:30px">&nbsp;</td></tr></table>
    </asp:View>    
    <asp:View ID="Configuracion" runat="server">    
    <table style="width:100%; margin-top:150px;"><tr><td style="width:30px; max-width:50px">&nbsp;</td>
    <td runat="server" id="DivConfiguracion">           
    </td>            
    <td style="width:50px; max-width:30px">&nbsp;</td></tr></table> 
    </asp:View>
    <asp:View ID="Opciones" runat="server">        
    <table style="width:100%; margin-top:150px;"><tr><td style="width:30px; max-width:50px">&nbsp;</td>
    <td runat="server" id="TDOpciones">
    <div runat="server" id="DivOpciones" style="width:100%;" ></div>         
     <%--<asp:GridView ID="GridViewOpciones" runat="server" style="width:100%">
     </asp:GridView>--%>
        <span style="display:inline-table"><asp:TextBox ID="TxtNuevaOpcion" runat="server" MaxLength="30" style="width:500px;"></asp:TextBox><asp:Button ID="BtnAniadirOpcion" runat="server" Text="Añadir Opción" CssClass ="PWButton"  /></span>
    </td>  
    <%--<td runat="server" id="DivMail">    
     <asp:GridView ID="GridViewJMail" runat="server" style="width:100%">
        </asp:GridView>
    </td>--%>    
    <td style="width:50px; max-width:30px">&nbsp;</td></tr></table> 
    </asp:View>
    </asp:MultiView>    
       
    <div runat="server" id="DivBotones2">  
    </div>
        <div style="display:none" >
            <input type="hidden" value="" runat="server" id="infoprevent"/>
        </div>
    
    </form>
</div>
</body>
<%--<script type="text/javascript" > NoIncluirEnFrame();</script>--%>
</html>
