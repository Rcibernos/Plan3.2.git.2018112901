<%@ page language="VB" autoeventwireup="true" inherits="AspxMigradorFicheros, App_Web_3xhhtna1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Plan Web - Migrador de ficheros</title>
    <link href="../../Css/default.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="../../ElPlanWeb.ico" id="MyFavicon" type="image/x-icon"/>
    <script type="text/javascript" src="../../JsLibs/JSAjustar.js"></script>     
    <script type="text/javascript" src="../../JsLibs/JSAuxProcesos.js"></script>
    <style type="text/css">
        form{margin-top:2em}
        h2{color:white; background-color:#3a3af0; padding-left:1em; margin-top:1em}
        img{float:left; margin-right:1em}
        p{margin:1.5em 0}
        #content{visibility:xhidden; padding-top:1em; width:97%}
        .conScroll{overflow-x:scroll; height:2.5em; resize:vertical}
        .enmarcado{border:1px solid #343434; margin-top:1em; padding:0 1em; background-color:#fafafa}
        .identado{margin-left:3em}
        .rojo{color:red}
        .submit{margin-left:3.5em; width:7em}
        .verde{color:green}        
    </style>
</head>
<body>
<div id="content" class="PWContent">
    <img src="ficheros.png" alt="" width="48px" height="48px"/>
    <h1>Migrador de Ficheros</h1>
    <span>Herramienta para copiar o mover ficheros de un repositorio a otro, manteniendo las referencias que PLAN guarda en BD.</span>

    <form  autocomplete="off" id="form1" runat="server">
        <div class="enmarcado">
            Origen: <asp:DropDownList ID="ddlOrigen" AutoPostBack="true" runat="server"/>&nbsp;&nbsp;&nbsp;Destino: <asp:DropDownList ID="ddlDestino" AutoPostBack="true" runat="server"/><br/>
            Migrar <asp:TextBox ID="txtNumAMover" text="1" width="3em" runat="server"/> fichero/s, empezando desde la posici&oacute;n <asp:TextBox ID="txtPosInicial" text="1" width="3em" runat="server"/><asp:Button id="btnMigrar" text="Migrar" cssclass="submit" runat="server"/><br/>
            <pre class="conScroll"><asp:Literal id="ltlLog" runat="server"/></pre>
        </div>

        <h2>Ficheros en <asp:literal id="ltlOrigenTitulo" runat="server"/></h2>
        <strong><asp:label ID="lblOrigen" runat="server"/></strong><span class="identado">N&uacute;mero m&aacute;ximo de filas por p&aacute;gina: <asp:TextBox ID="txtBdNumFilasPagina" text="10" width="3em" runat="server"/></span>&nbsp;&nbsp;<asp:Button ID="btnOrigenRefrescar" text="Refrescar" runat="server"/><br/>
        <asp:gridview ID="gvOrigen" AllowPaging="true" PagerSettings-Mode="NumericFirstLast" runat="server">
            <RowStyle BackColor="#eaffff"/>
            <AlternatingRowStyle BackColor="#ffffea"/>
        </asp:gridview>
        
        <h2>Ficheros en <asp:literal id="ltlDestinoTitulo" runat="server"/></h2>
        <strong><asp:label ID="lblDestino" runat="server"/></strong><span class="identado">N&uacute;mero m&aacute;ximo de filas por p&aacute;gina: <asp:TextBox ID="txtLlNumFilasPagina" text="10" width="3em" runat="server"/></span>&nbsp;&nbsp;<asp:Button ID="btnDestinoRefrescar" text="Refrescar" runat="server"/><br/>
        <asp:gridview ID="gvDestino" AllowPaging="true" PagerSettings-Mode="NumericFirstLast" runat="server">
            <RowStyle BackColor="#eaffff"/>
            <AlternatingRowStyle BackColor="#ffffea"/>
        </asp:gridview>

        <div class="enmarcado">
            <p><strong>M&aacute;s opciones</strong></p>
            Timeout: <asp:TextBox ID="txtTimeout" text="120" width="3em" runat="server"/> segundo/s.<br/>
            Resultados que se deben mostrar despu&eacute;s de mover: <asp:DropDownList ID="ddlTipoLog" runat="server">
                    <asp:ListItem Value="ninguno">Ninguno</asp:ListItem>
                    <asp:ListItem Value="errores" Selected="True">Solo errores</asp:ListItem>
                    <asp:ListItem Value="éxitos">Solo &eacute;xitos</asp:ListItem>
                    <asp:ListItem Value="todos">Errores y &eacute;xitos</asp:ListItem>
                </asp:DropDownList><br/>
            <asp:CheckBox id="chkDescartarFicherosNulos" checked="false" runat="server"/> No considerar ficheros que tengan campos binarios con valor nulo.<br/>
            <asp:CheckBox id="chkMantenerOrigen" checked="true" runat="server"/> Mantener ficheros en origen cuando se migre desde un directorio (es decir, copiar en vez de mover).<br/>
        </div>
    </form>
</div>
</body>
</html>