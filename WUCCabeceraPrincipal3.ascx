<%@ control language="VB" autoeventwireup="false" inherits="WUCCabeceraPrincipal3, App_Web_b11o5nua" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<script  type="text/javascript">
    var WUCabeceraPrincipalTimer;
    function Ajax_ComprobarActividadesNuevasSinLeer(marcarcomoleido,onclick) {
        var REsultado = '';
        var ParamAux = { MarcarComoLeido: marcarcomoleido, Onclick: onclick };
        var ParamJson = JSON.stringify(ParamAux);
        $.ajax({
            type: "POST",
            url: cUtilUrlPathName + "/ws/ajxtool.asmx/ComprobarActividadesNuevasSinLeer",
            contentType: "application/json; charset=utf-8",
            data: ParamJson,
            async: true,
            //timeout: 15000," & vbNewLine &
            dataType: "json",
            success: function (res) { REsultado = Resd(res); },
            error: function (xhr) { TrataErrAjax("AJ703", xhr); /*alert('Error en ajax [ComprobarActividadesNuevasSinLeer]:' + xhr.status + ' ' + xhr.responseText);*/ }
        });
        return REsultado;
    }


    function AvisosNuevosSinLeer(Mseg) {
        //var REsultado = cAUxAvisos.ComprobarActividadesNuevasSinLeer(false, 'javascript: OcultarAvisosNuevosSinLeer()');
        var REsultado = Ajax_ComprobarActividadesNuevasSinLeer(false, 'javascript: OcultarAvisosNuevosSinLeer()');
        WUCabeceraPrincipalTimer = setTimeout("AvisosNuevosSinLeer(" + Mseg + ")", Mseg);
        if (!REsultado) { return; }
        BaRRa = document.getElementById("BarraPrincipal_WUCBarraPrincipal2TextoPrincipal")
        if (BaRRa) {
            if (REsultado.value) { BaRRa.innerHTML = REsultado;/*REsultado.value;*/ }
            else { BaRRa.innerHTML = ""; }
        }
    }
    function OcultarAvisosNuevosSinLeer() {
        //var REsultado = cAUxAvisos.ComprobarActividadesNuevasSinLeer(true, "");
        var REsultado = Ajax_ComprobarActividadesNuevasSinLeer(true, "");
        var REsultado = '';
        BaRRa = document.getElementById("BarraPrincipal_WUCBarraPrincipal2TextoPrincipal")
        if (BaRRa) { BaRRa.innerHTML = ""; }
    }    
    function menuFacil_Abrir() {
        var capa = document.getElementById('DivCapaOpaca');
        if(capa == null){
            capa = document.getElementById('DivCapaRecarga');
            capa.style.left=0;
            capa.style.top=0;
        }
        // Hay que hacer esto porque PW lo aplica dinámicamente, pero no en todas las páginas.
        capa.style.width='100%';
        capa.style.height='100%';
        capa.style.zindex='200';

        capa.style.display = "inline";
        capa.style.cursor = "pointer";
        capa.onclick = function () { menuFacil_Cerrar(); }; //aquí se corre el riesgo de pisar el evento que hayan podido programar previamente. Si en el futuro ocurriera, cambiar esta línea por un tratamiento basado en "setAttribute".
        AjustarCapas();

        capa = document.getElementById('menuFacil_ventana');
        capa.style.height = '80%'; //TODO burbujas: dinamizar.

        var versionIE = vIE();
        if(versionIE > 0 && versionIE < 9)
            capa.style.display = 'inline';
        else
            capa.style.opacity = 1;        
        //<*%=TODO_MenuFacilJavascript%*>
    }
    function menuFacil_Cerrar() {
        var capa = document.getElementById('DivCapaOpaca');
        if(capa == null){
            capa = document.getElementById('DivCapaRecarga');
            capa.style.left='12px';
            capa.style.top='352px';
            capa.style.width='344px';
            capa.style.height='46px';
        }
        capa.style.display = "none";
        capa.style.cursor = "inherit";
        capa.onclick = null;
        capa = document.getElementById('menuFacil_ventana');
        capa.style.opacity = 0;
        var versionIE = vIE();
        if(versionIE > 0 && versionIE < 9)
            capa.style.display = 'none';
        else
            capa.style.height = 0; //no usar display none, anularía el efecto transición.
    };

    var WUCCabeceraPrincipal3_ww = $(window).width();
    $(window).resize(function () {
        var w = $(window).width();
        if (w > 992 && WUCCabeceraPrincipal3_ww <= 992) {
            $('#BarraPrincipal_bloque_menuPrincipal').css('display', 'block');
        } else if (w <= 992 && WUCCabeceraPrincipal3_ww > 992)
            $('#BarraPrincipal_bloque_menuPrincipal').css('display', 'none');
        WUCCabeceraPrincipal3_ww = w;
    })

