<%@ page language="VB" autoeventwireup="false" inherits="WFListaActividades, App_Web_irmiclv2" maintainscrollpositiononpostback="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<%@ Register Src="WUCTabButtonNet.ascx" TagName="WUCTabButtonNet" TagPrefix="uc1" %>
<%@ Register Src="WUCTabButton.ascx" TagName="WUCTabButton" TagPrefix="uc2" %>

<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">             
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />  
    <title>Lista de Actividades</title>            
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>    
    <%--<script type="text/javascript" src="./JsLibs/jquery.js"></script>--%>
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/respond.min.js"></script>--%>       
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
</head>
<body id="MyBody" runat="server" onresize="javascript:AjustarTamanoComponentes();" style="width:100%; height:100%; border:0; left:0px; overflow:auto;" >    
    <div runat="server" id="DivCapaRecarga" class="" style="width:100%; height:100%; position:absolute;  overflow: hidden; left: 12px; top: 352px; display:none;">        
      <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
    </div>    
    <script type="text/javascript" >ShowPantallaEnEspera();</script>
    <style id="DynamicStyles" runat="server"></style>
    <form  autocomplete="off" id="form1" runat="server" style="min-height:800px; border:0px; left:0px">    
    <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>     
    <table style="width:100%; " class="PWcabecera_toolbar PWcabecera_Primervistazo" id="DivCabecera" runat="server"><tr>
    <td>&nbsp;</td>
    <td style="width:25px; max-width:25px; text-align:left; display:inline;">
    <asp:ImageButton ID="ImageButtonRefrescar" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Refrescar" ToolTip="Refrescar"   />
    </td> 
    <td id="TDTabButtonFiltro" runat="server" style="width:25px; max-width:25px;text-align:left;">
    <div class="btn-group">
    <button type="button" runat="server" id="TabButtonFiltro" class="dropdown-toggle" data-toggle="dropdown">
       <img runat="server" id="TabButtonFiltroImg" src="./images/default/vacio.png" alt="Filtro" /><span class="caret"></span>
    </button>
    <ul id="UlBotonera" runat="server" class="dropdown-menu" role="menu">
    </ul>        
       <%--<ul class="dropdown-menu" role="menu">
        <li><a href="#">Acción #1</a></li>
        <li><a href="#">Acción #2</a></li>
        <li><a href="#">Acción #3</a></li>
        <li class="divider"></li>
        <li><a href="#">Acción #4</a></li>
      </ul>--%>
  </div>
    <%--<asp:ImageButton ID="TabButtonFiltro" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Filtros" ToolTip="Refrescar"   />--%>
    </td>   
    <td id="TDTabButtonSelAll" runat="server" style="width:25px; max-width:25px; text-align:left;">
    <asp:ImageButton ID="TabButtonSelAll" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Seleccionar todo" ToolTip="Seleccionar todo"   />    
    </td> 
    <td id="TDTabButtonUSelAll" runat="server" style="width:25px; max-width:25px;text-align:left;">
    <asp:ImageButton ID="TabButtonUSelAll" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Des-seleccionar todo" ToolTip="Des-Seleccionar todo"   />
    </td>
    <td id="TDTabButtonPrintSelDocs" runat="server" style="width:25px; max-width:25px;text-align:left;">
    <asp:ImageButton ID="TabButtonPrintSelDocs" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Imprimir" ToolTip="Imprimir"   />
    </td>
    <td id="TDTabButtonPrintSel" runat="server" style="width:25px; max-width:25px;text-align:left;">
    <asp:ImageButton ID="TabButtonPrintSel" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Imprimir seleccionados" ToolTip="Imprimir seleccionados"   />
    </td>
    <td id="TDTabButtonPrintExcel" runat="server" style="width:25px; max-width:25px;text-align:left;">
    <asp:ImageButton ID="TabButtonPrintExcel" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Exportar a Excel" ToolTip="Exportar a Excel"   />
    </td>
    <td id="TDTabButtonMarcarComoNoLeidos" runat="server" style="width:25px; max-width:25px;text-align:left;">
    <asp:ImageButton ID="TabButtonMarcarComoNoLeidos" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Marcar como no leido" ToolTip="Marcar como no leido"   />
    </td>
    <td id="TDTabButtonMarcarComoLeidos" runat="server" style="width:25px; max-width:25px;text-align:left;">
    <asp:ImageButton ID="TabButtonMarcarComoLeidos" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Marcar como leido" ToolTip="Marcar como leido"   />
    </td>    
    <td id="TDTabButtonMarcarSeguimiento" runat="server" style="width:25px; max-width:25px;text-align:left;">
    <asp:ImageButton ID="TabButtonMarcarSeguimiento" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Añadir marca de seguimiento" ToolTip="Añadir marca de seguimiento"   />
    </td>
    <td id="TDTabButtonDesmarcarSeguimiento" runat="server" style="width:25px; max-width:25px;text-align:left;">
    <asp:ImageButton ID="TabButtonDesMarcarSeguimiento" runat="server" ImageUrl="./images/default/vacio.png" AlternateText="Quitar marca de seguimiento" ToolTip="Quitar marca de seguimiento"   />
    </td> 
    <td style="width:25px; max-width:25px;text-align:left; display:inline; ">
    <img  src="./images/default/vacio.png" alt="scroll"  style=""  usemap="#arrowmap" runat="server" id="WFListaActividades_arrowmap" />
    <map name="arrowmap" >
      <area runat="server" id="WFListaActividades_arrowmap_up" shape="rect" coords="0,0,24,7"  alt="up"  onmousedown="javascript:IniciarScrollV('DivListaActividades',-5);" onmouseout="javascript:DetenerScrollV();" onclick="javascript:UnaPosicionScrollV(('DivListaActividades',-5))" onmouseup="javascript:DetenerScrollV();"/>
      <area runat="server" id="WFListaActividades_arrowmap_left" shape="rect" coords="0,8,11,11" alt="left" onmousedown="javascript:IniciarScroll('DivListaActividades',-5);" onmouseout="javascript:DetenerScroll();" onclick="javascript:UnaPosicionScroll(('DivListaActividades',-5))" onmouseup="javascript:DetenerScroll();" />
      <area runat="server" id="WFListaActividades_arrowmap_right" shape="rect" coords="11,8,24,14" alt="right" onmousedown="javascript:IniciarScroll('DivListaActividades',5);" onmouseout="javascript:DetenerScroll();" onclick="javascript:UnaPosicionScroll(('DivListaActividades',5))" onmouseup="javascript:DetenerScroll();" />
      <area runat="server" id="WFListaActividades_arrowmap_down" shape="rect" coords="0,15,24,24" alt="down" onmousedown="javascript:IniciarScrollV('DivListaActividades',5);" onmouseout="javascript:DetenerScrollV();" onclick="javascript:UnaPosicionScrollV(('DivListaActividades',5))" onmouseup="javascript:DetenerScrollV();" />
    </map>       
    </td>    
    <td style="vertical-align:middle; text-align:left;display:inline; max-width:200px; width:200px; min-width:100px; " >        
    <asp:Label ID="WFListaActividades_LabelContador" runat="server" Style="" Text="0 Filas" ></asp:Label>    
    </td>    
    <td style="vertical-align:middle; text-align:left; max-width:300px; width:300px; min-width:200px;" >
       <span id="WFListaActividades_SpanPaginacion" runat="server"></span>
    </td>
    <td style="vertical-align:middle; text-align:left;display:inline;" id="Td1">    
    <asp:Label ID="LabelTitulo" runat="server" Style=" text-align:left; display:none;"></asp:Label>
    </td>
    <td >&nbsp;</td>       
    </tr>
    </table>
    <div id="DivBotonera" runat="server" style="border:0px; left:0px;  width:100%;" class="PWFondoToolBar">    
    <table style="width:100%;">
    
    </table>       
    </div>    
    <div id="DivListaActividades" runat ="server" class="PWFondo" style="overflow:visible;">            
        &nbsp;&nbsp;        
    </div>  
    <div runat="server" id="DivBotonesOcultos" style="display:none; position:absolute; overflow:hidden ; left:4px; top:151px;" >
    <asp:Button ID="ButtonMarca" runat="server" Text="Button" style="display:none;"/>
    <asp:Button ID="ButtonVisto" runat="server" Text="Button" style="display:none;"/>
    <asp:Button ID="ButtonAbrir" runat="server" Text="Button" style="display:none;"/>
    <asp:HiddenField ID="HiddenFieldId" runat="server" />
    <asp:HiddenField ID="HiddenFieldOpcion" runat="server" />
    </div>
    <div id="Div_ContrlesOcultos" style="display:none;">
    <input type="hidden" value="" id="WFListaActividadesModo" runat="server" />
    <input type="hidden" value="" id="WFListaActividadesBusqueda" runat="server"/>
    <input runat="server" type="hidden" id="HiddenNombreIFRameContenedorDeEstaPagina" />
    <input type="hidden" value="" id="MyCalculateHeight" />
    <input type="hidden" value="" id="MyCalculateWidth" />
    <input type="hidden" value="" id="HiddenModofuncionamiento" runat="server" />
    <input type="hidden" value="0" id="HiddenExportarAExcel" runat="server" />
    <input type="hidden" value="" id="HiddenLISTAACTIVTABLE_SELECCIONADOS" runat="server" />    
    <iframe runat="server" id="iframeExportarAExcel" style="display:none; width:0px; height:0px;" width="0px" src="./WFVacia.aspx"></iframe>
    </div>
    <%--<div runat="server" id="DivMenuContextual" style="position:absolute;" ></div>--%>
    <script  type="text/javascript" >
    function ClickElement(IdBoton2Click)
    {
        B=document.getElementById(IdBoton2Click);                
        if (B)
        {
            B.click();    
        }
    }
    
    function TrMarca(Id,Marca)
    {
        HId=document.getElementById("HiddenFieldId");        
        HOp=document.getElementById("HiddenFieldOpcion");
        HId.value=Id;
        HOp.value=Marca;
        ClickElement("ButtonMarca")        
    }
    
    function TrVisto(Id,Visto)
    {
        HId=document.getElementById("HiddenFieldId");        
        HOp=document.getElementById("HiddenFieldOpcion");
        HId.value=Id;
        HOp.value=Visto;
        ClickElement("ButtonVisto")        
    }
    
    function TrAbrir(Id)
    {
        Tr=document.getElementById("TRHidden"+Id);          
        ClickElement("TRHidden"+Id) 
    }
    
    function TrVistaPreliminar(Id)
    {
        HId=document.getElementById("HiddenFieldId");                
        HId.value=Id;
        ClickElement("ButtonAbrir")       
    }   
    
