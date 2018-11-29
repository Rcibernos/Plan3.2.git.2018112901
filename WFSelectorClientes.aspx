<%@ page language="VB" autoeventwireup="false" inherits="WFSelectorClientes, App_Web_b11o5nua" maintainscrollpositiononpostback="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server"> 
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Selector de clientes</title>    
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <script type="text/javascript" src="./JsLibs/JSAjustar.js"></script>                  
    <script type="text/javascript" language="javascript" >
    
    var Ajustar=0;
        
     function AjustarTamanoComponentes()
     {
        if (Ajustar>3)
        {
          Ajustar=0;
          return;
        }
        Ajustar++;
        
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
        Aux_Element.style.height=""+(H-AltoAcum+16)+"px"
        AltoAcum+=Aux_Element.offsetHeight; 
        //Para ocultar el espacio que queda reservado para la barra de scroll
        //Aux_Element.style.height=""+(Aux_Element.offsetHeight+16)+"px"; 
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
        AuxBotonSeleccionar=document.getElementById("BotonSeleccionar");         
        AuxHiddenIdSeleccionado=document.getElementById("HiddenIdSeleccionado");         
        AuxHiddenIdSeleccionado.value=unTR.id.replace("TR","");     
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
    <%--<div runat="server" id="DivCabecera" class='PWCabecera' style="width:100%; text-align:center; position: absolute;left: 0px; top: 0px;">    
        Selector de clientes 
    </div>
    <div runat="server" id="DivBuscadorClientes" class="PWFondo" style="position: absolute; left: 2px; width: 960px; top: 28px;">
    <table style="width:100%;"><tr>    
    <td style="width:2%">&nbsp;</td>
    <td style="Width:100px" align="right" ><span class="PWText2" runat="server" id="TxtRazonSocial">Razón social:&nbsp;</span></td>
    <td><input type="text" value="" runat="server" id="TextBoxBusqueda" class=" form-control PWTextBox " style="width:98%;" /></td>
     <td style="width:16px">
     <table style="Width:16px">         
     <tr><td align="center"><asp:ImageButton CssClass ="PWIcono PWIconoAplicacion" ID="ImageButtonBuscar" runat="server"  ImageUrl="~/images/gifs16X16/search.gif"/></td></tr>
     <tr><td align="center" runat="server" id="TxtBuscar" >Buscar</td></tr>
     </table>
     </td>     
     <td style="width:16px">
     <table style="Width:16px">         
     <tr><td align="center"><img  class="PWIcono PWIconoAplicacion" id="ImageButtonCerrar" alt="Cancelar" src="./images/gifs16X16/delete.gif"  style="cursor:pointer" onclick="javascript:CerrarVentanaModal();"/></td></tr>
     <tr><td align="center" runat="server" id="TxtCancelar">Cancelar</td></tr>
     </table>
     </td>
     <td style="width:2%">&nbsp;</td>
     </tr>
     </table>
    </div> 
    <div runat="server" id="DivResultados" class="PWFondo" style="position: absolute; left: 4px; width: 960px; top: 110px; height: 255px; overflow:auto;">
    </div>     
    
    <div style="display:none">       
        <input type="hidden" id="SwichOff" value="" runat="server" />
        <input type="hidden" id="HiddenCampoForzarPostback" value="" runat="server" />
        <asp:Button ID="BotonSeleccionar" runat="server" Text="" style="display:none;" />
        <input type="hidden" id="HiddenIdSeleccionado" value="" runat="server" />        
    </div>--%>
    
    </form>
</body>
<script  language="javascript" type="text/javascript" >            
    ComprobarSiFinalizarDialogoModal();    
    AjustarTamanoComponentes();    
</script>
</html>
