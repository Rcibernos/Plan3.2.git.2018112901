<%@ page language="VB" autoeventwireup="false" inherits="WFDisForm, App_Web_irmiclv2" maintainscrollpositiononpostback="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<!DOCTYPE html>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="WUCTabButtonNet.ascx" TagName="WUCTabButtonNet" TagPrefix="uc2" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc3" %>
<%@ Register src="WUCMiniTabbuttonNet.ascx" tagname="WUCMiniTabbuttonNet" tagprefix="uc1" %>
<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">-->

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Diseñador de Formularios</title>        
    <%--favicon--%>    
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>       
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script> 
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <%--Editor Codigo--%>
    <script type="text/javascript" src="JsLibs/aceEditor/ace.js"></script> 
    <script type="text/javascript" src="JsLibs/aceEditor/ext-language_tools.js"></script> 
    <%--Jquery Mask --%>
    <script type="text/javascript" src="./JsLibs/jquery.mask.min.js"></script>
    <%--<link rel="stylesheet" href="JsLibs/modal/jquery-modal.css" />--%>  
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <%--funciones Responsive--%>
    <script type="text/javascript" src="JsLibs/JSDiseno.js"></script> 
    <link rel="stylesheet"  runat="server" id="Link1" href="./Css/Designer.css" />

</head>
<body runat="server" id="MyBody" class="PWFondo" onresize="javascript:AjustarCapas(); javascript:ReubicarMenu()" style=" margin:0px; width:100%; height:100%;">   

<div id="errnoscript"  runat="server" style="width:100%; text-align:center; visibility:hidden">        
  <!--Noscript-->        
