<%@ control language="VB" autoeventwireup="false" inherits="WUCNuevaActividad, App_Web_b11o5nua" %>
<%--<%@ Register Src="WUCHora.ascx" TagName="WUCHora" TagPrefix="uc1" %>--%>
<div  runat="server" id="Contenedor" class="PWFondo" 
    style="width: 614px;  height: 405px;">    
     
    <asp:Label ID="LabelFechaProxActividad" runat="server" Style="left: 35px; position: absolute; top: 49px; text-align: right; width: 197px;"
        Text="Fecha de la Próxima Actividad:"></asp:Label>
        <span style="display:inline; left: 238px; position: absolute; top: 49px" >
          <input runat="server" id="TextFechaProxima"  class="PWTextBox"  style="width: 150px; display: inline;" type="text" />
        </span>
    <asp:Label ID="LabelHoraActividad" runat="server" Style="left: 34px; position: absolute; top: 81px; text-align: right; width: 193px;"
        Text="Hora de la Actividad"></asp:Label>   
     <span style="display:inline; left: 238px; position: absolute;  top: 81px; text-align: center;" >
        <input type="text"  id="THoraHM" runat="server" style="width:70px; display:inline; "  maxlength="5"  />  
     </span>
    <asp:Label ID="LabelDuracionActividad" runat="server" Style="left: 17px; position: absolute; top: 114px; text-align: right; width: 211px;"
        Text="Duración estimada de la Actividad"></asp:Label>   
     <span style="display:inline; left: 239px; width: 24px; position: absolute; top: 111px" >
        <input type="text"  id="TDurEstimadaHM" runat="server" style="width:70px; display:inline;"  maxlength="5"   />               
     </span>    
    <asp:Label ID="LabelTipoActividad" runat="server" Style="left: 41px; position: absolute; top: 146px; text-align: right; width: 186px;"
        Text="Tipo de Actividad"></asp:Label>    
    <select id="SelectTipoActividad" class=" form-control PWTextBox " 
        style="left: 240px; width:238px; position: absolute; top: 144px; height: 19px;" 
        runat="server" onchange="javascript:visibilidadproc(this);">             
    </select>
    <asp:Label ID="LabelTipoProceso" runat="server" Style="left: 41px; position: absolute; top: 184px; text-align: right; height: 21px; width: 178px;"
        Text="Tipo de Proceso"></asp:Label>    
    <select id="SelectTipoProceso" class=" form-control PWTextBox " 
        style="left:240px; width:238px; position: absolute; top: 184px" 
        runat="server" >        
    </select>
     <input runat="server" id="TextAsunto" class=" form-control PWTextBox " 
        maxlength="200" style="left: 76px; width: 516px;
        position: absolute; top: 228px; height: 24px;" type="text" />        
    <input runat="server" id="CheckboxcopiarParticipantes" 
        style="left: 141px; position: absolute; top: 276px; height: 21px;" 
        type="checkbox" checked="CHECKED" />    
    <asp:Label ID="Label7" runat="server" Style="left: 169px; position: absolute; top: 275px; height: 19px;"
        Text="¿Copiar Participantes?"></asp:Label>
    <table style="position:absolute; left: 393px; top: 310px; height: 33px;"><tr>
    <td style="height: 26px"><asp:Button ID="ButtonAceptar" runat="server" Text="Aceptar" CssClass="PWButton"  Width="80px" />&nbsp;</td>
    <td style="height: 26px"><asp:Button ID="ButtonCancelar" runat="server" Text="Cancelar"  CssClass="PWButton"  Width="80px" />&nbsp;</td>
    </tr></table>
    <script type="text/javascript">
        function visibilidadproc(Sta) { if (Sta.value == 5) { document.getElementById("MenuNuevaActividadSiguiente_SelectTipoProceso").removeAttribute('disabled'); } else { document.getElementById("SelectTipoProceso").setAttribute('disabled', 'disabled'); } }
    </script>
    <div style="display:none" runat="server" id="DivScripts"></div>
     <asp:Label ID="Label8" runat="server" Style="left: 19px; position: absolute; top: 229px;
        text-align: right; height: 17px;" Text="Asunto" Width="50px"></asp:Label>
    <div style="/*width:100%;*/" class="PWcabecera_toolbar">
    <table style="width:100%;"><tr>
    <td align="center" runat="server" id="NuevaActividadTitulo">Añadir nueva Actividad</td>
    <td style="width:24px; max-width:24px; min-width:24px;"><%--<asp:ImageButton ID="ImageButtonClose" runat="server" CssClass="PWFondo" ImageUrl="~/images/gifs24X24/delete.gif" />--%></td>
    </tr></table>
    </div>
</div>