</script> 
<script  type="text/javascript"  >    
   AjustarTamanoComponentes();
</script>
<script  type="text/javascript" >    
    HidePantallaEnEspera();        
</script>   
<script type="text/javascript" >
    function PreviewAgendaIfr(aId) {
        var seltr = document.getElementById('TRPrevieW' + aId);
        var seltd = document.getElementById('TDPrevieW' + aId);
        var selOpener = document.getElementById('TRListaActiv' + aId);  
        var IcoOpenClose = document.getElementById('BtnPreview' + aId);
        var aBrir = false;
        if (seltr) if (seltr.style.display == 'none') { aBrir = true; }
        var tbrows = document.getElementById('LISTAACTIVTABLE');
        var troww = tbrows.getElementsByTagName('tr');
        for (i = 0; i < troww.length; i++) {
            if (troww[i].id) if (troww[i].id.indexOf('TRPrevieW') >= 0) {
                troww[i].style.display = 'none';                
                var tdcell = troww[i].cells[0];
                if (tdcell) { if (tdcell.firstChild) tdcell.removeChild(tdcell.firstChild); }
                }
            else if (troww[i].id.indexOf('TRListaActiv') >= 0) {
                var tdcell = document.getElementById('BtnPreview' + troww[i].id.replace('TRListaActiv', ''));
                if (tdcell) { tdcell.className=tdcell.className.replace('PWPreviewClose', 'PWPreviewOpen'); }
            }           
        }
        if (aBrir) {
            if (seltr && seltd) {
                seltr.style.display = 'table-row';
                var ifrvp = document.createElement('iframe');
                ifrvp.src = './WFProcesoPrint.aspx?id=' + aId + '&preview=1';
                ifrvp.style.width = '100%';
                ifrvp.style.height = '100%';
                ifrvp.style.border = '0';
                ifrvp.id = "iframePreview" + aId;
                seltd.appendChild(ifrvp);
                ifrvp.scrolling = 'auto';
                seltr.style.height = "500px";
                seltr.style.minHeight = "500px";
            }
            if (IcoOpenClose) { IcoOpenClose.className = IcoOpenClose.className.replace('PWPreviewOpen', 'PWPreviewClose'); }
            if (selOpener) {selOpener.className=selOpener.className.replace("rowdestacado", ""); }
        }
        
    }
</script>  
</form>
    
</body>
</html>
