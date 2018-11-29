<%@ page language="VB" autoeventwireup="false" inherits="WFReglaEdicionForm, App_Web_irmiclv2" validaterequest="false" enablesessionstate="true" enableviewstate="true" enableviewstatemac="true" viewstateencryptionmode="Always" maintainscrollpositiononpostback="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="WUCTabButtonNet.ascx" TagName="WUCTabButtonNet" TagPrefix="uc2" %>
<%@ Register Src="WUCMiniTabbuttonNet.ascx" TagName="WUCMiniTabbuttonNet" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Edici&oacute;n de regla</title>    
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>    
   <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/respond.min.js"></script>--%>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <script  type="text/javascript">
        //Inicialización de scripts
        $(document).ready(function () {
            var pageMgr = Sys.WebForms.PageRequestManager.getInstance();
            pageMgr.add_endRequest(Actualizar);
            //Esta función se ejecutará también despues de las llamadas Asincronas
            function Actualizar(sender, args) {
                CambiarTab(document.getElementById("INFO_TABVISIBLE").value);
            }
        });
</script>
</head>
<body runat="server" id="MyBody" class="PWFondo" style=" margin:0px; width:100%; height:99%;">   

<div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;">        
  <!--Noscript-->        
</div>
<div id="content" runat="server"  style=" height:100%; overflow:visible; visibility:visible;" class="PWContentx PWContentReglasForm">
     <form  autocomplete="off" id="form1" runat="server" style='margin:0px; width:99%; height:100%;' >
     <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true" EnableViewState="true" ></asp:ScriptManager>     
    <div runat="server" id="DivCapaOpaca" style="width:100%; position:absolute; overflow: hidden; left: 0px; top: 0px; height: 20px; display:none;" class=""></div>          
    <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>            
    <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 16px; top: 454px; height: 46px; display:none;">        
    <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/> -->
    </div>     
       
    <div style="width:100%; text-align:center; position:fixed; top:0px;" id="WFReglaEdicionForm_Cabecera" class="PWcabecera_toolbar" runat="server"></div> 
    <div class="PWformulario_menu" style="margin-right:30px; margin-left:30px; margin-top:30px; clear:both; width:100%; max-width:1000px; ">   
    
    <div style="display:inline; float:left; margin-right:10px;">
            <span id="WFReglasForm_Id" runat ="server"></span>
            <span class="PWButton" onclick="javascript:location.href='./WFReglasForm.aspx';" style="cursor:pointer; padding-left:10px;" runat="server" id="Button_VolverCont">                
            <span runat="server" id="Button_VolverTxt" style="vertical-align:baseline;">Volver</span>                
            </span>      
       
            <span class="PWButton" onclick="document.getElementById('Button_Guardar').click();" style="cursor:pointer; padding-left:10px;">            
            <span runat="server" id="Button_GuardarTxt"  style="vertical-align:baseline;">Guardar</span>
            <asp:Button ID="Button_Guardar" runat="server" style="display:none"/>
            </span>       
       
            <span class="PWButton" onclick="document.getElementById('Button_NuevaRegla').click();" style="cursor:pointer; padding-left:10px;" runat="server" id="Button_NuevaReglaCont">                
            <span runat="server" id="Button_NuevaReglaTxt"  style="vertical-align:baseline;">Nueva regla</span>
            <asp:Button ID="Button_NuevaRegla" runat="server" Text="Nueva Regla" style="display:none" />
            </span>
       
    </div>
    <span style="float:right; padding-top:10px; ">            
    </span>
    </div>
    <div style="clear:both;">
    
    <div id="DivRegla" style="width:90%;">
                   
        <div runat="server" id="DivFormularioRegla" style="margin:20px; width:100%;" class="PWFondoFormulario">              
        <asp:UpdatePanel ID="UpdatePanelRegla" runat="server"  >        
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ReglaOrigenDeDatos" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ReglaProceso" EventName="SelectedIndexChanged" />
        </Triggers>
        <ContentTemplate> 
        <div runat="server" id="DivFormularioRegla_Datos"  style="width:100%;" class="PWFondoFormulario">
        <table style="width:100%;">
        <tr>
        <td   style="vertical-align:middle; padding-left:10px; text-align:left;">
        <span  runat="server" id="LbReglaNombre" style="display:block; text-align:left;">Nombre</span>
        <input type="text"  runat="server" id="ReglaNombre" style="width:99%"  class=" form-control PWTextBox " onchange="javascript:tocado();" />
        </td>        
        <td style="vertical-align:middle; padding-left:10px; text-align:left;" >
        <table style="text-align:left; width:100%">
        <tr >
        <td style="width:50%"><span runat="server" id="lbReglaTipo" style="display:inline;  text-align:left;  ">Tipo de Regla</span></td>
        <td style="width:50%"><span runat="server" id="lbReglaTipoEjec" style="display:inline;  text-align:left; ">Momento de ejecución</span></td>
        </tr>
        <tr>
        <td style="width:50%"><asp:DropDownList ID="ReglaTipo" runat="server" style="width:99%" onchange="javascript:tocado();">            
         </asp:DropDownList></td>
        <td style="width:50%"> <asp:DropDownList ID="ReglaTipoEjec" runat="server" style="width:99%" onchange="javascript:tocado();">            
         </asp:DropDownList> </td>
        </tr>
        </table>                          
        </td>        
        </tr>

        <tr>
        <td style="vertical-align:middle; padding-left:10px; text-align:left;" >
        <span  runat="server" id="lbReglaProceso" style="display:block; text-align:left;">Proceso</span>
            <asp:DropDownList ID="ReglaProceso" runat="server" AutoPostBack="true" style="width:99%">            
            </asp:DropDownList>
        </td>
        <td style="vertical-align:middle; padding-left:10px; text-align:left;">
        <span  runat="server" id="lbReglaOrigenDeDatos" style="display:block;  text-align:left;">Origen de datos</span>        
            <asp:DropDownList ID="ReglaOrigenDeDatos" runat="server" style="width:74%" AutoPostBack="true" EnableViewState="true">            
            </asp:DropDownList>
            <span runat="server" id="TipoOrigenDatos" class="PWLabel" style="width:24%"></span>
        </td>        
        </tr>

        <tr>
        <td   style="vertical-align:middle; padding-left:10px; text-align:left;" >
        <span  runat="server" id="lbReglaResultado" style="display:block; text-align:left;">Resultado</span>
            <asp:DropDownList ID="ReglaResultado" runat="server" style="width:99%; " onchange="javascript:tocado();">            
            </asp:DropDownList>
        </td>
        <td  style="vertical-align:middle; padding-left:10px; text-align:left;">
            <table>
            <tr>
            <td>
            <span  runat="server" id="lbReglaDictamen" style="display:block;  text-align:left;">Dictamen</span>
            <asp:DropDownList ID="ReglaDictamen" runat="server" style="width:300px; display:inline; marging-right:10px;" onchange="javascript:tocado();">            
            </asp:DropDownList>
            </td>
            <td>
            <span  runat="server" id="lbReglaOrden" style="display:block;  text-align:left;">Orden</span>
            <input type="text" class=" form-control PWTextBox "  runat="server" id="ReglaOrden"  maxlength="8" style="width:50px;" onchange="javascript:tocado();" />      
            </td>
            <td style="vertical-align:middle; padding-left:10px;">
            <span  runat="server" id="lbReglaEstado" style="display:block;  text-align:left;">Habilitada</span>
            <input type="checkbox"  class=" form-control PWTextBox "  runat="server" id="ReglaEstado"  onclick="javascript:tocado();" />    
            </td>
            </tr>
            </table>        
        </td>        
        </tr>         
        <tr>
        <td id="TdTab" runat="server" rowspan="2" class="PWformulario_menu" >   
           <div id="TdTabDiv" class=" PWformulario_menu  PWPA" style="display:inline; margin-bottom:20px;" >
               <ul class=" nav nav-tabs " >
                   <li  id="LiRegla" runat="server" class=" active PWformulario_menu_btn_pushed " onclick="javascript:CambiarTab('Regla');" ><a><span id="LiReglatxt" runat="server" >Bifurcaciones</span></a></li>
                   <li id="LiCondiciones" runat="server"  class=" PWformulario_menu_btn "  onclick="javascript:CambiarTab('Condiciones');" ><a><span id="LiCondicionesTxt" runat="server" >Bifurcaciones</span></a></li>
               </ul>
           </div>           
        </td>            
        </tr> 
        <tr>
        <td id="TdAplicaciones" runat="server">        
        <div runat="server" id="DivTablaAplicaciones">
        </div>  
        </td>
        </tr> 
         <tr>
        <td id="TdDescripcion" runat="server" colspan="2">        
        <span  runat="server" id="lbReglaDescripcion" style=" text-align:left;">Descripción</span>        
        <asp:TextBox ID="ReglaDescripcion" runat="server" style="width:99%; height: 50px;"  
                class=" form-control PWTextBox " MaxLength="1000" TextMode="MultiLine" onchange="javascript:tocado();"></asp:TextBox>
        </td>
        </tr>         
        </table>  
       
        </div>          
        </ContentTemplate>
        </asp:UpdatePanel>        
        <!--xx-->
        </div>      
    </div>
    
    <div id="DivCondiciones" runat="server" style="margin:10px; width:100%; margin:5px;">
        <div runat="server" id="DivControlVersiones" style="margin-bottom:20px; width:100%" >
            <div runat ="server" id="DivControlVersiones_Label" style="font-weight: bold; padding-bottom: 10px;"> Versión </div>
            <div runat="server" id="DivControlVersiones_seleccion"  style="padding-bottom:10px;" class="row">                
                <span class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><select runat ="server" id="DivControlVersiones_DDVersion" style="width:100%"></select></span>                            
                <span class=" col-lg-1 col-md-1 col-sm-3 col-xs-3 center"><asp:Button runat ="server" ID="DivControlVersiones_CrearNuevaVersion" style="" class="PWButton" value="Nueva versión"  /></span>
                <span class=" col-lg-3 col-md-3 col-sm-6 col-xs-6 center"><asp:Button runat ="server" ID="DivControlVersiones_CopiarYCrearNuevaVersion" style="" class="PWButton" value="Nueva versión" /></span>
                <span  class=" col-lg-1 col-md-1 col-sm-3 col-xs-3 center" ><span runat ="server"  id="DivControlVersiones_BorrarVersion" style="" class="PWButton "> Nueva Versión</span></span>
            </div>            
            <div runat="server" id="DivControlVersiones_DatosVersion"   > 
                <div style="padding-bottom:10px;" class="row">
                    <span runat="server" id="DivControlVersiones_LabelNombre" class="col-lg-2 col-md-2 col-sm-4 col-xs-4"> Nombre</span> 
                    <span class="col-lg-10 col-md-10 col-sm-8 col-xs-8" ><asp:TextBox ID="DivControlVersiones_NombreVersion" MaxLength ="255"  class="PWTextBox " style="min-width:400px;" runat="server"></asp:TextBox></span>
                </div>              
                <div style="padding-bottom:10px;" class="row" runat="server" id="DivControlVersiones_DatosVersion2"  >
                  <span runat="server" id="DivControlVersiones_LabelFdesde" class="col-lg-2 col-md-2 col-sm-4 col-xs-4"> Válida Desde</span>
                  <div class="col-lg-4 col-md-4 col-sm-8 col-xs-8"  style="display:inline">
                      <%--<input runat ="server" type="text"  id="DivControlVersiones_Fdesde" value="" class="PWTextBox "/>--%>
                       <table style="width:100%;"><tr><%--Fecha--%>  
                        <td style="width:calc(100% - 50px);">
                            <input type ="text" id="DivControlVersiones_Fdesde" runat="server" style="width: calc(100% - 24px); display:inline;"  />
                       </td>
                       <td style=" width:75px;"> <%--Hora--%>  
                           <span class=" PWDropdownList  dropdown "  >
                            <span class=" dropdown-toggle  form-control PWTextBox  " data-toggle="dropdown" id="DivControlVersiones_HdesdeCont" runat="server">
                                <input type="text"  id="DivControlVersiones_Hdesde" runat="server" style="width:40px; display:inline;" maxlength="5"  />                 
                                <span class="caret"></span>                
                            </span>
                            <span class="  dropdown-menu  " id ="DivControlVersiones_HdesdeDD" runat ="server"> </span>
                           </span>               
                       </td>         
                      </tr></table>    
                  </div>
                  <span runat ="server" id="DivControlVersiones_LabelFHasta" class="col-lg-3 col-md-3 col-sm-8 col-xs-8"> Válida Hasta</span>
                  <span class="col-lg-2 col-md-2 col-sm-12 col-xs-12 "><asp:Button runat ="server" id="DivControlVersiones_ActivarVersion"  style="" class="PWButton" valie="Planificar versión" /></span>
                </div>
            </div>
        </div>
        <div runat="server" id="DivTablaCondiciones">
        <table runat="server" id="TablaCondiciones"><tr><td></td></tr></table>
            
        </div>  
        <div runat="server" id="Div1">
         <span style="float:left; padding-top:10px;">
             <span class="PWButton" onclick="document.getElementById('Button_AniadirCondicion').click();" style="cursor:pointer;" runat="server" id="Button_AniadirCondicionCont">
                <img runat="server" id="Button_AniadirCondicionImg" src="./images/default/add.png" alt=""  style="vertical-align:baseline;"/>
                <span runat="server" id="Button_AniadirCondicionTxt" style="vertical-align:baseline;">Añadir condición</span>                
                <asp:Button ID="Button_AniadirCondicion" runat="server" style="display:none"/>
            </span>&nbsp; 
         </span>
        </div>       
    </div> 
    <div style="margin:10px; width:98%;">
     
    </div>   
    <div id="DIVCamposOcultos" style="display:none;">  
    <asp:Button ID="ButtonBorrarVersion" runat="server" Text="Button" />  
    <asp:Button ID="ButtonChangeVersion" runat="server" Text="Button" />  
    <input type ="hidden" id="INFO_VERSIONVISIBLE" value="Regla" runat="server"/>    
    <input type ="hidden" id="INFO_TABVISIBLE" value="Regla" runat="server"/>    
    <asp:HiddenField ID="INFO_TOCADO" runat="server" value="" />
    </div>         
    
    <!--Fin-->          
    </div>
    </form>
