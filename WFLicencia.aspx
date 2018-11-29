<%@ page language="VB" autoeventwireup="false" inherits="WFLicencia, App_Web_b11o5nua" %>

<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <title>Licencias</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/> 
    <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script>--%>
    <%--jquery-ui--%>
    <link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/>     
    <%--<script type="text/javascript" src="JsLibs/bootstrap/bootstrap.min.js"></script>--%>

    <link rel="stylesheet"  runat="server" id="MyStylesheet" href="./Css/default.css" />

</head>
<body runat="server" id="MyBody">
    <div runat="server" id="DivLogo" style="padding-left:50px; margin-bottom:20px; margin-top:10px;"><img runat="server" id="LogoLic" src="./images/logo_PLAN_azul.png" alt="PLAN"/></div>
    <form  autocomplete="off" id="form1" runat="server" style="padding-left:50px; margin-bottom:100px; margin-top:10px;">
    <div>  
    <div runat="server" id="BloqueLicenciaActual">  
    <span class="PWTitulo3" >
    <span runat="server" id="WFLicencia_TxtLicenciaActual" >Licencia Actual</span>
    </span>
    <div runat="server" id="DivLicInfo" style="margin:30px;">    
    </div>    
    </div>
    <div runat="server" id="BloqueSolicitudes" style="margin-top:30px;">
    <span class="PWTitulo3">
    <span runat="server" id="WFLicencia_TxtSolicitudes" >Solicitudes</span>
    </span>
    <div runat="server" id="DivLicRequest" style="margin:30px;">    
    </div> 
    </div>       
    <div runat="server" id="BloqueAcciones" style="margin-top:30px;">
        <asp:Button ID="ButtonCrearSolicitud" runat="server" Text="Crear solicitud de licencia"  CssClass="PWButton"/>            
        <asp:Button ID="ButtonDescargarLicencia" runat="server" Text="Descargar fichero de Licencia"  CssClass="PWButton" />    
        <asp:Button ID="ButtonEliminarLicencia" runat="server" Text="Eliminar datos de Licencia"  CssClass="PWButton"  />    
    </div>    
    <br/><br/>
    <div runat="server" id="BloqueCargarLicencia" style="margin-top:30px;">
    <span class="PWTitulo3">
    <span runat="server" id="WFLicencia_TxtCargarLicencia" >Cargar Licencia</span>
    </span>
    <div runat="server" id="DivLicApply" style="margin-top:30px;">    
       <asp:FileUpload ID="FileUploadCargarSolicitud" runat="server" 
            CssClass=" form-control PWTextBox " style="display:inline-block; width:50%; "/>
       <asp:Button ID="ButtonCargarSolicitud" runat="server" Text="Cargar licencia"  CssClass="PWButton" style="display:inline-block; margin-left:20px;"/>    
    </div>
    </div>        
    </div>
           
    </form>
</body>
</html>
