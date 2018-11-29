<%@ page language="VB" autoeventwireup="false" inherits="WFCalendario, App_Web_g53dfrix" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register src="WUCCabeceraPrincipal3.ascx" tagname="WUCCabeceraPrincipal3" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head  id="Head1" runat="server">    
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Calendario</title>              
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <style type="text/css"> .ajax__calendar_container { z-index : 1000 ; } </style>                
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>         
    <link rel="stylesheet" type="text/css" href="JsLibs/timeentry/jquery.timeentry.css"/>
    <script type="text/javascript" src="JsLibs/timeentry/jquery.plugin.min.js"></script> <script type="text/javascript" src="JsLibs/timeentry/jquery.timeentry.min.js"></script>
    <link href='./JsLibs/fullcalendar/fullcalendar.css' rel='stylesheet' />   
    <link href='./JsLibs/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
    <script type="text/javascript" src='./JsLibs/moment/moment.min.js'></script>        
    <script type="text/javascript" src='./JsLibs/fullcalendar/fullcalendar.min.js'></script>
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />    
</head>
<body runat="server" id ="MyBody" style="width:100%; height:100%; overflow:auto;" onresize="javascript:AjustarCapas();"  >
<script  type="text/javascript" >
    function SelectDiaCalendarioMini(a_anio, a_mes, a_dia, aView) {        
        a_date = new Date(a_anio, a_mes, a_dia);
        if (a_anio != fullcalendar_getFullYear() || a_mes != fullcalendar_getMonth()+1) {
            document.getElementById("CalendarioCabeceraTituloMES").value = a_mes;
            document.getElementById("CalendarioCabeceraTituloANIO").value = a_anio;
            Carga_Fecha(aView);
        }
        $("#DivFullCalendar").fullCalendar('gotoDate', a_anio, (a_mes - 1), a_dia);
        /*document.getElementById('HiddenFielDate').value = a_dia;*/        
        if (aView == "agendaDay" || aView == "basicDay") { document.getElementById("CalendarioCabeceraVista_Dia").click(); }
        else if (aView == "agendaWeek" || aView == "basicWeek") { document.getElementById("CalendarioCabeceraVista_Semana").click(); }
        else if (aView == "month") { document.getElementById("CalendarioCabeceraVista_Mes").click(); }        
   }
   function Carga_Fecha(aView) {
        if (aView == "") { aView = "month" };
        clid=document.getElementById("HiddenFieldCalendario").value;
        comboM = document.getElementById("CalendarioCabeceraTituloMES");
        comboY = document.getElementById("CalendarioCabeceraTituloANIO");
        var aAux = "";
        if (parseInt(comboM.value) <= 9) { aAux="0"; }
        var fechstr = comboY.value + aAux + comboM.value + "01";
        WFCalendario_call_Shrd_CargarCalendario(clid, fechstr, aView, "");
        SelectedView(document.getElementById("CalendarioCabeceraVista_Mes"), aView); 
    }
    function fullcalendar_getView() {
        try {
            var Current_view = $("#DivFullCalendar").fullCalendar("getView");
            if (Current_view.name) return Current_view.name;            
            return "";
        }
        catch (err) { return ""; }
    }

    function fullcalendar_getDate() {
    try{
        var Current_date = $("#DivFullCalendar").fullCalendar("getDate");         
        return Current_date.getDate();        
        } catch (err) { return ""; }
    }

    function fullcalendar_getMonth() {
        try {
            var Current_date = $("#DivFullCalendar").fullCalendar("getDate");  
            return Current_date.getMonth();
        } catch (err) { return ""; }
    }

    function fullcalendar_getFullYear() {
        try {
            var Current_date = $("#DivFullCalendar").fullCalendar("getDate");
            return Current_date.getFullYear();
        } catch (err) { return ""; }
    }

    function getCalendarId() { 
        return document.getElementById("HiddenFieldCalendario").value; 
    }
    
    function fullcalendar_getStrDate()    {  
        var strYear = fullcalendar_getFullYear();  
        var strMonth = fullcalendar_getMonth() +1;
        var strDay = fullcalendar_getDate();
        if (strDay == "") return "";
        var Result = strYear.toString()+ (strMonth <= 9 ? "0": "") +strMonth.toString() + (strDay <= 9 ? "0": "") +strDay.toString();        
        return Result;
    }   

    function fSelectTable(auxfecha,auxview) {       
        var aTable = document.getElementById("cMiniMes");
        var currentview = fullcalendar_getView();        
        var currentStrDate = fullcalendar_getStrDate();             
        var DayId = "cMiniDAY" + currentStrDate
        if (currentview == "") { currentview = (auxview ? auxview : "agendaWeek"); }
        if (currentStrDate == "" && auxfecha) {
            DayId = "cMiniDAY" + auxfecha;
            currentStrDate = auxfecha;
        }       
        var trrs = aTable.getElementsByTagName("tr");
        var i = 0;
        for (i = 1; i < trrs.length; i++) {
            var tdds = trrs[i].getElementsByTagName("td");
            if (trrs[i].className) { trrs[i].className = trrs[i].className.replace(" PWCalendarioMiniSemanaSeleccionada", ""); }            
            var j = 0;
            //Deselecciona todo lo que estuviera antes seleccionado
            for (j = 0; j < tdds.length; j++) {
                if (tdds[j].className) { tdds[j].className = tdds[j].className.replace(" PWCalendarioMiniDiaMarcoSeleccionado", ""); }
            }
            //Busca lo que toca seleccionar ahora
            for (j = 0; j < tdds.length; j++) {               
               if (DayId == tdds[j].id) {
                   if (currentview == 'agendaDay' || currentview == 'basicDay') { tdds[j].className = tdds[j].className + " PWCalendarioMiniDiaMarcoSeleccionado"; }
                   else if (currentview == 'agendaWeek' || currentview == 'basicWeek') {
                       for (k = 1; k < tdds.length; k++) 
                           if (tdds[k].className != "PWCalendarioMiniSemana") tdds[k].className = tdds[k].className + " PWCalendarioMiniDiaMarcoSeleccionado";
                   }
               }
           }
       }
       //Actualiza por Ajax el estado del calendario por si hay que volver que recuerde el estado anterior      
       WFCalendario.Shrd_Act(getCalendarId(), currentStrDate, currentview);       
    }  
    function SelectedView(Botonvista) {
        fSelectTable();
        VistaYear = document.getElementById("CalendarioCabeceraVista_Year");
        VistaMes = document.getElementById("CalendarioCabeceraVista_Mes");
        VistaSemana = document.getElementById("CalendarioCabeceraVista_Semana");
        VistaDia = document.getElementById("CalendarioCabeceraVista_Dia");
        if (VistaYear) { VistaYear.className = VistaYear.className.replace(" current ", ""); }
        if (VistaMes) { VistaMes.className = VistaMes.className.replace(" current", ""); }
        if (VistaSemana) { VistaSemana.className = VistaSemana.className.replace(" current", ""); }
        if (VistaDia) { VistaDia.className = VistaDia.className.replace(" current", ""); }
        if (Botonvista.className.indexOf(" current") < 0) { Botonvista.className = Botonvista.className + " current"; }
    } 
    function YearView(enab) {
        eraVYear = (DivCalendarioAnual.style.display != "none");
        if (enab) {
            clid = document.getElementById("HiddenFieldCalendario").value;            
            comboY = document.getElementById("CalendarioCabeceraTituloANIO");

            result = WFCalendario.Shrd_CargaryearView(clid, comboY.value);
            if (!result) { YearView(false); return; }
            DivCalendarioAnual.innerHTML = result.value[0];

            DivCalendarioMini.style.display = "none";
            DivFullCalendar.style.display = "none";
            DivCalendarioAnual.style.display = "block";            
        }
        else {
           DivCalendarioAnual.style.display = "none";
           DivCalendarioMini.style.display = "block";
           DivFullCalendar.style.display = "block";
           if (eraVYear) {
               WFCalendario_call_Shrd_CambioDeFiltroSame(clid); 
             }                    
        }
   }
   function isYearView() {return (DivCalendarioAnual.style.display != "none"); }