</div>    
<div id="content"  runat="server" style="visibility:visible; height:100%; " class="PWContent PWContentRepositorioForm">
    <style id="DynamicStyles" runat="server"></style>
    <form  autocomplete="off" id="form1" runat="server" style='margin:0px; width:100%; height:100%;' onkeypress="var tecla = document.all ? event.keycode : event.which; if(tecla === 13) return false;">
    <div runat="server" id="ScriptsCabecera" style="display:none;"></div>
    <a runat="server" id="modalista" style="display:none;"></a>
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>     
    <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />
    <div runat="server" id="DivCapaOpaca" style="width:100%; position:absolute; overflow: hidden; left: 0px; top: 0px; height: 20px; display:none;" class=""></div>          
    <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>            
    <div runat="server" id="DivCapaRecarga" class="" style="width:100%; position:absolute;  overflow: hidden; left: 0px; top: 0px; height: 100%; display:none;">        
         <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
    </div>     
    <div runat="server" id="DivCabecera" class='PWCabecera'>    
     <%--<uc5:WUCCabeceraPrincipal2 ID="BarraPrincipal" runat="server" TabSeleccionado="" />--%>
     <uc3:WUCCabeceraPrincipal3 ID="BarraPrincipal" runat="server" />
    </div>   
    <div id="WFDisenoform_Body" style="width:100%; display:table;">
        <div style="width:100%; display:table-row; min-height:125px;" >
            <div class="tdResizablee" style="display:table-cell; border:1px solid #ccc; width:300px;" id="DivTreeTablesForm">
                <div style="width:5px; overflow:visible;">
                    <div class="PWDtree" style="width:5px;" id="cellArbol"></div>        
                </div>      
            </div>               
            <div class="tdResizablee " style=" display:table-cell; border:1px solid #ccc; background-color:#fff; height:100%; border-bottom-style:none;" id="DivDisenoform" > 
                <a name="WFDisenoFormBegin" id="WFDisenoFormBegin"></a>
                <div id="cellForm" style="width:100%; height:100%; display:block"  >
                </div>
             </div>
            <div style="display:table-cell;" class="PWDPropGeneral" id="DivElemPropGeneral">
                <div id="DivElemTit">
                    
                    <div id="DivElemClose" title="Ocultar Propiedades" class="PWDCloseProps" onclick="javascript:CloseProps();"></div>
                    <div id="DivElemPopUp" title="Abrir en modal" class="PWDPropPopUp"></div>
                    <span class="PWTitulo4 PWDPropTitulo" id="DivElemTitText"></span>
                </div>
                <div id="DivElemProp">
                </div>
            </div>
        </div>     
   </div>        
    <div id="DIVCamposOcultos" style="display:none;">
    <!-- Guarda El estado del Arbol -->
    <input type ="hidden" id="INFO_ESTADO_TREEVIEW" value="inline" runat="server"/>
    <input type ="hidden" id="INFO_TREEVIEW_SCROLL_MODE" value="0" runat="server"/>
    <input type ="hidden" id="INFO_SCROLL_POSITION" value="0" runat="server"/>    
    <asp:HiddenField ID="INFO_Tocado" runat="server" Value="0" />
    <asp:HiddenField ID="INFO_position_scroll_info" runat="server" Value ="" />  
    <!--Indica la clave actual para identificar del formulario dinamico generado -->
    <input type="hidden" value="" id="HiddenCurrentValueFormXPage" runat="server" />                
    <asp:Button ID="HiddenSelector" runat="server" Text="" style="display:none;" />     
    <input type="Hidden" value="" id="HiddenSelected" runat="server" />   
    <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div>
    <!--Div para mostrar Modal con las propiedades -->
    <div id="cellProp" class="PWModalDesigner">  </div>               
    <!-- Div para asistente copiar formulario -->
    <div id="CopyForm" class="PWModalDesigner"> 
        <div>      
            <span> Tipo de origen:</span>
            <select id="ui-val-TipoOrigen" title="Origen Tabla" class=" form-control PWTextBox PWDropdownList dropdown PWTextBoxObligatorio" onchange="UpdateAutoComplete(this,'R');$('#copywarning').toggle();">
                <option value ="1">Misma tabla que el formulario actual</option>
                <option value ="2">Cualquier tabla</option>
            </select>
            <br />
            <span class=" PWLabel" > Formulario Origen: </span>
            <input id="ui-id-NbFormOrigen" type="text" class=" ui-autocomplete-input form-control PWTextBox PWTextBoxObligatorio" autocomplete="off" title="Formulario Origen" />
            <br />
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0px; ">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 PWCaja" style="padding: 0px 5px 0px 5px;">
                <span style="font-weight:bold;">Campos/E.D./Bloques/Tabs</span>
                <br />
                <br />
                <span class =" PWLabel ">Propiedades Avanzadas:</span>
                <select id="ui-id-CopyPACtrl" class=" form-control PWTextBox PWDropdownList dropdown PWTextBoxRead">
                    <option value="0">No</option>
                    <option value="1">Si</option>
                </select>
                <br />
                <span class =" PWLabel ">Calculos:</span>
                <select id="ui-id-CopyCalcCtrl" class=" form-control PWTextBox PWDropdownList dropdown " >
                    <option value="0">No</option>
                    <option value="1">Si</option>
                </select>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 PWCaja" style="padding: 0px 5px 0px 5px;">
                <span style="font-weight:bold;">Formulario</span>
                <br />
                <br />
                <span class =" PWLabel ">Propiedades Avanzadas:</span>
                <select id="ui-id-CopyPAForm" class=" form-control PWTextBox PWDropdownList dropdown " >
                    <option value="0">No</option>
                    <option value="1">Si</option>
                </select>
                <br />
                <span class =" PWLabel ">Calculos:</span>
                <select id="ui-id-CopyCalcForm" class=" form-control PWTextBox PWDropdownList dropdown " >
                    <option value="0">No</option>
                    <option value="1">Si</option>
                </select>
            </div>
        </div>
        <div id="copywarning" style="display:none; text-align:center; height:80px;">
                    <img class='PWDWarningImg'/>
                    <span class='PWDWarning'>No se crearán columnas en la base de datos. Compruebe que existen antes de cargar el formulario destino. </span>
        </div>

    </div>
    <!-- Div para asistente nuevo formulario -->
    <div id="NewForm" class="PWModalDesigner"> 
        <br />
        <span class=" PWLabel " >Nombre de la tabla:</span>
        <input id="ui-id-selTabla" type="text" class=" ui-autocomplete-input form-control PWTextBox PWTextBoxObligatorio" autocomplete="off" title="Nombre de la tabla" />
        <br />
        <span class=" PWLabel " >Campo Id del formulario:</span>
        <input id="ui-id-selId" type="text" class=" ui-autocomplete-input form-control PWTextBox PWTextBoxObligatorio" autocomplete="off" title="Nombre del campo ID" />
        <br />
        <span class=" PWLabel " >Nombre interno del formulario:</span>
        <input id="ui-id-txtNameIntForm" type="text" class=" form-control PWTextBox PWTextBoxObligatorio" title="Nombre interno del formulario:" onkeyup="if (this.value.match(/[^a-zA-Z0-9_]/g)) this.value = this.value.replace(/[^a-zA-Z0-9]/g, '');"/>
        <br />
        <span class=" PWLabel " >Nombre externo del formulario:</span>
        <input id="ui-id-txtNameExtForm" type="text" class=" form-control PWTextBox " title="Nombre externo del formulario:" />        
    </div>
    <!-- Div para asistente nuevo campo -->
    <div id="NewCtrl" class="PWModalDesigner"> 
        <div>
            <span>Campo Existente: </span> 
            <select id="ui-val-CampoExistente" title="Campo Existente" class=" form-control PWTextBox PWDropdownList dropdown PWTextBoxObligatorio" onchange="UpdateAutoComplete(this,'F');">
                <option value=""> --Seleccione el modo de creación--</option>
                <option value="1">Columna y campo nuevo (ALTER) </option>
                <option value="2">Columna ya existente (NO ALTER)</option>
                <option value="3">Campo ya existente en otro formulario </option>
            </select>
            <br />
            <span id="ui-txt-Titulo" class=" PWLabel " >Titulo:</span>
            <input id="ui-id-Titulo" type="text" class=" form-control PWTextBox" title="Titulo" onblur="if (!$('#ui-id-NbCampo').val()) $('#ui-id-NbCampo').val(FormatNameCol(this));"/>
            <br />
            <span class=" PWLabel " >Nombre del campo:</span>
            <input id="ui-id-NbCampo" type="text" class=" ui-autocomplete-input form-control PWTextBox PWTextBoxObligatorio" autocomplete="off" title="Nombre del campo" onkeyup="FormatNameCol(this)"/>
            <select id="ui-sel-NbCampo" style="display:none;" class =" form-control PWTextBox PWTextBoxObligatorio PWDropdownList dropdown " onchange="LoadInfo(this);"></select>
            <br />
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="padding: 0px;">
                <span class=" PWLabel " >Tipo de Campo: </span> 
                <select id="ui-id-TipoCampo" class= " form-control PWTextBox PWTextBoxObligatorio PWDropdownList dropdown "onchange="EnableProps(this);"> </select>
            </div>
            <div id="ui-div-TabForm" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <span>Sobre tabla existente</span> 
                    <input id="ui-val-TablaExistente" type ="checkbox" title="Sobre tabla existente" class=" PWCheckBox " onchange="UpdateAutoComplete(this,'T');"/>
                </div>
                <div id="ui-div-TabExistente" style="display:none;" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <span class=" PWLabel " >Nombre de tabla</span>
                    <input id="ui-id-NbTabla" type="text" class=" ui-autocomplete-input form-control PWTextBox PWTextBoxObligatorio" autocomplete="off" title="Nombre de la tabla " />
                </div>
            </div>
            <div id="ui-div-subtipo" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <span id="ui-txt-subtipo" class=" PWLabel " >Long. Texto</span>
                <input id="ui-id-subtipo" type="text" class=" form-control PWTextBox PWTextBoxObligatorio" title="Longitud" onkeyup="if (this.value.match(/[^0-9]/g)) this.value = this.value.replace(/[^0-9]/g, '');"/>
            </div>
            <br />
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 10px 0px;" >
            <span>Solo lectura:</span>
            <input id="ui-val-ReadOnly" type ="checkbox" title="Solo lectura" class=" PWCheckBox "/>
            <span>Obligatorio:</span>
            <input id="ui-val-Obligatorio" type ="checkbox" title="Obligatorio" class= "PWCheckBox"/>
        </div>
    </div>  
    </div>
    </form> 
