﻿<%@ page language="VB" autoeventwireup="false" inherits="WFSelectorObjetivos, App_Web_b11o5nua" maintainscrollpositiononpostback="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">        
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Selector de objetivos</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <script type="text/javascript" src="./JsLibs/JSAjustar.js"></script>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />                  
    <script type="text/javascript" language="javascript" >   
     function AjustarTamanoComponentes()
     {
     //Dimensiones referencia
        Sep=0;
        //Calcular el tamaño de la pantalla        
        W = getWidth();
        H = getHeight();
        AltoAcum=0;        
               
        //DivCabecera
        Aux_Element=document.getElementById("DivCabecera");
        Aux_Element.style.left="0px"; 
        Aux_Element.style.top="0px";
        Aux_Element.style.width="100%"; 
        AltoAcum+=Aux_Element.offsetHeight;         
              
        //DivBuscadorClientes      
        Aux_Element=document.getElementById("DivBuscadorClientes");
        Aux_Element.style.left="0px"; 
        Aux_Element.style.top=""+AltoAcum+"px";
        Aux_Element.style.width="100%"; 
        AltoAcum+=Aux_Element.offsetHeight; 
          
        //DivResultados      
        Aux_Element=document.getElementById("DivResultados");
        Aux_Element.style.left="0px"; 
        Aux_Element.style.top=""+AltoAcum+"px";
        Aux_Element.style.width="100%"; 
        Aux_Element.style.height=""+((H-AltoAcum)/2)+"px"
        AltoAcum+=Aux_Element.offsetHeight; 
        
        //DivProyectos
        Aux_Element=document.getElementById("DivProyectos");
        Aux_Element.style.left="0px"; 
        Aux_Element.style.top=""+AltoAcum+"px";
        Aux_Element.style.width="100%"; 
        Aux_Element.style.height=""+(H-AltoAcum)+"px"
        AltoAcum+=Aux_Element.offsetHeight; 
    }
     
    function CerrarVentanaModal()
    {
      AuxSwichOff=document.getElementById("SwichOff");  
      AuxSwichOff.value="1";
      ComprobarSiFinalizarDialogoModal()
    }
    
    function SeleccionarCliente(unTR)
    {
        unTR.className = " PWTableRowSelected ";
        AuxBotonSeleccionar=document.getElementById("BotonSeleccionarCliente");         
        AuxHiddenIdSeleccionado=document.getElementById("HiddenIdClienteSeleccionado");         
        AuxHiddenIdSeleccionado.value=unTR.id.replace("TRCLI","");     
        AuxBotonSeleccionar.click();
    }
    
    function SeleccionarProyecto(unTR)
    {
        unTR.className = " PWTableRowSelected ";
        AuxBotonSeleccionar=document.getElementById("BotonSeleccionarProyecto");         
        AuxHiddenIdSeleccionado=document.getElementById("HiddenIdProyectoSeleccionado");         
        AuxHiddenIdSeleccionado.value=unTR.id.replace("TRPRO","");     
        AuxBotonSeleccionar.click();
    }
            
     function ComprobarSiFinalizarDialogoModal()
     {  
        AuxSwichOff=document.getElementById("SwichOff");               
        if (AuxSwichOff.value=="1")
        {            
            AUXHiddenCampoForzarPostback=document.getElementById("HiddenCampoForzarPostback");        
            BotonPForzarPostback = parent.document.getElementById(AUXHiddenCampoForzarPostback.value);            
            BotonPForzarPostback.click();
        }
     }              
     
     </script>
</head>
<body runat="server" id="Mybody" onresize="javascript:AjustarTamanoComponentes();" style="width:100%; height:100%;">    
    <form  autocomplete="off" id="MyForm" runat="server" style="width:100%; height:100%;" >    
    <div runat="server" id="DivCabecera" class='PWcabecera_toolbar' style="width:100%; text-align:center; position: absolute;left: 0px; top: 0px;">    
        Selector de objetivos
    </div>
    <div runat="server" id="DivBuscadorClientes" class="PWFondoFormulario" style="position: absolute; left: 2px; width: 960px; top: 28px;">
    <table style="width:100%;"><tr>    
    <td style="width:2%">&nbsp;</td>
    <td style="Width:100px" align="right" ><span class="PWText2" runat="server" id="TxtRazonSocial">Razón social:&nbsp;</span></td>
    <td><input type="text" value="" runat="server" id="TextBoxBusqueda" class=" form-control PWTextBox " style="width:98%;" /></td>
     <td style="width:16px">
     <table style="Width:16px">         
     <tr><td align="center"><asp:ImageButton CssClass ="PWIcono PWIconoAplicacion" ID="ImageButtonBuscar" runat="server"  ImageUrl="~/images/gifs16X16/search.gif"/></td></tr>
     <tr><td align="center" runat="server" id="TxtBuscar">Buscar</td></tr>
     </table>
     </td>     
     <td style="width:16px">
     <table style="Width:16px">         
     <tr><td align="center"><img class="PWIcono PWIconoAplicacion" id="ImageButtonCerrar" alt="Cancelar" src="./images/gifs16X16/delete.gif"  style="cursor:pointer" onclick="javascript:CerrarVentanaModal();"/></td></tr>
     <tr><td align="center" runat="server" id="TxtCancelar" >Cancelar</td></tr>
     </table>
     </td>
     <td style="width:2%">&nbsp;</td>
     </tr>
     </table>
    </div> 
    
    <div runat="server" id="DivResultados"  class="PWFondo" style="position: absolute; left: 4px; width: 960px; top: 110px; height: 160px; overflow:auto;">          
    </div>     
    <div runat="server" id="DivProyectos"  class="PWFondo" style="position: absolute; left: 8px; width: 960px; top: 281px; height: 163px; overflow:auto;">          
    </div>     
    
     <div style="display:none">       
        <input type="hidden" id="SwichOff" value="" runat="server" />
        <input type="hidden" id="HiddenCampoForzarPostback" value="" runat="server" />
        <asp:Button ID="BotonSeleccionarCliente" runat="server" Text="" style="display:none;" />
        <asp:Button ID="BotonSeleccionarProyecto" runat="server" Text="" style="display:none;" />
        <input type="hidden" id="HiddenIdClienteSeleccionado" value="" runat="server" />  
        <input type="hidden" id="HiddenIdProyectoSeleccionado" value="" runat="server" />     
    </div>
    </form>
</body>
<script  language="javascript" type="text/javascript" >            
    ComprobarSiFinalizarDialogoModal();    
    AjustarTamanoComponentes();    
</script>
</html>
