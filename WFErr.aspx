<%@ page language="VB" autoeventwireup="false" inherits="WFErr, App_Web_b11o5nua" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
     <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
     <%--jquery-ui--%>
     <%--<link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>--%>
     <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default2016.css" />
     <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>
     <title>Errors</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="position:fixed; top:0; left:0; padding:10px; background-color: #fff; width: 100%; border-bottom:1px solid #ccc;" >
    <input type="text" class="PWtextbox" value ="" id="WFErr_txtsearch" runat="server" title="Texto de búsqueda" />    
    <input type="text" class="PWtextbox" value ="" id="WFErr_txtFechaDesde" runat="server" title="FechaDesde" />    
    <input type="text" class="PWtextbox" value ="" id="WFErr_txtFechaHasta" runat="server" title="FechaHasta" />                           
    <input type="button" class="PWButton" value ="Limpiar" id="WFErr_Buscar" runat="server" title="Busca en el log de errores" />           
    <span id="Counter"></span>
    </div>
    <table id="MiTabla" class=" table table-condensed " style="margin-top:50px;">
        <thead><tr class="PWTableHeader">
         <td class="PWTableCellHeader">Tipo</td>
         <td class="PWTableCellHeader">Fecha</td>
         <td class="PWTableCellHeader">Usuario</td>          
         <td class="PWTableCellHeader">Datos</td>     
         </tr>
         </thead>
        <tbody id="MiTablaBody">
        </tbody>
    </table>
    </form>
</body>
    <script type="text/javascript">
        function buscar() {
            var txt = document.getElementById("WFErr_txtsearch").value;
            var Des = document.getElementById("WFErr_txtFechaDesde").value;
            var Has = document.getElementById("WFErr_txtFechaHasta").value;
            //TOTDO!!! Llamada Ajax para buscar ()
        }

        function resultados(result) {
            //recorre la tabla con los resultados
        }
        $("#WFErr_Buscar").click(function () { buscar(); });
    </script>
</html>
