<%@ page language="VB" autoeventwireup="false" inherits="Defdes, App_Web_b11o5nua" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <meta http-equiv="cache-control" content="no-cache, no-store, max-age=0, must-revalidate" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1"/>    
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <title>El Plan Web Desarrollo [Login]</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <%--jquery--%>    
    <%-- <script type="text/javascript" src="JsLibs/jquery/jquery-1.11.3.min.js"></script> --%>
    <%--jquery-ui--%>
    <%-- <link id="JqueryUiCSS" rel="stylesheet" href="JsLibs/jquery-ui-1_12_1_custom/jquery-ui.min.css"/> --%>
    <script type="text/javascript" src="./JsLibs/JSAjustar.js"></script>
    <script type="text/javascript" src="./JsLibs/JSAuxProcesos.js"></script> 
   
    <link rel='stylesheet' href='./Css/default.css' runat="server" id="MyStylesheet" /> 

</head>
<body runat="server" id="MyBody" class="PWDefdev_Body">
<div id="errnoscript" runat="server" style="width:100%; text-align:center;" > 
<!--Noscript-->
</div>
<div id="PWDefault_header">
    <img src="./images/logo_PLAN.png" alt="PLAN Multiplica tu valor" runat="server" id="PWDefault_Logo" class="PWDefault_box_shadow" />
    <div class="PWDefault_slogan">
    <h1 runat="server" id="PWDefault_slogan1">Developer tools</h1>    
    </div>
</div><!--/header-->
<%--<div id="contentlg" runat="server" style="visibility:visible;" > 
 <div id="PWDefault_block_login">
      <div class="PWDefault_sombra_login"></div>
      <form autocomplete="off" id="form2" runat="server"  name="form1">  
   <div runat ="server" class="PWDefault_item_login" id="ControlesLoginDiv" >
   <fieldset  runat="server" id="ControlesLogin">
      <legend runat="server" id="txtTitulo" >Iniciar sesión</legend>     
          <div class="PWDefault_item_input">
                <label class="PWLabel" runat="server" id="txtUsuario" >Usuario</label>                
                <asp:TextBox ID="TextBoxCode" runat="server" CssClass="PWTextBox"  AutoCompleteType="disabled" ></asp:TextBox>
          </div>
          <div class="PWDefault_item_input">
                <label class="PWLabel" runat="server" id="txtPassword">Password</label>
                <asp:TextBox ID="TextBoxPass" runat="server" CssClass="PWTextBox" TextMode="Password"  AutoCompleteType="disabled"></asp:TextBox>                
          </div>
          <div class="PWDefault_item_input">
            <ul id="Aditional_Links" runat="server" class="PWDefault_Aditional_Links">
            </ul>
          </div>
       </fieldset>
    </div>
     <div id="PWDefault_system_Acept" runat="server"  >              
         <asp:Button ID="ButtonAceptarLogin" runat="server" Text="Aceptar" CssClass="PWButton" UseSubmitBehavior="true"  
         style=""/>
     </div>
     <div id="PWDefault_system_info" runat="server"  >              
         <div runat="server" id="PWDefault_system_info_txt"  class="PWDefault_DivMensajeInfo"  >Introduzca sus credenciales de desarrollador</div>                               
     </div>
     <div class="PWDefault_item_login" id="PWDefault_system_message" runat="server" style="display:none; ">              
                  <div class="PWTextError" runat="server" id="PWDefault_DivMensajeError"  ></div>                               
     </div>
     <div class="PWDefault_item_login" id="DivSeletorDeBaseDeDatos" style="display:none;" runat="server">
     <div runat="server" id="traza" style="display:none"></div>     
     <div id="TxtSeletorDeBaseDeDatosLista" >Seleccione Aplicación</div>                 
     <div id="DivSeletorDeBaseDeDatosLista" class="PWLoginListaApp" runat="server"></div>
     </div>
   </form>                                           
  
 </div>
 <div id="PWDefault_PageFoot">
        <p id="PieDePagina" class="PWLetraPequenia"></p>
 </div>
 <div class="PWText3" runat="server" id="DivLogueado" style="display:none; width:100%; text-align:center; "></div>
 </div>--%>
           
 </body>
   

<%--<script   type="text/javascript" >    
NoIncluirEnFrame();
</script>--%>

<script   type="text/javascript" >
    Aux = document.getElementById("PWDefault_DivMensajeError")
    if (Aux.innerHTML.length > 0)
    { document.getElementById("PWDefault_system_message").style.display = "block"; }

    // Poner el foco en usuario o password (no funcionó hacerlo desde servidor).
    var oControl = document.getElementById('TextBoxUser');
    if (oControl != null)
        if (oControl.value == '')
            oControl.focus();
        else {
            oControl = document.getElementById('TextBoxPass');
            if (oControl != null) oControl.focus();
        }
</script>
<script type ="text/javascript">
    function scrollInTo(idcontent, idelem) {
        content = document.getElementById(idcontent);
        elem = document.getElementById(idelem);
        content.scrollTop = elem.offsetTop - content.offsetTop;
    };

    
</script>    
</html>
