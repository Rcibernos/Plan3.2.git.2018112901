<%@ page language="VB" autoeventwireup="false" inherits="WFDebug, App_Web_b11o5nua" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/> --%>
     <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
    <title></title>
    <style id="WFDebugDS" type="text/css">        
        .modal-body > input[type=checkbox] { margin-right:5px;   }
    </style> 
    <style id="WFDebugDS_PWDbgSistema" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgAgenda" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgArbol" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgAviso" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgCalendario" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgCampo" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgCampoForm" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgED" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgFormulario" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgPrimerVistazo" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgRepositorio" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgTab" type="text/css"></style> 
    <style id="WFDebugDS_PWDbgWebService" type="text/css"></style> 
</head>
<body runat="server" id ="MyBody">        
    <form autocomplete="off" id="form1" runat="server">   
    <div style="position:fixed; top:0; left:0; padding:10px; background-color: #fff; width: 100%; border-bottom:1px solid #ccc;" >
    <span class="PWButton" id="WFDebug_Filtro" runat="server" title="Filtra resultados">Filtrar resultados</span>    
    <input type="button" class="PWButton" value ="Limpiar" id="WFDebug_Limpiar" runat="server" title="Limpia la pantalla de logs antiguos y reinicia el log" />    
    <input type="button" class="PWButton" value ="Pausar" id="WFDebug_Pausar" runat="server" title="Pausa la lectura del log. El log sigue activo" />    
    <input type="button" class="PWButton" value ="Reanudar" id="WFDebug_Reanudar" runat="server" title="Reanuda el Log donde se dejó"/>            
    <span > Registros a mostrar: </span>    
    <input type="text" id="Limite" class=" form-control PWTextBox " maxlength="4" value ="1000" title="Número máximo de registros a mostar" style="width: 100px; display: inline-block;"/>            
    <span id="Counter"></span>
    </div>
     <table id="MiTabla" class=" table table-condensed " style="margin-top:50px;">
     <tr class="PWTableHeader">
     <td class="PWTableCellHeader">Tipo</td>
     <td class="PWTableCellHeader">Hora</td>
     <td class="PWTableCellHeader">Msg.</td>          
     <td class="PWTableCellHeader">Info</td>
     <td class="PWTableCellHeader">Traza</td>
     </tr>
    </table>
    <input type="hidden" id="status" value="1"/>
        <div id='WFDebug_MdlActMd' class='modal fade' role='dialog'>
            <div class='modal-dialog'>
                <div class='modal-content'>
                  <div class='modal-header'>
                  <button type='button' class='close' data-dismiss='modal'>&times;</button>
                  <h4 class='modal-title' runat="server" id="WFDebug_MdlActMd_title" >Prueba</h4>
                  </div>
                 <div class='modal-body'>
                     <input type="checkbox" checked  id="WFDebugF_PWDbgAgenda" />&nbsp;<span id="WFDebugFLB_PWDbgAgenda">Eventos de procesos</span><br/>
                     <input type="checkbox" checked id="WFDebugF_PWDbgFormulario" />&nbsp;<span id="WFDebugFLB_PWDbgFormulario">Eventos y calculos de formularios</span><br/>
                     <input type="checkbox" checked id="WFDebugF_PWDbgCampo" />&nbsp;<span id="WFDebugFLB_PWDbgCampo">Eventos y calculos de campos</span><br/>
                     <input type="checkbox" checked id="WFDebugF_PWDbgCampoForm" />&nbsp;<span id="WFDebugFLB_PWDbgCampoForm">Eventos y calculos de campos-formulario</span><br/>
                     <input type="checkbox" checked id="WFDebugF_PWDbgED" />&nbsp;<span id="WFDebugFLB_PWDbgED">Eventos y calculos de elementos de diseño</span><br/>
                     <input type="checkbox" checked id="WFDebugF_PWDbgTab" />&nbsp;<span id="WFDebugFLB_PWDbgTab">Eventos y calculos de pestañas/tabs</span><br/>            
                     <input type="checkbox" checked id="WFDebugF_PWDbgRepositorio" />&nbsp;<span id="WFDebugFLB_PWDbgRepositorio">Repositorios</span><br/>
                     <input type="checkbox" checked id="WFDebugF_PWDbgArbol" />&nbsp;<span id="WFDebugFLB_PWDbgArbol">Repositorios de tipo árboles</span><br/>
                     <input type="checkbox" checked id="WFDebugF_PWDbgCalendario" />&nbsp;<span id="WFDebugFLB_PWDbgCalendario">Calendarios</span><br/>
                     <input type="checkbox" checked id="WFDebugF_PWDbgPrimerVistazo" />&nbsp;<span id="WFDebugFLB_PWDbgPrimerVistazo">Primer vistazo</span><br/>
                     <input type="checkbox" checked id="WFDebugF_PWDbgSistema" />&nbsp;<span id="WFDebugFLB_PWDbgSistema" >Consultas del sistema</span><br/>                     
                 </div>
               </div>
            </div>
          </div>
    </form>
