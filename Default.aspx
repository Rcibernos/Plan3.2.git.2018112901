<%@ page language="VB" autoeventwireup="false" inherits="_Default, App_Web_b11o5nua" debug="true" enableviewstatemac="true" viewstateencryptionmode="Always" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-es" xml:lang="es-es" dir="ltr" id="minwidth">
<head id="Head1" runat="server">
    <meta  id="MiXUACOMPATIBLE" runat="server" http-equiv="X-UA-Compatible" content="IE=edge;" />
    <meta http-equiv="cache-control" content="no-cache, no-store, max-age=0, must-revalidate" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1"/>         
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <!--<meta http-equiv="Last-Modified" content="0"/> -->    
    <title>El Plan Web [Login]</title>           
    <link rel="shortcut icon" href="./ElPlanWeb.ico" runat="server" id="MyFavicon" type="image/x-icon"/>
     <%--jquery--%>    
    <%--<script type="text/javascript" src="JsLibs/jquery-ui-1_10_3_custom/js/jquery-1.9.1.js"></script>--%>
    <%--<script type="text/javascript" src="JsLibs/jquery-ui-1_10_3_custom/js/jquery-ui-1.10.3.custom.min.js"></script>--%>
    <%--Plan--%>     
    <script type="text/javascript" src="./JsLibs/JSAjustar.js"></script>
    <script type="text/javascript" src="./JsLibs/JSAuxProcesos.js"></script> 
    <link rel='stylesheet' href='./Css/default.css' runat="server" id="MyStylesheet" />     
</head>
<body runat="server" id="MyBody" class="PWDefault_Body">
<div id="errnoscript" runat="server" style="width:100%; text-align:center;" > 
<!--Noscript-->
</div>
<!--/header-->
<div id="PWDefault_header">
    <img src="./images/logo_PLAN.png" alt="PLAN Multiplica tu valor" runat="server" id="PWDefault_Logo" class="PWDefault_box_shadow" />
    <div class="PWDefault_slogan">
    <h1 runat="server" id="PWDefault_slogan1"><% Response.Write(TituloLogin)%></h1>
    <h2 runat="server" id="PWDefault_slogan2"><% Response.Write(SubTituloLogin)%></h2>    
</div>       
</div>
<div id="contentlg" runat="server" style="visibility:visible;" > 
 <div id="PWDefault_block_login">
      <div class="PWDefault_sombra_login"></div>
      <form autocomplete="off" id="form1" runat="server"  name="form1">          
   <div class="PWDefault_item_login">
   <fieldset  runat="server" id="ControlesLogin">
      <legend runat="server" id="txtTitulo" >Iniciar sesión</legend>               
          <div class="PWDefault_item_input">
                <label class="PWLabel" runat="server" id="txtUsuario" >Usuario</label>                
                <asp:TextBox ID="VTextBoxUser" runat="server" CssClass="PWTextBox"  AutoCompleteType="disabled"></asp:TextBox>
                <br/><asp:CustomValidator ID="CustomValidatorU" runat="server" ErrorMessage="Contiene Caracteres no vaídos" controltovalidate="VTextBoxUser" style="display:none;"></asp:CustomValidator>
          </div>
          <div class="PWDefault_item_input">
                <label class="PWLabel" runat="server" id="txtPassword">Password</label>
                <asp:TextBox ID="VTextBoxPass" runat="server" CssClass="PWTextBox" TextMode="Password"  AutoCompleteType="disabled"></asp:TextBox>                
                <%--<br/><asp:CustomValidator ID="CustomValidatorP" runat="server" ErrorMessage="Contiene caracteres no válidos" controltovalidate="HTextBoxPass" style="display:none;"></asp:CustomValidator>--%>
          </div>
          <asp:Panel ID="pnlRecordar" CssClass="PWDefault_item_input" runat="server">
              <label class="PWLabel" runat="server" id="lblRecordar">Recordar</label>
              <asp:CheckBox ID="chkRecordar" TextAlign="Left" class="check" runat="server"/>
          </asp:Panel>          
          <div ID="PWDefault_Captcha" runat="server" style="display:none;" ></div>
          <div class="PWDefault_item_input">
            <ul id="Aditional_Links" runat="server" class="PWDefault_Aditional_Links">
            </ul>
          </div>
          <asp:Button ID="ButtonAceptarLogin" runat="server" Text="Aceptar" CssClass="PWButton" UseSubmitBehavior="true" />                   
       </fieldset>
     </div>
    <div ID="PWDefault_AdicionalLogin" runat="server" style="display:none;" ></div>
    <div id="PWDefault_system_info" runat="server"  >              
         <div class="PWDefault_DivMensajeInfo" runat="server" ><% Response.Write(LeyendaLogin)%></div>                               
     </div>
     <div class="PWDefault_item_login" id="PWDefault_system_message" runat="server" style="display:none; ">              
                  <div class="PWTextError" runat="server" id="PWDefault_DivMensajeError"  ></div>                               
     </div>
     <div class="PWDefault_item_login" id="DivSeletorDeBaseDeDatos" style="display:none;" runat="server">
     <div runat="server" id="traza" style="display:none"></div> 
     <div class="PWDefault_item_checkbox">
            <asp:CheckBox ID="CheckBoxSelectorDeBaseDeDatos" runat="server" CssClass="PWLabel" Text="Usar autentificación PLAN" Checked="true"/>                 
     </div> 
     <div id="TxtSeletorDeBaseDeDatosLista" >Seleccione Aplicación</div>                 
     <div id="DivSeletorDeBaseDeDatosLista" class="PWLoginListaApp" runat="server"></div>              
     </div>
     <div style="display:none">         
     <asp:HiddenField ID="HTextBoxPass" runat="server" />
     <asp:HiddenField ID="HTextBoxUser" runat="server" />
     </div>
   </form>
 </div>
 <div id="PWDefault_PageFoot"><p id="PieDePagina" class="PWLetraPequenia"><% Response.Write(PieDePaginaLogin)%></p> </div>
 <div class="PWText3" runat="server" id="DivLogueado" style="display:none; width:100%; text-align:center; "></div>
 </div>               
 </body>
<script   type="text/javascript" > 
    Aux = document.getElementById("PWDefault_DivMensajeError"), Aux.innerHTML.length > 0 && (document.getElementById("PWDefault_system_message").style.display = "block"); var oControl = document.getElementById("VTextBoxUser"); null != oControl && ("" == oControl.value ? oControl.focus() : null != (oControl = document.getElementById("VTextBoxPass")) && oControl.focus());
</script>
<script type ="text/javascript">
    function scrollInTo(e, t) { content = document.getElementById(e), elem = document.getElementById(t), content.scrollTop = elem.offsetTop - content.offsetTop }
</script>    
</html>