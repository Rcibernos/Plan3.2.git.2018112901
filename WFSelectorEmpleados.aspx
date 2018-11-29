<%@ page language="VB" autoeventwireup="false" inherits="WFSelectorEmpleados, App_Web_irmiclv2" maintainscrollpositiononpostback="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<%@ Register Src="WUCTabButton.ascx" TagName="WUCTabButton" TagPrefix="uc2" %>

<%@ Register Src="WUCTabButtonNet.ascx" TagName="WUCTabButtonNet" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%;">
<head runat="server">        
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Selector de empleados</title>            
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>    
   <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%> 
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" /> 
</head>
<body runat="server" id="Mybody" onresize="javascript:AjustarTamanoComponentes();" style="width:100%; /*height:100%;*/" >    
    <style id="DynamicStyles" runat="server"></style>
    <form  autocomplete="off" id="MyForm" runat="server" style="width:100%; height:100%;   " >
    <div id="WFSelectorEmpleados_DivPrincipal" style="width:100%;">
    <table style="width:100%; border:0" id="TablaPrincipal">
    <tr style="width:100%; " class="PWcabecera_toolbar">
    <td style="text-align:center; width:25px; padding-left:5px;"><asp:Button ID="TabButtonAceptar" runat="server"  /></td>
    <td style="text-align:center; width:25px; padding-left:5px;"><asp:Button ID="TabButtonMiArea" runat="server"  /></td>
    <td style="text-align:center; width:25px; padding-left:5px;"><asp:Button ID="TabButtonBuscar" runat="server" /></td>    
    <td style="text-align:center; width:25px; padding-left:5px;"><asp:Button ID="TabButtonMisGrupos" runat="server" /></td>
    <td colspan="2" runat="server" id="DivCabecera" class="PWcabecera_toolbar" style="width:100%; text-align:center; height: 26px;">    
        Selector de empleados    
    </td> 
    <td style="text-align:center; width:75px; padding-left:5px;"></td>   
    <td style="text-align:center; width:25px; padding-right:10px;"><span ><a id="TabButtonCancelar" runat="server"></a></span></td>
    </tr>     
    </table>   
        
    <table style="width:100%; border:0;" id="TablaSeleccion">        
    <tr style="height:30px; min-height:30px; height:50px;">
    <td colspan="2" runat="server" id="DivEmpleadoSeleccion" class="PWCajaFormulario" style="">     
    <table style="width:100%; border:0;" ><tr>    
    <td>
    <div runat="server" id="WFSelectorEmpleados_EmpleadoSeleccionado" style="width:100%;" class="PWText3"></div></td>    
    <td style="text-align:right;" >   
    <span runat="server" id="WFSelectorEmpleados_SpanExEmpleados" style="white-space:nowrap;">
    <asp:CheckBox ID="CheckBoxExempleados" runat="server" AutoPostBack="True" />
    <img class="" alt="Mostrar Exempleados" title="Mostrar Exempleados" src="./images/default/vacio.png" runat="server" id="WFSelectorEmpleados_ImgMostrarExEmpleados"/>
    <span runat="server" id="WFSelectorEmpleados_TxtMostrarExEmpleados"></span>
    </span>     
    </td>     
    </tr></table>    
    </td></tr>
    </table>    
    </div>
    <table style="width:100%; border:0;" id="WFSelectorEmpleados_TableContenido">
    <tr id="TRExpandible"  style="vertical-align:top;">
    <td style="width:30%; max-width:30%; min-width:30%;" class="PWFondoArbol" >
    <asp:MultiView ID="MultiViewSelectorEmpleados" runat="server">
        <!-- Arbol de Areas-->
        <asp:View ID="ViewTreeViewAreas" runat="server">
        <div runat="server" id="DivTreeViewAreas" class="PWFondoArbol" style="height:100%;">
        <asp:TreeView ID="TreeViewAreas" runat="server" Height="100%" Width="100%" ImageSet="Simple"
                NodeIndent="10" style="display:inline; height:100%; " LineImagesFolder="~/images/PrimerVistazo" ShowLines="True">
                <ParentNodeStyle Font-Bold="False" />
                <HoverNodeStyle CssClass="PWTextArbolHover"  />
                <SelectedNodeStyle Font-Underline="False" HorizontalPadding="0px"
            VerticalPadding="0px" CssClass="PWTextArbolSelected" />
                <NodeStyle HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" CssClass="PWTextArbol"  />
        </asp:TreeView>
        </div>    
        </asp:View>
        
        <!-- Buscar -->
        <asp:View ID="ViewBuscar" runat="server">
        <div runat="server" id="WFSelectorEmpleados_DivBuscarDialog" class="PWFondo" style="">                                       
            <div runat="server" id="TxtBuscarPor" style="">Buscar por nombre, apellidos, puesto o DNI</div>
            <asp:TextBox ID="TextBoxBuscarDialog" runat="server" CssClass=" form-control PWTextBox " style=""></asp:TextBox>
            <div  id="DivBtnBuscar" style="">            
            <span class="PWButton" runat="server" id="BtnBuscar" style="">
            <img src="./images/default/vacio.png" alt="buscar" runat="server" id="ImgButtonAceptarBusqueda"/><span runat="server" id="TxtButtonAceptarBusqueda" >Buscar</span></span>            
            <asp:Button ID="HdnButtonAceptarBusqueda" runat="server"  style="display:none" />
            </div>                                       
        </div>      
        </asp:View>
        
        <!-- Gestión de grupos -->
        <asp:View ID="ViewGestionDeGrupos" runat="server">
            <div runat="server" id="WFSelectorEmpleados_DivGestionGrupos" class="PWFondo" style="">                    
            <span runat="server" style="" id="TxtGrupos">Grupos</span><br />
            <ul runat="server" id="GestionGrupos_Lista" style="">          
            </ul>
            <div  id="DivBtnEliminarGrupo" style="">            
                <span class="PWButton" runat="server" id="BtnEliminarGrupo" style="">
                <img src="./images/default/vacio.png" alt="Eliminar Grupo" runat="server" id="ImgButtonEliminarGrupo"/>
                <span runat="server" id="TxtButtonEliminarBusqueda" >Buscar</span></span>            
                <asp:Button ID="HdnButtonEliminarGrupo" runat="server"  style="display:none" />
                <input type="hidden" id="HiddenGrupoSeleccionado" runat="server" />
                <input type="hidden" id="HiddenNombreGrupoSeleccionado" runat="server" />
            </div>      
            <div runat="server" id="DivAgregarSacarDeGrupos">
                <div runat="server" id="TextoAgregarAGrupo" style=""></div>
                <select id="DropDownListGrupos" runat="server" class=" form-control PWTextBox " onchange="UnGruposeleccionado(this);"></select>
                
                <div>
                <span class="PWButton" runat="server" id="BtnAniadirAlGrupo" style="">
                <asp:Button ID="ButtonAniadirAlGrupo" runat="server" ToolTip="Añadir al grupo"   />
                </span>                            
                
                <span class="PWButton" runat="server" id="BtnSacarDelGrupo" style="">
                <asp:Button ID="ButtonSacarDelGrupo" runat="server" ToolTip="Sacar del Grupo"  />
                </span>                            
                </div>

                <input type="hidden" id="HiddenDropDownListGruposSelected" runat="server" />                                    
            </div>  
            <div runat="server" id="DivNuevoGrupo">
             <div runat="server" id="TXTNombreGrupo" style=""></div>
             <asp:TextBox ID="TextBoxNombreNuevoGrupo" runat="server" />
              <span class="PWButton" runat="server" id="BtnNuevoGrupo" style="">
                <img src="./images/default/vacio.png" alt="Nuevo grupo" runat="server" id="ImgNuevoGrupo"/>
                <span runat="server" id="TxtButtonNuevoGrupo" >Nuevo grupo</span></span>  
                 <asp:Button ID="HdnButtonNuevoGrupo" runat="server"  style="display:none" />
            </div>                 
          
        </div>
        </asp:View>
    </asp:MultiView>  
    
    
    </td>
    <td runat="server" id="DivListaResultados" class="PWFondo" style="width:70%; max-width:70%; min-width:70%; height:50px; "></td>
    </tr>
    </table>       
    <div style="display:none">       
        <input type="hidden" id="SwichOff" value="" runat="server" />
        <input type="hidden" id="HiddenCampoForzarPostback" value="" runat="server" />
        <asp:Button ID="BotonSeleccionar" runat="server" Text="" style="display:none;" />
        <input type="hidden" id="HiddenIdSeleccionado" value="" runat="server" />
        <input type="hidden" id="HiddenElementoVisible" value="" runat="server" />
    </div>    
    </form>
</body>
<script   type="text/javascript" >    
    ComprobarSiFinalizarDialogoModal();
    //MostrarElementoOcultarResto(document.getElementById("HiddenElementoVisible").value);    
    AjustarTamanoComponentes();    
</script>
</html>