</body>
<script type="text/javascript">       
    function Doit() {
        var status_ = document.getElementById("status");        
        try {
            //var Result = cAjaxAux.DebugGetBuffer(status_.value);            
            var Result;
            var ParamAux = { status: status_.value };
            var ParamJson = JSON.stringify(ParamAux);
            $.ajax({
                type: "POST",
                url: cUtilUrlPathName + "/ws/ajxtool.asmx/DebugGetBuffer",
                contentType: "application/json; charset=utf-8",
                data: ParamJson,
                async: false,
                timeout: 15000,
                dataType: "json",
                success: function (res) { Result = Resd(res); },
                error: function (xhr) { alert('Error en ajax [DebugGetBuffer]:' + xhr.status + ' ' + xhr.responseText); }
            })
            
            var tabla = document.getElementById("MiTabla");
            //if (Result.value != null) {
            if (Result){
                /*for (i = 0; i < Result.value.length; i++) {*/
                for (i = 0; i < Result.length; i++) {
                    var row1 = tabla.insertRow(1);                   
                    //row1.className = Result.value[i][0];
                    //row1.innerHTML = Result.value[i][1];
                    row1.className = Result[i][0];
                    row1.innerHTML = Result[i][1];
                    borrar();
                }
            }
            document.getElementById("Counter").innerText = '' + $('#MiTabla >tbody >tr').length + " Rows"
        }
        catch (errrr) 
        { alert(errrr); }        
       
        if (status_.value == 1) { window.setTimeout(Doit, 1000); }
        else { alert("pause2"); }
     }

     function reanudar() {
         document.getElementById("status").value = 1;         
         Doit();
     }

     function pausar() {
         document.getElementById("status").value = 0;
         Doit();
     }

     function limpiar() {
         var tabla = document.getElementById("MiTabla");
         var auxinnerHTML = tabla.rows[0].innerHTML;
         tabla.innerHTML = "";
         hrow = tabla.insertRow(0);
         hrow.innerHTML = auxinnerHTML;
         hrow.className = "PWTableHeader"
         //cAjaxAux.DebugClear();
         //var ParamAux = {};
         //var ParamJson = JSON.stringify();
         $.ajax({
             type: "POST",
             url: cUtilUrlPathName + "/ws/ajxtool.asmx/DebugClear",
             contentType: "application/json; charset=utf-8",
             //data: ParamJson,
             async: false,
             //timeout: 15000," & vbNewLine &
             dataType: "json",
             //success: function (res) { Result = Resd(res); },
             error: function (xhr) { alert('Error en ajax [DebugClear]:' + xhr.status + ' ' + xhr.responseText); }
         })


     }

     function borrar() {
         var vLimite = parseInt(document.getElementById("Limite").value);
         if (vLimite == NaN) { vLimite = 1000 };
         var tabla_ = document.getElementById("MiTabla");
         if (tabla_.rows == null) return;
         if (tabla_.rows.length <= vLimite) return;
         for (j = tabla_.rows.length; j > vLimite; j--) {             
             tabla_.deleteRow(j-1);
         }
         
     }

     function csshide(element) {
         var idclass = element.id.replace("WFDebugF_", "");
         $("#WFDebugDS_" + idclass).html("." + idclass + " { display:" + (element.checked ? "table-row" : "none") + "}");
     }
     //Lanza el timeout
     window.setTimeout(Doit, 1000);
     $("#WFDebug_Limpiar").click(function () { limpiar(); });
     $("#WFDebug_Pausar").click(function () { pausar(); });
     $("#WFDebug_Reanudar").click(function () { reanudar(); });
     $("#WFDebug_Filtro").click(function () { $('#WFDebug_MdlActMd').modal(); });
     $("input[type=checkbox]").click(function () { csshide(this); });

</script>
</html>
