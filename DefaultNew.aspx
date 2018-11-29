<%@ page language="VB" autoeventwireup="false" inherits="DefaultNew, App_Web_b11o5nua" enableviewstatemac="true" viewstateencryptionmode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <meta http-equiv="cache-control" content="no-cache, no-store, max-age=0, must-revalidate" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1"/>
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <title>El Plan Web [Login]</title>        
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
    <%--jquery--%>    
    <%--><script type="text/javascript" src="JsLibs/jquery-ui-1_10_3_custom/js/jquery-1.9.1.js"></script>--%>
    <%--<script type="text/javascript" src="JsLibs/jquery-ui-1_10_3_custom/js/jquery-ui-1.10.3.custom.min.js"></script>  --%>
    <%--Plan--%>    
    <script type="text/javascript" src="./JsLibs/JSAjustar.js"></script>
    <script type="text/javascript" src="./JsLibs/JSAuxProcesos.js"></script> 
    <link rel='stylesheet' href='./Css/default2016.css' runat="server" id="MyStylesheet" /> 
</head>
<body runat="server" id="MyBody" class="PWDefault_Body"> 
<div id="errnoscript" runat="server" style="width:100%; text-align:center; visibility:hidden;">           
  <!--Noscript-->        
</div>
<div id="PWDefault_header">
<img src="./images/logo_PLAN.png" alt="PLAN Multiplica tu valor" id="PWDefault_Logo" class="PWDefault_box_shadow" runat="server"/>
    <div class="PWDefault_slogan">
        <h1 runat="server" id="PWDefault_slogan1"><% Response.Write(TituloLogin)%></h1>
    <h2 runat="server" id="PWDefault_slogan2"><% Response.Write(SubTituloLogin)%></h2>    
</div>       
</div><!--/header-->
<div id="contentlg" runat="server" style="visibility:visible;" > 
<div id="PWDefault_block_login">
   <div class="PWDefault_sombra_login"></div>            
   <form autocomplete="off" id="form1" runat="server"  name="form1">          
   <div class="PWDefault_item_login">
   <fieldset  runat="server" id="ControlesLogin">
      <legend runat="server" id="txtTitulo" >Modificar contraseña</legend>     
          <div class="PWDefault_item_input" runat="server" id="contlegReestablecerpassword">
              <p runat="server" id="legReestablecerpassword"><% Response.Write(InstruccionesDeCambioPassword)%></p>
          </div>
          <div class="PWDefault_item_input">
                <label class="PWLabel" runat="server" id="txtUsuario" >Usuario</label>                
                <asp:TextBox ID="TextBoxUser" runat="server" CssClass=" form-control PWTextBox "  AutoCompleteType="disabled" ></asp:TextBox>
                <br/><asp:CustomValidator ID="CustomValidatorU" runat="server" ErrorMessage="Contiene Caracteres no vaídos" controltovalidate="TextBoxUser" style="display:none;"></asp:CustomValidator>
          </div>
          <div class="PWDefault_item_input" runat="server" id="form_login_password">
                <label class="PWLabel" runat="server" id="txtPassword">Password</label>
                <asp:TextBox ID="VTextBoxOldPass" runat="server" CssClass=" form-control PWTextBox " TextMode="Password"  AutoCompleteType="disabled"></asp:TextBox>                
          </div>
          <div class="PWDefault_item_input">
                <label class="PWLabel" runat="server" id="txtNewPassword">Nueva contraseña</label>
                <asp:TextBox ID="VTextBoxPass" runat="server" CssClass=" form-control PWTextBox " TextMode="Password"  AutoCompleteType="disabled"></asp:TextBox>                
          </div>          
          <div class="PWDefault_item_input">
                <label class="PWLabel" runat="server" id="txtConfirmNewPassword">confirmar contraseña</label>
                <asp:TextBox ID="VTextBoxPassConfirm" runat="server" CssClass=" form-control PWTextBox " TextMode="Password"  AutoCompleteType="disabled"></asp:TextBox>                
          </div>          
          <asp:Button ID="ButtonAceptarLogin" runat="server" Text="Aceptar" CssClass="PWButton" UseSubmitBehavior="true" />
         <div id="Aditional_Links" class="PWDefault_Aditional_Links" runat="server"></div>        
   </fieldset>
   </div>     
   <div id="PWDefault_system_message" runat="server" style="display:none; ">              
        <span class="PWTextError" runat="server" id="PWDefault_DivMensajeError"  ></span>                               
   </div>
     <div style="display:none">         
     <asp:HiddenField ID="HTextBoxOldPass" runat="server" />
     <asp:HiddenField ID="HTextBoxPass" runat="server" />
     <asp:HiddenField ID="HTextBoxPassConfirm" runat="server" />
     </div>     
   </form>                                             
 </div>
 <div id="PWDefault_PageFoot"><p id="PieDePagina" class="PWLetraPequenia"><% Response.Write(PieDePaginaLogin)%></p></div>
 <div class="PWText3" runat="server" id="DivLogueado" style="display:none; width:100%; text-align:center; "></div> 
 </div>   
 </body>
<script  type="text/javascript" >
    Aux = document.getElementById("PWDefault_DivMensajeError"); if (Aux.innerHTML.length > 0 ) { document.getElementById("PWDefault_system_message").style.display = "block"; }  
</script>
</html>