</script>
<style runat="server" id="bloqResalt"></style>
<asp:Literal ID="ltlMenuFacil" runat="server"></asp:Literal>
<asp:Panel ID="pnlMenuFacilBotonesPlan" runat="server"></asp:Panel>
<!-- Controles ocultos que aún no se han definido -->

<div id="WUCBarraPrincipal2Div1" class="PWBarraprincipal_" runat="server">
<div id="BarraCero_Pendiente" style="display:none;" role="xnavigation">  
    <ul id="menuDerecho" class="NO_nav navbar-nav navbar-right"  >
        <li id="avisos" runat="server" style="display:none;" ><a href="#"></a></li>
        <!--<li id="CPTDmenufacil" runat="server" ><a href="#"></a></li>-->
        <li id="menuGral" runat="server" class="dropdown" style="display:none;"> <a href="#" id="menuGrala" class="dropdown-toggle btn-menu" data-toggle="dropdown"> </a>
          <ul class="dropdown-menu">           
          </ul>
        </li>
     </ul>
     <div id="CPTDbusqueda" runat="server" class="navbar-form navbar-right" style="display:none;" >
      <div class="form-group" id="CPbusqueda" runat="server">
        <input type="text" id="buscador" class="form-control" placeholder="Buscar" runat="server" />
     </div>
    </div>   
    <span id="CPavisos" runat="server" class="PWCPBotonStyle"></span>
</div>
<!------------------------------------BARRA CERO---------------------------------------->
      <div id="barraCero" class="" role="xnavigation" runat="server">
        <a id="CPdesconectar" runat="server" class="PWCPIconStyle"></a>        
        <a id="CPayuda" runat="server" ></a> 
        <div id="CPDevToolsSP" runat="server" class="dropdown" style="display:inline;">
            <a id="CPDevTools" runat="server" class="PWCPIconStyle " data-toggle="dropdown" data-target="#BarraPrincipal_DivLanzador" data-display="static"></a> 
            <div id="CPDevToolsMenu" runat="server" class="dropdown-menu" style="">                 
            </div>          
        </div>              
        <a id="CPLoginDev" runat="server" class="PWCPIconStyle " data-toggle="modal" data-target="#BarraPrincipal_DivLoginDev"></a>        
        <a id="CPusuario" runat="server" class="PWCPIconStyle "  ></a>
        <a href= "#" id="CPmenufacil" runat="server" Class="PWCPBotonMenuFacil"></a>
        <a href="#" id="bloque_menuPrincipal_DspButton" class="" style="color:#fff;" runat="server" onclick=" $('#BarraPrincipal_bloque_menuPrincipal').toggle(); /*if(OcultarArbol) {OcultarArbol('none');}*/" ></a>                 
        <span id="CPTituloApp" runat="server"></span> 
        
        <div runat="server" id="ScLoginDev" style="display:none;">                
      </div> 
      </div>       
