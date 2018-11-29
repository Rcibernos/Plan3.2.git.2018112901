<%@ control language="VB" autoeventwireup="false" inherits="WUCFirma, App_Web_b11o5nua" %>

<div style="max-width:800px; width:800px; height:100%;">
<table  style="width:100%; height:100%;" cellpadding="0" cellspacing="2" border="0" class="PWFondoFormulario">
<tr style="width:100%;"><td colspan="3" class="PWcabecera_toolbar" style="width:100%; text-align:center; height: 20px;" align="center"  runat="server" id="cabecera">
    Firma <asp:ImageButton ID="ButtonResponderCancelar" runat="server" ImageUrl="./images/default/" style="float:right; padding-right:10px; margin-right:10px;"/> </td></tr>
<tr style="width:100%;">
    <td style="width:2%; height: 21px;"></td>
    <td  style="width:96%; height:500px;">
            <iframe id="IframeFirma" runat="server" style="width:100%; height:100%;"  src="./HTMLVacia.htm"></iframe>
            <input type="hidden" runat="server" id="AspnetTienecosasquedanasco" />
                <%--<textarea runat="server" rows="6" id="TextBoxRespuesta"></textarea>--%>
    </td>
    <td style="width:2%; height: 21px;"></td>
</tr ><%--<tr>
    <td style="width:2%; height: 21px;"></td>
    <td style="text-align:right;" align="right">   
    &nbsp;<asp:Button ID="ButtonResponderAceptar"  runat="server" Text="Aceptar" CssClass="PWButton" />&nbsp;&nbsp;
    <asp:Button ID="ButtonResponderCancelar" runat="server" Text="Cancelar" CssClass="PWButton" />
    </td>
    <td style="width:2%; height: 21px;"></td>     
    </tr>--%>
    </table>
    <input type="hidden" runat="server" id="Hidden1tmpval" />
 </div>
