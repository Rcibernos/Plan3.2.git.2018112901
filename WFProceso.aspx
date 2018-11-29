<%@ page language="VB" autoeventwireup="false" maintainscrollpositiononpostback="true" inherits="WFProceso, App_Web_irmiclv2" validaterequest="false" enablesessionstate="true" enableviewstate="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="WUCMiniTabButtonNet.ascx" TagName="WUCMiniTabButtonNet" TagPrefix="uc6" %>
<%@ Register Src="WUCTabButton.ascx" TagName="WUCTabButton" TagPrefix="uc2" %>
<%@ Register src="WUCFirma.ascx" tagname="WUCFirma" tagprefix="uc7" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc8" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>
<%@ Register Src="WUCTabButtonNet.ascx" TagName="WUCTabButtonNet" TagPrefix="uc3" %>
<%--<%@ Register Src="WUCNuevaActividad.ascx" TagName="WUCNuevaActividad" TagPrefix="uc4" %>--%>
<%@ Register Src="WUCResponder.ascx" TagName="WUCResponder" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title><% Response.Write(IIf(pApp = "", "", pApp & "/") & pTituloPagina_)%></title>
    <style type="text/css"> .ajax__calendar_container { z-index : 1000 ; } </style>                 
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
     <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>   
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script>    
    <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>         
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />    
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>    
</head>
<body runat="server" id ="MyBody" style='margin:0px; width:100%; height:99%;' 
 onresize="javascript:AjustarCapas();" > 