<!------------------------------------PRIMERA BARRA DE NAVEGACIÓN---------------------------------------->
<div id="primeraBarra" class="" role="xnavigation" runat="server"> 
    <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
    <div class="">   
      <div id="PoltergeistLogo" style="display:none" runat="server"></div> 
      <div id="logo" class="" runat="server">
      </div> 
    </div>   
     <div id="bloque_primeraBarra" class="">          
     <div id="bloque_menuPrincipal" class="" role="" runat="server"  >  
     </div> 
     <div id="CPLanzadorSP" runat="server" class="dropdown" >
            <a id="CPLanzador" runat="server" class="PWCPIconStyle " data-toggle="dropdown" data-target="#BarraPrincipal_DivLanzador" data-display="static"></a> 
            <div id="CPLanzadorMenu" runat="server" class="dropdown-menu" >          
            </div>          
        </div>           
    </div> 
    
 </div>
<!------------------------------------SEGUNDA BARRA DE NAVEGACIÓN---------------------------------------->
  <div id="segundaBarra" class="" runat="server">    
  	<p id="CPTitulo" runat="server" class="navbar-text">
  		 <!--Título-->
	</p>    
    <!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex2-collapse"> <span class="sr-only">Desplegar navegación</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>-->
  	<div class="" id="segundaBarra_botonera">
        <div role="toolbar" class="btn-toolbar">
            <div class="btn-group btn-group-sm pull-right" id="botonesMenu" runat="server">
                <!--Botones de guardar, salir, imprimir, etc...-->
            </div>
        </div>       
  	</div>
  </div> 
<!-----------------------------------GESTOR DE AVISOS---------------------------------------------------->
<iframe id="DivKeepAlive" runat="server" src="" frameborder = "0"  style="position: absolute; width: 0px; height: 0px; max-width: 0px; max-height: 0px; display: none;"></iframe>
</div>
 <div runat="server" class="PWCabeceraModal modal-fade" id="DivLoginDev" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header PWcabecera_toolbar">
            <button type="button" runat="server" id="DivLoginDev_close" class="close" data-dismiss="modal" aria-label="Close"></button>
            <h4 runat="server" id="DivLoginDev_titulo" class="modal-title" >Iniciar sesión</h4>
            </div>
            <div class="modal-body" >
                <div runat="server" id="DivLoginDev_info"></div>
                <div runat="server" id="DivLoginDev_tipologin"></div>
                <div class="form-group" runat="server" id="DivLoginDev_Disconnect" style="display:none">            
                </div>
                <div class="form-group">                    
                    <input type="text" class="form-control" runat="server" id="DivLoginDev_usuario" placeholder="Usuario"/>
                </div>
                <div class="form-group">                    
                    <input type="password" class="form-control" runat="server" id="DivLoginDev_pass" placeholder="Contraseña"/>
                </div>
            </div>
            <div class="modal-footer">            
            <asp:Button ID="DivLoginDev_submit" runat="server" Text="Aceptar" />
            </div>                            
        </div>
    </div>
</div>
<div runat="server" class="PWCabeceraModal modal-fade" id="DivUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" style="">
    <div class="modal-dialog">
    <div class="modal-content">
         <div class="modal-header PWcabecera_toolbar">
            <button type="button" runat="server" id="DivUserInfo_Close" class="close" data-dismiss="modal" aria-label="Close"></button>
            <h4 runat="server" id="DivUserInfo_Titulo" class="modal-title" >Datos del Usuario</h4>
         </div>
        <div class="modal-body"  runat="server" id="DivUserInfo_body">          
        </div>
         <%--<div class="modal-footer">            
            <asp:Button ID="DivUserInfo_submit" runat="server" Text="Aceptar" />
         </div> --%>
    </div></div>
</div>
<div runat="server" id="WUCCabeceraPrincipal3_HiddenForm" style="display:none"></div>


<%--<div runat="server" class="modal-fade" id="DivLanzador" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header PWcabecera_toolbar">            
            <h4 runat="server" id="DivLanzador_titulo" class="modal-title" >Lanzadores (Con o sin título?) </h4>
            </div>
            <div class="modal-body" >
                Botones varios Pendiente de desarrollar
            </div>
            <div class="modal-footer">
                Pié
            </div>                            
        </div>
    </div>
</div>--%>