</div>
</body>
<%--<script type="text/javascript" > NoIncluirEnFrame();</script>--%>

<script type="text/javascript" >
    function tocado() { document.getElementById("INFO_TOCADO").value="1"; }

    function iftocado(textoconfirm) {        
        if (document.getElementById("INFO_TOCADO").value == "") { location.href = './WFReglasForm.aspx'; }
        else if (confirm(textoconfirm)) { location.href = './WFReglasForm.aspx'; }
    }

    function CambiarTab(AuxId) {
        document.getElementById("TdAplicaciones").style.display = "none";
        document.getElementById("TdDescripcion").style.display = "none";
        document.getElementById("DivCondiciones").style.display = "none";
        document.getElementById("LiRegla").className = "PWformulario_menu_btn";
        document.getElementById("LiCondiciones").className = "PWformulario_menu_btn";
        document.getElementById("INFO_TABVISIBLE").value = AuxId;
        if (AuxId == 'Condiciones') {
            document.getElementById("DivCondiciones").style.display = 'block';
        }
        else {
            document.getElementById("TdAplicaciones").style.display = 'table-cell';
            document.getElementById("TdDescripcion").style.display = 'table-cell';
        }
        document.getElementById("Li" + AuxId).className = " active PWformulario_menu_btn_pushed ";
    }

    CambiarTab(document.getElementById("INFO_TABVISIBLE").value);   