<div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;"><!--Noscript--></div>
<div id="content" runat="server" style="visibility:visible;  height:100%; " class="PWContent PWContentProceso">
<style id="DynamicStyles" runat="server"></style>
<form autocomplete="off" id="MyForm" runat="server" style='width:100%; height:100%; z-index:1;'  >  
<div runat="server" id="ScriptsCabecera" style="display:none;"></div>
        <a runat="server" id="modalista" style="display:none;"></a>
        <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="false"></asp:ScriptManager> 
        <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />
        <div runat="server" id="DivCapaOpaca" class="" style="width:344px; position:absolute;  z-index:100; overflow: hidden; left: 0px; top: 0px; height: 46px; display:none;"></div>          
        <div runat="server" id="DivCapaModal" style="position:absolute; z-index:301; display:none; " class="PWFondoFormulario"></div>            
        <div runat="server" id="DivCapaRecarga" class="" style="width:100%; position:absolute; z-index:302; overflow: hidden; left: 0px; top: 0px; height: 100%; display:none;">        
        <%--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:303; display:none;" alt="Espere"/>--%>        
        </div>        
        <div runat="server" id="DivCapaMensaje" class="PWMensajeAlert" style="display:none; left: 12px; top: 452px; position:absolute; z-index:301;" >        
        <table >
        <tr><td colspan="3" style="text-align:right;">&nbsp;<img runat="server" id="DivCapaMensaje_ImgCerrar" class="PWIcono PWIconoAplicacion" alt="Cerrar" src="images/gifs16X16/delete.gif" style="cursor:pointer;" onclick="javascript:OcultarCapaMensaje();" /></td></tr>
        <tr><td style="max-width:16px; min-width:16px; width:16px;">&nbsp;</td><td id="DivCapaMensaje_TDMensaje" runat="server" class="PWText2"></td><td style="max-width:16px; min-width:16px; width:16px;"> &nbsp;</td></tr>
        <tr style="height:24px; max-height:24px; min-height:24px;" ><td colspan="3" >&nbsp;</td></tr>
        </table>        
        </div>   
        <div runat="server" id="DivResponder" style="position:absolute; z-index:201; display:none; " class="PWFondoFormulario">                    
        <uc1:WUCResponder ID="WUCResponderActividad" runat="server"/>
        </div>
        <div runat="server" id="DivFirma" style="z-index:201; display:none; min-width:500px; min-height:500px; width:800px;" class="PWFondoFormulario">                    
        <uc7:WUCFirma ID="WUCFirmaDocumentos" runat="server"  style="width:800px; height:100%;"/>
        </div>  
    <div runat="server" id="DivCabecera1" >
    <uc8:WUCCabeceraPrincipal3 ID="BarraPrincipal" runat="server" TabSeleccionado=""/> 
    </div>
   <div runat="server" id="DivToolBar" style=" clear:both; " >       
        <div id="terceraBarra" runat="server" class="">         
            <div class="" runat="server" id="bloque_proceso_secciones">           
    	       <ul id="menu_proceso_secciones" runat="server" class="nav navbar-nav itemMenuPlan">
                    <li id="btn_bifurcaciones" class="btn-menu" runat="server"></li>
                    <!-- Secciones -->
               </ul>
             </div>    
        </div>
        <div id="cuartaBarra"  runat="server" class="" style="display:none;">
	        <div id="esconder" runat="server">
              <ul id="menu_proceso_bifurcaciones" class="NO_nav NO_navbar-nav itemMenuPlan" runat="server">
                <%--Bifurcaciones--%>
              </ul>          
              <div class="nav navbar-nav pull-right">
                 <div id="PWProceso_chincheta" runat="server" >
                   <input type="checkbox" runat="server" name="onoffswitch" id="menu_proceso_bifurcaciones_onoffswitch" checked="false" style="display:none;" />
                 </div>
                 <%--<div id="chincheta" class="onoffswitch"></div>--%>
              </div>
	        </div>
        </div>   
    </div> 
    <table runat="server" id="WFProceso_DivDetalle" style="width:100%">               
    <tr id="WFProceso_Tr" style="">
       <td id="TDTreeView" runat="server" style="display:block;" class="PWSecciones_left">           
       <ul id="menu_proceso_secciones_left" runat="server" ></ul>
       <div id="INFOProgress" runat="server" style="display:none">
       </div>       
       </td>
       <td id="TDBarraExpandir" runat="server" style="width:16px; max-width:16px; min-width:16px; cursor:pointer;" class="PWBarraArbol" onclick="javascript:OcultarArbol();">
        <div runat="server" id="SpanSimboloExpand" class="" ></div>
       </td>
       <td id="TDIframe" runat="server" class="" style="width:100%; vertical-align:top; " >        
        <div runat="server" id="WFProceso_DivDatosActividad" class="PWCaja" style=" display:none; clear:both; ">  
            <div>
    <input type="hidden" value="0" id="HiddenTouchAgenda" />            
    <div id="WFProceso_TableDatosActividad">
   
   <div class="row">    
   <%--Fecha Hora--%> 
   <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12 row"  > 
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 gen" > 
        <span runat="server" id="txtDatosActiv_Fecha" style="display:inline; min-width:70px;">Fecha</span>          
        <table style="width:100%;"><tr>
             <%--Fecha--%>  
            <td style="width:calc(100% - 50px);">
                <input type ="text" id="TFecha" runat="server" style="width: calc(100% - 24px);" onchange="javascript:ElControlHaSidoTocado('INFO_Tocado'); " />
           </td>
           <td style=" width:75px;">
               <%--Hora--%>  
               <span class=" PWDropdownList  dropdown "  >
                <span class=" dropdown-toggle  form-control PWTextBox  " data-toggle="dropdown" id="THoraHMCONT" runat="server">
                    <input type="text"  id="THoraHM" runat="server" style="width:40px; display:inline;" maxlength="5" onchange="javascript:ElControlHaSidoTocado('INFO_Tocado');" />                 
                    <span class="caret"></span>                
                </span>
                <span class="  dropdown-menu  " id ="THoraHMDD" runat ="server"> </span>
               </span>               
           </td> 
           <td style=" width:25px;">
               <span runat="server" id="THoraHMDDTtipTZ" class="PWButton" style="display:none;"></span>                        
           </td>          
        </tr></table>        
     </div>
    <%--Duracion Estimada--%>
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 gen" runat="server" id="txtDatosActiv_DuracionEstimadaBQ" >
        <span runat="server" id="txtDatosActiv_DuracionEstimada" style="display:inline;  min-width:70px; width:100%">Duración estimada</span>        
         <span class=" PWDropdownList  dropdown " >
            <span class=" dropdown-toggle  form-control PWTextBox " style=" min-width:95px; width:100%" data-toggle="dropdown" id="TDurEstimadaHMCONT" runat="server">
                <input type="text"  id="TDurEstimadaHM" runat="server" style="min-width:70px; width:calc(100% - 20px); display:inline;"  maxlength="5" onchange="javascript:ElControlHaSidoTocado('INFO_Tocado');"  />      
                <span class="caret"></span>                
            </span>
        <span class="  dropdown-menu  " id ="TDurEstimadaHMDD" runat ="server"> </span>        
        </span> 
    </div>  
     <%--Finalizado--%>   
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 gen"  runat="server" id="SelDatosActiv_EstadoCOL"> 
        <span runat="server" id="txtDatosActiv_Estado"  style="display:block;  min-width:125px; width:100%" >Estado</span>
         <span class=" PWDropdownList  dropdown " >
               <span class=" dropdown-toggle form-control PWTextBox " style=" min-width:125px; width:100%" data-toggle="dropdown" id="SelDatosActiv_EstadoCONT" runat="server">
                   <input type="text" id="SelDatosActiv_Estado" runat="server" style="min-width:90px; width:calc(100% - 22px); display:inline;" />
                   <span class="caret"></span>  
               </span>
        <span class="  dropdown-menu  " id ="SelDatosActiv_EstadoDD" runat ="server"> </span>
        </span>  
    </div>
    </div>
   <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12 row"> 
    <%--Tipo actividad--%>   
   <span class="col-lg-2 col-md-1 col-sm-6 col-xs-12 gen" id="TInfoFase" runat="server"></span>      
   <span class="col-lg-6 col-md-5 col-sm-6 col-xs-12gen" id="LFactNew" runat="server"></span>  
   <span class="col-lg-2 col-md-3 col-sm-6 col-xs-12 gen" id="LFactAct" runat="server"></span>
   <span class="col-lg-2 col-md-3 col-sm-6 col-xs-12 gen" id="LFactUAcc" runat="server"></span>    
    </div>
   </div> 
   <div class="row"> 
   <div class="col-lg-12 col-md-11 col-sm-10 col-xs-12 ">
         <span runat="server" id="txtDatosActiv_Proyecto" style="display:block;  min-width:95px; width:100%" >Proyecto</span>       
        <input type="hidden" id="DropDownListProyecto" runat ="server" />
        <input type="hidden" id="TxtListClienteAux" runat ="server"/>
        <input type="text"  id="TxtListCliente" runat="server" style="width:100%;"/>  
        <div runat="server" id="Script_ListCliente" ></div>  
    </div> 
   </div>    
   <div class="row">
   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gen">
        <span runat="server" id="txtDatosActiv_Asunto"  style="display:block;  min-width:95px; width:100%" >Asunto</span>
        <input type ="text" id="TAsunto" runat="server" style="width:100%;"  maxlength="200" onchange="javascript:ElControlHaSidoTocado('INFO_Tocado');" />    
    </div>
   </div>       
   </div>        
    </div>                
     </div>
    <%--</div>--%>
       <div >
       <div runat="server" id="WFProceso_DivDatosActividad_IconContainer" class="" style="display:none;"></div> 
       <div id="TDVistaProcFases" style="vertical-align:top;width:100%;  display:none;" class="PWFondo" runat="server">        
       </div>
        <div id="TDVistaProcArch" style="vertical-align:top;width:100%; min-height:800px; display:none;" class="PWFondo" runat="server">           
            <div class="row" id="TDVistaProcArch_controles"  runat ="server" style="margin:auto; text-align:right;" >
               <input type="file" runat="server" id="FileUploadArchivo" style="display:none;"/>               
               <asp:FileUpload ID="FileUploadArchivoOld" runat="server" style="display:none;" />
               <asp:Button ID="ButtonAgregarFichero" runat="server" Text="Button" style="display:none;" />             
               <asp:Button ID="ButtonDFichero" runat="server" Text="" style="display:none;" />
                <input type="hidden" runat="server" id="ButtonDFicheroH"  value=""/>
                <%--<a style="display:none;" id="ButtonDFicheroA" download hidden></a>--%>
            </div> 
            <div class="row" style="width:100%" id="TDVistaProcArch_Lista" runat="server" ><</div>              
         </div>
        <div id="TDVistaProcPart" style="vertical-align:top;width:100%;display:none; " class="PWFondo" runat="server">      
        <div id="TRVistaProcPart_controles" runat="server" class="row" style="margin-bottom:5px; text-align: right;"> </div>
        <div id="TRVistaProcPart_Lista"  runat="server"> </div>
        </div>
        <div id="TDVistaProcForm" style="vertical-align:top;width:100%; " runat="server"> 
            <div id="TDVistaProcForm_DatosActividad" runat="server"></div>           
            <div runat="server" id="DivDetalle_DibujoFormulario" style="width:100%; ">            
            <div runat="server" id="DivDetalle_Formulario" class="PWFondoFormulario" style="width:99.9%; text-align:left; float:left;"></div>                        
            </div>            
            <div id="cuartaBarra2"  runat="server" class="" style="display:none;">
	            <div  runat="server">
                  <ul id="menu_proceso_bifurcaciones_bottom" class="NO_nav NO_navbar-nav itemMenuPlan" runat="server">                
                  </ul>
	            </div>
            </div>    
          </div>
          <div id="TDVistaProcDatos" runat="server" style="vertical-align:top;width:99.9%; " class='PWCajaFondo'>           
              <div id="TDVistaProcDatos_DatosActividad" runat="server" ></div>
             <div runat="server" id="DivDatosDetalle_Formulario" class="PWFondoFormulario" style="width:99.9%; text-align:left; float:left;"></div>                                         
          </div>
          <div id="TDVistaProcResp" runat="server" style="vertical-align:top;width:100%;  display:none;" class='PWFondo'>
          <div id="DivVistaProcResp_controles" runat="server" class="row" style="text-align: right;"></div>          
          <div id="DivVistaProcResp_respuestas" runat="server"></div>
          </div>
           <div id="TDVistaProcSeg" runat="server" style="vertical-align:top; width:100%; overflow:visible" class='PWCaja1'>             
             <input runat="server"  type="hidden" id="INFO_CARGADO_TDVistaProcSeg" value=""/> 
             <input runat="server"  type="hidden" id="INFO_URL_TDVistaProcSeg" value=""/>                         
          </div> 
          </div>
    <%--</div>--%>
          </td>
          </tr>         
        </table>
       <!-- ZONA DE CONTROLES GENERALES OCULTOS -->
        <div runat="server" style="display:none;" id="DivZonaControlesOcultos">
        <!--Control Que guarda el ultimo elemento mostrado-->
        <input runat="server" type="hidden" id="HiddenProFormMemoriaEstado" />
        <input runat="server" type="hidden" id="HiddenVistaProcMemoriaEstado" value="TabButtonActividadProceso"/>                  
        <!--Controles ocultos de las bifurcaciones -->
        <div runat="server" style="display:none;" id="DivDetalle_BifurcacionControlesOcultos"></div>         
        <!--Controles para el FileUpload -->        
        <input id="FileUploadGenerico" type="file" runat="server" style="display:none;" />
        <input id="FileUploadGenericoIDCampo" type="hidden" runat="server" style="display:none;"/>
        <asp:Button ID="FileUploadGenericoButton" runat="server" Text="Button" style="display:none;  " />
        <!-- Controles para que desde el servidor se puedan conlocer las dimensiones de la pantalla -->
        <input runat="server"  type="hidden" id="INFO_ScreenWidth" value=""/>
        <input runat="server"  type="hidden" id="INFO_ScreenHeight" value=""/>
        <input runat="server"  type="hidden" id="INFO_WindowHight" value=""/>
        <input runat="server"  type="hidden" id="INFO_WindowWidth" value=""/>
        <!-- Ocultar/Mostrar Datos de la Actividad -->
        <input runat="server"  type="hidden" id="INFO_DivDatosActividad_Visible" value=""/>
        <!-- Ocultar/Mostrar Toolbar de Actividad -->
        <input runat="server"  type="hidden" id="INFO_DivToolBar_Visible" value=""/>
        <!-- ultima posición del formulario flotante -->
        <input runat="server"  type="hidden" id="INFO_Posicion_PieFormularioFlotante" value=""/>
        <!-- Boton Oculto para Delegar Proceos -->
        <asp:Button ID="ButtonResultadoSelectorEmpleadosDelegar" runat="server" Text="Button" OnClick="Contraer_SelectorEmpleados_Delegar" />
        <!-- Boton Oculto para Añadir delegados -->
        <asp:Button ID="ButtonResultadoSelectorEmpleadosAniadirDelegado" runat="server" Text="Button" OnClick="Contraer_SelectorEmpleados_AniadirDelegado" />
        <!-- Boton Oculto para Roll Seleccionable -->
        <asp:Button ID="ButtonResultadoRollEmpleadoSeleccionable" runat="server" Text="Button" OnClick="Contraer_SelectorEmpleados_Seleccionable" />                
        <!-- Boton Oculto Añadir Participantes -->
        <asp:Button ID="ButtonResultadoAniadirParticipante" runat="server" Text="Button"  />                
        <!-- Boton Oculto Añadir Notificado -->
        <%--<asp:Button ID="ButtonResultadoAniadirNotificado" runat="server" Text="Button"  />--%>                
        <!-- Formularios de las bifurcaciones -->
        <%--<asp:Button ID="BTN_BIFURCACION_CAMBIARFORMULARIO" runat="server" Text="Button" OnClick="RadioButtonCambiarFormulario_Click" style="display:none;"/>--%>                
        <!-- Guardar desde Cambio de bifurcacion -->
        <asp:Button ID="TabButtonGuardar_pButton" runat="server" Text="Button" OnClick="ButtonGuardar_Click" style="display:none;"/>                        
        <!-- -->        
        <input runat="server"  type="hidden" id="INFO_BIFURCACION_ID" value=""/>        
        <input runat="server"  type="hidden" id="INFO_BIFURCACION_NOMBREFORM" value=""/>        
        <input runat="server"  type="hidden" id="INFO_BIFURCACION_READONLY" value=""/>        
        <!-- Para Redimensionar la pantalla segun el contenido del ifram de seguimiento-->
        <input type="button" style="display:none;" id="HiddenDimensionButtonOf_IFrameVistaProcSeg" onclick="javascript:CambiaTamanoIframe();";/>
        <input type="hidden" value="" id="MyCalculateHeight" />       
        <input type="hidden" value="" id="MyCalculateWidth" />      
        <!--Ancho y alto del formulario-->
        <input type="hidden" runat ="server" value="" id="INFO_FormHeight" />  
        <input type="hidden" runat ="server" value="" id="INFO_FormWidth" />  
        <!-- Para Sacar la venta de aviso al salir sin grabar-->        
        <asp:HiddenField ID="INFO_Tocado" runat="server" Value="0" />
        <asp:HiddenField ID="INFO_position_scroll_info" runat="server" Value ="" /> 
        <!--Indica la clave actual para identificar del formulario dinamico generado -->
        <input type="hidden" value="" id="HiddenCurrentValueFormXPage" runat="server" />            
        <input type ="hidden" id="INFO_ESTADO_TREEVIEW" value="block" runat="server"/>
        <input runat="server"  type="hidden" id="WUCResponderActividad_Respuesta" value=""/>   
        <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div>
       </div>
       <div style="display:none;" id="Div_Elementos_Cambiantes" runat="server">       
            <asp:ImageButton CssClass ="PWIcono PWIconoAplicacion" ID="WFProceso_ImageButtonCabecera_Guardar" runat="server" ImageUrl="./images/gifs16X16/save.gif" ToolTip="Guardar" />                
            <asp:ImageButton CssClass ="PWIcono PWIconoAplicacion" ID="WFProceso_ImageButtonCabecera_Cancelar" runat="server" ImageUrl="./images/gifs16X16/cancel.gif" ToolTip="Cancelar" />        
       </div>    
       <!-- Elementos que se usan como Menu contextual -->
       <!-- Menú Siguiente -->
      <%-- <table runat="server" id="TabMenuButtonSiguiente" style="display:none; position:absolute; z-index:301;" class="PWProceso_ActividadSiguiente">
        <tr><td style="cursor:pointer; text-align:right">&nbsp;<img  runat="server" id="TabMenuButtonSiguiente_Img_Ocultar" class="PWIcono PWIconoAplicacion" alt="cerrar" src="./images/gifs16X16/delete.gif" style="cursor:pointer;" onclick="javascript:OcultarElemento('TabMenuButtonSiguiente')" /></td></tr>        
      </table>--%>
      <!-- Menú Nueva Actividad Siguiente -->
      <%--<div runat="server" id="TabMenuNuevaActividadSiguiente" style="width: 600px;  height: 360px;">
      <uc4:WUCNuevaActividad ID="MenuNuevaActividadSiguiente" runat="server" display="none"/>
      </div>--%>                
    <div runat="server" id="DivDetalle_PieFormularioFlotante" 
      style="position:absolute; top:10px;right:10px; z-index:100; display:none" class="PWCajaFormulario"> 
      <table  style="width:100%;" class="PWFondoFormulario" cellspacing="0" cellpadding="0" border="0" >                
      <tr style="height:5px; min-height:5px;">
        <td id="WFProceso_PieFormularioFlotante_UpLeft" style="width:12px; text-align:left;" onclick="javascript:move_floatForm(this);"></td>
        <td id="WFProceso_PieFormularioFlotante_Up" style="text-align:center;  " onclick="javascript:move_floatForm(this);"></td>
        <td id="WFProceso_PieFormularioFlotante_UpRight" style="width:12px; text-align:right;" onclick="javascript:move_floatForm(this);"></td>
      </tr>
      <tr  style="width:100%; height:5px; min-height:5px;"  >
        <td id="WFProceso_PieFormularioFlotante_Left" style="width:12px; text-align:left; cursor:pointer;  width:5px; min-width:5px;" onclick="javascript:move_floatForm(this);" ></td>
        <td style="text-align:center ;">
         <table cellspacing="0" cellpadding="0" border="0">
         <tr runat="server" id="TRDetalle_PieFormulario" ></tr>
         </table>
        </td>
        <td id="WFProceso_PieFormularioFlotante_Right" style="width:12px; text-align:right;cursor:pointer; width:5px; min-width:5px;" onclick="javascript:move_floatForm(this);"></td>
      </tr>
      <tr style="height:5px; min-height:5px;">
        <td id="WFProceso_PieFormularioFlotante_DownLeft" style="width:12px; text-align:left;cursor:pointer;" onclick="javascript:move_floatForm(this);"></td>
        <td id="WFProceso_PieFormularioFlotante_Down" style="text-align:center ;" onclick="javascript:move_floatForm(this);"></td>
        <td id="WFProceso_PieFormularioFlotante_DownRight" style="width:12px; text-align:right;cursor:pointer;" onclick="javascript:move_floatForm(this);"></td>
      </tr>
      <tr></tr>
      </table>
    </div>
    <div style="display:none" runat="server" id="DivControlesDinamicos"></div>    
    <div id="MdlActMdContent" style="display: none" runat="server"></div>
    <div id="MdlActMdContentPart" style="display:none" runat="server">
        <div id='MdlActMdPart' class='modal fade ' role='dialog'><div class='modal-dialog modal-lg' >
            <div class='modal-content '>
                <div class='modal-header PWcabecera_toolbar '>
                    <button type='button' class='close PWicono PWicono_app_toolbar' data-dismiss='modal' >&times;</button>
                    <h4 class='modal-title' style='text-align:center;' id="MdlActMdPart_Tit" data-partmode="2">Añadir como notificado</h4>
                 </div>
                 <div class='modal-body'>
                    <div class="row">
                        <span id="TitleNuevoComoParticipante" runat="server" class="col-lg-12 col-md-6 col-sm-12 col-xs-12 gen PWTitulo4 "></span>                                                                              
                    </div>
                    <div id="TDVistaProcPart_aniadirParticipante" class="row">
                        <span id="Group_NuevoComoParticipante" runat="server" class="col-lg-12 col-md-6 col-sm-12 col-xs-12 gen">
                        <input type="text" id="TxtNuevoComoParticipante" runat="server"  />
                        </span>                    
                        <div id="ScrNuevoComoParticipante" runat="server" style="display:none" ></div>                                  
                    </div>
                 </div>                    
         </div></div></div>         
    </div>
    <div id="MdlActMdContentNewA" style="display:none" runat="server">
         <div id='MdlActMdNewA' class='modal fade ' role='dialog'><div class='modal-dialog modal-lg' >
            <div class='modal-content '>
                <div class='modal-header PWcabecera_toolbar '>
                    <button type='button' class='close PWicono PWicono_app_toolbar' data-dismiss='modal' >&times;</button>
                    <h4 class='modal-title' style='text-align:center;' id="MdlActMdNewA_Tit" data-partmode="2" runat="server">Añadir nueva actividad</h4>
                 </div>
                 <div class='modal-body row ' id="MdlActMdNewA_Body" runat="server" >
                      
                 </div>                    
         </div></div></div> 
    </div>
    <div runat="server" id="TabMenuButtonSiguiente" style="display:none; position:absolute; z-index:301;" class="PWProceso_ActividadSiguiente" >                   
           <span id ="TabMenuButtonSiguienteDD" runat ="server" class=" clickouthidd " > </span>        
    </div>
    </form> 