</div>   
        
</body>
<%--<script  language="javascript" type="text/javascript" >NoIncluirEnFrame();</script>--%>
<script type="text/javascript" >
    //AjustarTamanoComponentes();
    AjustarCapas();
</script>
<script  type="text/javascript" >
    //ArbolSegunEstado();    
</script>
<script type="text/javascript" >
    //PosicionarScroll();      

</script>
<script type="text/javascript" >
    window.onscroll = popup_position_scroll_info;
</script>
<script type="text/javascript">
    $(function () {       
        $(".tdResizablee").resizable({
            handles: "e"
        });
    });   

</script>
<script type="text/javascript">
    $(function () {
        var children = $("li").find("> ul > li");
        if (children.is(":visible")) {
            children.hide();
        }
    });
</script>
<script type="text/javascript">
    $(function () {
        var spNB = document.createElement("span")
        $(spNB).attr({
            id: "DisNbForm",
            style: "float: left; font-size:20px; margin-right:10px; padding-top:5px;"
        })

        var divmnu = $("<div class=' PWformulario_menu ' style='display:inline'></div>");
        $("#segundaBarra_botonera").prepend(spNB)
        $("#segundaBarra_botonera").prepend(document.getElementById("BarraPrincipal_btnNuevoForm"));
        $("#segundaBarra_botonera").prepend(document.getElementById("BarraPrincipal_btnBuscarForm"));
        $(spNB).text($("body").attr("frminicial"));
        $(spNB).after(document.getElementById("BarraPrincipal_btnPropForm"));
        $("#BarraPrincipal_btnPropForm").after(document.getElementById("BarraPrincipal_btnCopyForm"));
        //$("#segundaBarra_botonera").append(divmnu);
        //var mnuTab = $("<ul id='DISmnutab' class= ' nav nav-tabs '></ul> ");
        //$(divmnu).append(mnuTab);
        //$(mnuTab).append("<li id='liDisBuscador' class = ' PWformulario_menu_btn '><a onclick='DisplayArbolBusqueda();' class = ' PWButton PWDOpc '>Buscador de Formularios</a></li>");
        //$(mnuTab).append("<li id='liDisFormulario' class = ' PWformulario_menu_btn '><a onclick ='DisplayDisenar();' class = ' PWButton PWDOpc '>Diseño</a></li>");
        //$(mnuTab).append("<li id='liDisLista' class = ' PWformulario_menu_btn '><a onclick ='DisplayLista();' class = ' PWButton PWDOpc '>Lista</a></li>");
        //$(mnuTab).append("<li id='liDisProp' class = ' PWformulario_menu_btn '><a onclick ='DisplayPropForm(0);' class = ' PWButton PWDOpc '>Propiedades Formulario</a></li>");
        //$(mnuTab).append("<li id='liDisNewForm' class = ' PWformulario_menu_btn '><a onclick ='ShowNewFormDialog();' class = ' PWNewForm PWButton  '>Nuevo Formulario</a></li>");
        //$(mnuTab).append("<li id='liDisDelForm' class = ' PWformulario_menu_btn ' style='float: right; display: none;'><a onclick ='DeleteForm();' class = ' PWDelForm PWButton  '>Borrar este Formulario</a></li>");
        $("#DivElemPropGeneral").hide();
    })    

</script>
<script type="text/javascript">
    CargarFormularioInicial();
    ListaForms = ObtenerListaforms(); 
</script>
</html>
