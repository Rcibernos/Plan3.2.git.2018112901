<%@ page language="VB" autoeventwireup="false" inherits="ws_GenerarDocumentosUBS, App_Web_1mb1xxeu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generar Documentos</title>

     <link rel="stylesheet"  runat="server" id="MyStylesheet" href="../Css/default.css" />    
     <link rel="shortcut icon" href="../ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>  
     <script type="text/javascript" src="../JsLibs/jquery/3_3_1/jquery-3.3.1.min.js"></script>
     <script type="text/javascript" src="../JsLibs/jquery-ui-1_10_3_custom/js/jquery-ui-1.10.3.custom.min.js"></script>
     <link rel="stylesheet" href="../JsLibs/jquery-ui-1_10_3_custom/css/default/jquery-ui-1.10.4.custom.min.css"/>
     <style type="text/css">
         .modal {
            display:    none;
            position:   fixed;
            z-index:    1000;
            top:        0;
            left:       0;
            height:     100%;
            width:      100%;
            background: rgba( 255, 255, 255, .5 ) 
                        url('../images/wait.gif') 
                        50% 50% 
                        no-repeat;
        }

        /* When the body has the loading class, we turn
           the scrollbar off with overflow:hidden */
        body.loading {
            overflow: hidden;   
        }

        /* Anytime the body has the loading class, our
           modal element will be visible */
        body.loading .modal {
            display: block;
        }
     </style>
</head>
<body id="MyBody" runat="server">
    <form id="form1" runat="server">      
    <div>
        <table id="MiTablaHTML" style="width: 100%;" runat="server"> </table>
        <br />
        <table id="MiTablaHTML2" style="width: 100%;" runat="server"></table>    
    </div>
    </form>
    <div class="modal">
       <%-- <div style="margin:auto; text-align:center; margin-top: 200px;">
        <img src="../images/wait.gif" alt=""/>   --%>     
  </div>  
        <script type="text/javascript">

            function WaIt() { var MyBody = document.getElementById("MyBody"); if (MyBody) { MyBody.className = "loading"; } }
            function EndWaIt() { var MyBody = document.getElementById("MyBody"); if (MyBody) { MyBody.className = ""; } }       

            function procesando(idElement) {
                var item = document.getElementById(idElement)
                if (item) { item.innerHTML = "-----------------------> Procesando";  }
            }

            function sustituirElementosEnPlantillas(tipoDocumento, idVistaRegistroForm, nombre, formulario, guardarComoPDF, idCliente, i) {
  
                var str1 = "row";
                var res = str1.concat(i);
                var item = document.getElementById(res)

//                var texto = '-----------------------> Procesando';                
//                //document.getElementById(res).firstChild.data = texto; //<img src="loadingRow.gif" alt="" style="width:200px; height:auto;">
//                item.innerHTML = texto;
//                item.focus();

                var R = ws_GenerarDocumentosUBS.SustituirValorEnDocumento(tipoDocumento, idVistaRegistroForm, nombre, formulario, guardarComoPDF, idCliente);
                //document.getElementById(res).firstChild.data = R.value;
                //document.getElementById(res).innerHTML = R.value;
                item.innerHTML = R.value;
                //item.focus();
                        
            }


            function unirDocumentos(idAgenda, grupo, idPacks, titulo, x, guardarEnPDF) {

             
                var str1 = "rowUnir";
                var res = str1.concat(x);
                var item = document.getElementById(res)
//                var texto = '-----------------------> Procesando';
//                var item = document.getElementById(res)
//                item.innerHTML = texto;
//                item.focus();
                //document.getElementById(res).firstChild.data = texto; //<img src="loadingRow.gif" alt="" style="width:200px; height:auto;">                
                var generarDocumentos = ws_GenerarDocumentosUBS.UnirDocumentos(idAgenda, grupo, idPacks, titulo, guardarEnPDF)
                //document.getElementById(res).firstChild.data = generarDocumentos.value;
                item.innerHTML = generarDocumentos.value;
                //item.focus();
                
            }

            function mostrarCerrarVentana() {
                //  parent.document.getElementById("CAMPOFORM_BTCANCELWF_PROCESO_69_GENERALJURIDICA__ControlParaCrearFormulariosModales_WF_PROCESO_69_GENERALJURIDICA").click();
                EndWaIt();
                alert("El proceso ha finalizado");
                var axpa = parent.document.getElementById("CAMPOFORM_BTCANCELWF_PROCESO_69_GENERAL__ControlParaCrearFormulariosModales_WF_PROCESO_69_GENERAL");
                if (axpa) axpa.style.display = "inline"; //block               

            }

            function OcultarCerrarVentana() {                
                var axpa = parent.document.getElementById("CAMPOFORM_BTCANCELWF_PROCESO_69_GENERAL__ControlParaCrearFormulariosModales_WF_PROCESO_69_GENERAL");
                if (axpa) axpa.style.display = "none"; //block               
            }

            OcultarCerrarVentana();
     </script>

</body>
<%--<script type ="text/javascript" >
    SubirDocumentos()
</script>--%>
</html>