</div>
</body>
<script type="text/javascript" >
    if (document.getElementById("HiddenVistaProcMemoriaEstado")) {        
        AuxMemoriaEstado = document.getElementById("HiddenVistaProcMemoriaEstado").value;      
        if (AuxMemoriaEstado != "") {
            if (document.getElementById(AuxMemoriaEstado)) {
                Visualizacion_Actividad(document.getElementById(AuxMemoriaEstado));
            }
        }
    }   
</script>
<script  type="text/javascript" >      
    AjustarCapas();    
</script>

<%--<script type="text/javascript" >NoIncluirEnFrame();</script>--%>

<script type="text/javascript">
    AuxFFloat = document.getElementById('DivDetalle_PieFormularioFlotante');
    INFOFFloat = document.getElementById('INFO_Posicion_PieFormularioFlotante');
    if (AuxFFloat.style.display != "none") {
        floatingMenu.add('DivDetalle_PieFormularioFlotante',
        {          
            targetRight: 10,
            targetBottom: 10,
            snap: true,
            distance: .1,
            ignoreParentDimensions: true
        });
        move_floatForm_();
    }

    function move_floatForm(aPosElement) {
        INFOFFloat = document.getElementById('INFO_Posicion_PieFormularioFlotante');
        INFOFFloat.value = aPosElement.id
        move_floatForm_();
    }

    function move_floatForm_() {
        INFOFFloat = document.getElementById('INFO_Posicion_PieFormularioFlotante');
        if (!INFOFFloat) { return; }
        switch (INFOFFloat.value) {
            case "WFProceso_PieFormularioFlotante_UpRight":
                move_upper_right(); break;
            case "WFProceso_PieFormularioFlotante_Up":
                move_upper_center(); break;
            case "WFProceso_PieFormularioFlotante_UpLeft":
                move_upper_left(); break;
            case "WFProceso_PieFormularioFlotante_Left":
                move_center_left(); break;
            case "WFProceso_PieFormularioFlotante_Right":
                move_center_right(); break;
            case "WFProceso_PieFormularioFlotante_DownRight":
                move_lower_right(); break;
            case "WFProceso_PieFormularioFlotante_Down":
                move_lower_center(); break;
            case "WFProceso_PieFormularioFlotante_DownLeft":
                move_lower_left(); break;
            case "":
                move_lower_right(); break;
        }
    }
</script>  
<script  type="text/javascript" >
    window.onscroll = popup_position_scroll_info;
</script>

<script   type="text/javascript" >
    $(function () {
        //Función para barra desplegable de los procesos        
        if ($("#menu_proceso_bifurcaciones_onoffswitch").is(":checked")) {           
            $("#cuartaBarra, #esconder").show();
        }
        else {
            $("#cuartaBarra, #esconder").hide();
        }
        $("#btn_bifurcaciones").click(function () {
            $("#cuartaBarra, #esconder").slideToggle("slow");
        });
    });
</script>

</html>