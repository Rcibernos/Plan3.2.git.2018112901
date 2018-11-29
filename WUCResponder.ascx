<%@ control language="VB" autoeventwireup="false" inherits="WUCResponder, App_Web_b11o5nua" %>

<div id="WUCResponder" style="" class="PWFondo">
            <div class="PWcabecera_toolbar responder" style="" runat="server" id="cabecera">                
                <span runat="server" id="Cabecera_Titulo" >Responder</span>
                <asp:ImageButton ID="ImgResponderCancelar" runat="server" ImageUrl="./images/default/campoform_cancel_desde_form.png" />            
            </div>             
            <asp:TextBox ID="TextBoxRespuesta" TextMode="MultiLine" Rows="7" runat="server" style="width:100%; height:100%;" CssClass=" form-control PWTextBox "></asp:TextBox>
            <div id="botones" runat="server"><asp:Button ID="ButtonResponderAceptar" runat="server" Text="Button" /><asp:Button ID="ButtonResponderCancelar" runat="server" Text="Button" /></div>
            <input type="hidden" runat="server" id="AspnetTienecosasquedanasco" class="" />           
            <input type="hidden" runat="server" id="Hidden1tmpval"  class=""/>

    <script type="text/javascript" >
        //Esta funcion ha tenido que implementarse porque Asp.net no recibe en el servidor el valor de los TextArea
        function AuxVolcarTextArea(IdAux) {
            Aux = "";
            if (IdAux != "" && IdAux != null)
            { Aux = IdAux + "$"; }
            //WUCResponderActividad$
            Aux_AspnetTienecosasquedanasco = document.getElementById(Aux + "AspnetTienecosasquedanasco");
            Aux_TextBoxRespuesta = document.getElementById(Aux + "TextBoxRespuesta")
            if ((Aux_AspnetTienecosasquedanasco) && (Aux_TextBoxRespuesta))
            { Aux_AspnetTienecosasquedanasco.value = Aux_TextBoxRespuesta.value; }
            return true;
        }
    </script>
</div>
                     
            