</script>
<div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;">           
  <!--Noscript-->            
</div>    
<div id="content" runat="server" style="visibility:visible; height:100%; overflow:auto;" class="PWContent PWContentCalendario">
    <style id="DynamicStyles" runat="server"></style>
    <form  autocomplete="off" id="form1" runat="server" style=" margin:0px; width:100%; height:100%;"> 
    <a runat="server" id="modalista" style="display:none;"></a>
     <asp:ScriptManager ID="MyScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager>   
     <input type="hidden" value="" id="Hidden_IndicativoModal" runat="server" />        
     <div runat="server" id="DivCapaOpaca" style="width:100%; position:fixed; overflow: hidden; left: 0px; top: 0px; height: 46px; display:none;" class=""></div>  
     <div runat="server" id="DivCapaModal" style="position:absolute; z-index:201; display:none;" class="PWFondoFormulario"></div>                
     <div runat="server" id="DivCapaRecarga" class="" style="width:344px; position:absolute;  overflow: hidden; left: 12px; top: 352px; height: 46px; display:none;">        
     <!--<img runat="server" id="ImgCapaRecarga" class="PWSobreCapaRecarga" src="./images/wait.gif" style="position:absolute; z-index:201; display:none;" alt="Espere"/>        -->
     </div>
    <div runat="server" id="DivCabecera" class='PWCabecera'  >                
            <uc2:WUCCabeceraPrincipal3 ID="BarraPrincipal" runat="server" TabSeleccionado="Inicio" />
    </div>
    <div style="width:100%; clear:both;" runat="server" id="CalendarioMiniCuerpo" >
    <table style="width:100%; height:100%;">
    <tbody style="width:100%; height:100%;">
    <tr></tr>
    <tr>
    <td style="width:200px; vertical-align:top;" runat="server" id="tdCalendarioMini">
        <div runat="server" id="DivCalendarioMini" class=""></div>
        <div runat="server" id="DivCalendarioFiltros" class=""></div>
    </td>    
    <td style="width:100%; height:100%;"  >        
        <div runat="server" style="width:100%; height:100%;" id="DivFullCalendar" ></div>
        <div runat="server" style="width:100%; height:100%;" id="DivCalendarioAnual" ></div>
    </td>   
    </tr></tbody>
    </table>
    </div> 
    <div id="DivSelectorDeAltas" style="display:none;">
    <div runat="server" id="PWCalendario_SelectorDeAltas"  >
     <div runat="server" id="PWCalendario_SelectorDeAltasCab" ><span runat="server" id="PWCalendario_SelectorDeAltasTitulo">Seleccione que tipo de elemento va a dar de alta</span><span runat="server" id="PWCalendario_SelectorDeAltasCancel" title="cancelar">&nbsp;</span></div>
     <ul runat="server" id="PWCalendario_SelectorDeAltasLista"></ul>
    </div>
    </div> 
    <div runat="server" id="DivControlesOcultos" style="display:none;" >
        <asp:HiddenField ID="INFO_Tocado" runat="server" Value ="" />
        <asp:HiddenField ID="INFO_position_scroll_info" runat="server" Value ="" />  
        <asp:HiddenField ID="HiddenFieldFecha" runat="server" Value ="" />        
        <asp:HiddenField ID="HiddenFieldFiltros" runat="server" Value ="" />                
        <asp:Button ID="PWCalendario_ClickOnEvent" runat="server" Text="Button" />

        <asp:HiddenField ID="HiddenFieSelectFini" runat="server" Value ="" />        
        <asp:HiddenField ID="HiddenFieSelectFfin" runat="server" Value ="" />                
        <asp:HiddenField ID="HiddenFieSelectTipo" runat="server" Value ="" />
        <asp:Button ID="PWCalendario_Select" runat="server" Text="Button" />

        <asp:HiddenField ID="HiddenFielEvento" runat="server" Value ="" />                                                         
        <asp:HiddenField ID="HiddenFieldCalendario" runat="server" Value ="" /> 
        <input type="hidden" value="" id="HiddenCurrentValueFormXPage" runat="server" /> 
        <input type="button" value="" id="WFCalendario_refresh" runat="server" style="display:none" />         
        <div runat="server" id="HiddenDIV_FormularioOculto" style="display:none; width:0px; height:0px;"></div>
    </div> 
    </form>
 </div>    
</body>
<script type="text/javascript"> AjustarCapas();</script>
<script type="text/javascript"> window.onscroll = popup_position_scroll_info;</script>
</html>