</script>
<script language="javascript" type="text/javascript" >

    function CambiatipoDeDatoOperador(Num, IdCond, ComboTipo, FOcult) {       
        var ControlDato=document.getElementById('ComboDatosOperador' + Num + '_'+ IdCond);
        var ControlValor = document.getElementById('ValorOperador' + Num + '_' + IdCond);        
        ControlDato.style.display = 'none';
        ControlValor.style.display = 'none';        
        if (!FOcult) {
            if (ComboTipo.value == 1) {               
                ControlDato.style.display = 'inline';
                ControlValor.style.display = 'none';
            } else if (ComboTipo.value == 2) {
                ControlDato.style.display = 'none';
                ControlValor.style.display = 'inline';
            } 
        }
    }

function reglaCondicionActualizarOperadorCondicion(CmbOper) {        
    var idAux = CmbOper.id.replace("ComboTipoOperadorCondicion", "")    
    var controlOperador1 = document.getElementById('Cont_ComboDatosOperador1_' + idAux);
    var controlOperador2 = document.getElementById('Cont_ComboDatosOperador2_' + idAux);
    var controlTipoOperador2 = document.getElementById('ComboTipoOperador2_' + idAux);
    var controlOperador3 = document.getElementById('Cont_ComboDatosOperador3_' + idAux);
    var controlTipoOperador3 = document.getElementById('ComboTipoOperador3_' + idAux);
    var TRExpresion = document.getElementById('TRExpresion_' + idAux);
    var ValorOperador2 = document.getElementById('ValorOperador2_' + idAux);
    var ValorOperador3 = document.getElementById('ValorOperador3_' + idAux);
    if (CmbOper.value == '0' || CmbOper.value == '9') {
        controlOperador1.style.display = 'none';
        controlOperador2.style.display = 'none';
        controlTipoOperador2.style.display = 'none';
        ValorOperador2.style.display = 'none';
        controlOperador3.style.display = 'none';
        controlTipoOperador3.style.display = 'none';
        ValorOperador3.style.display = 'none';
        if (CmbOper.value == '0') {TRExpresion.style.display = 'none'; }
        if (CmbOper.value == '9') { 
            TRExpresion.style.display = 'inline';
            controlOperador1.style.display = 'inline';
            controlTipoOperador2.style.display = 'none';
            CambiatipoDeDatoOperador(2, idAux, controlTipoOperador2,false);
        }
    }
    else {
        controlOperador1.style.display = null;
        controlOperador2.style.display = null;
        controlTipoOperador2.style.display = 'inline';
        controlOperador3.style.display = 'none';
        controlTipoOperador3.style.display = 'none';        
        CambiatipoDeDatoOperador(2, idAux, controlTipoOperador2,false);
        CambiatipoDeDatoOperador(3, idAux, controlTipoOperador3,true); //Oculta el operador3       
        //si es boteween
        if (CmbOper.value == '8') {
            CambiatipoDeDatoOperador(3, idAux, controlTipoOperador3,false);
            controlOperador3.style.display = null;
            controlTipoOperador3.style.display = 'inline';
        }
        TRExpresion.style.display = 'none';
    }


}



function reglaCondicionDatoSeleccionado(combo, idbr, idtxt, idtr) {    
    var TRExpresion = document.getElementById(idtr);
    if (TRExpresion) {       
        if (TRExpresion.style.display != 'none') {
            var TBExpr = document.getElementById(idtxt);
            if (combo.value != '') {
                TBExpr.value = TBExpr.value + '[@PGS!' + combo.value + ']';
                combo.value = '';
            }
            return;
        }
    }
    document.getElementById(idbr).click();
}

</script>
</html>
