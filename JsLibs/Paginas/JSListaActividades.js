AltoAcum=0;Ajustada=0;function AjustarTamanoComponentes(){if(Ajustada>5){Ajustada=0;return}Ajustada+=1;if(document.getElementById("HiddenModofuncionamiento").value=="3"){if(document.getElementById("HiddenExportarAExcel").value=="1"){AjustarParaImpresion(false)}else{AjustarParaImpresion(true)}}else{AjustarAltoComponentes();AjustarAnchoComponentes()}}function AjustarAltoComponentes(){H=getHeight();AltoAcum=0;Aux_Element=document.getElementById("DivCabecera");Aux_Element.style.top="0px";Aux_Element.style.left="0px";Aux_Element.style.width="100%";AltoAcum=Aux_Element.offsetHeight;Aux_Element=document.getElementById("DivBotonera");Aux_Element.style.top=""+AltoAcum+"px";Aux_Element.style.left="0px";Aux_Element.style.width="100%";AltoAcum+=Aux_Element.offsetHeight;Aux_Tabla=document.getElementById("LISTAACTIVTABLE");Aux_Element=document.getElementById("DivListaActividades");Aux_Element.style.top=""+AltoAcum+"px";Aux_Element.style.left="0px";Aux_Element.style.width="100%";Aux_Element.style.overflow="auto";if((H-AltoAcum)>0){Aux_Element.style.height=""+(H-AltoAcum)+"px"}else{Aux_Element.style.height="0px"}AltoAcum+=Aux_Element.offsetHeight;document.getElementById("MyCalculateHeight").value=AltoAcum}function AjustarAnchoComponentes(){Aux_Grid=document.getElementById("MyGridView");Aux_divLista=document.getElementById("DivListaActividades");if(Aux_Grid){if(Aux_Grid.offsetWidth>Aux_divLista.offsetWidth){Aux_divLista.style.width=""+(Aux_divLista.offsetWidth)+"px";Aux_divLista.style.overflowX="scroll";document.getElementById("TDScroll").style.display="inline"}}WComp=GetAnchoPagina();document.getElementById("MyCalculateWidth").value=WComp;document.getElementById("DivCabecera").style.width=""+WComp+"px";document.getElementById("DivBotonera").style.width=""+WComp+"px";Aux_divLista.style.width=""+WComp+"px"}function RedimensionaPaginaPadre(){if(parent){NombreIframe=document.getElementById("HiddenNombreIFRameContenedorDeEstaPagina").value;document.getElementById("MyCalculateHeight").value=GetAltoPagina();document.getElementById("MyCalculateWidth").value=GetAnchoPagina();HiddenButton=parent.document.getElementById("HiddenDimensionButtonOf_"+NombreIframe);AuxMyIframeContentHeight=parent.document.getElementById("MyIframeContentHeight");AuxMyIframeContentWidth=parent.document.getElementById("MyIframeContentWidth");if(AuxMyIframeContentHeight){AuxMyIframeContentHeight.value=GetAltoPagina()}if(AuxMyIframeContentWidth){AuxMyIframeContentWidth.value=GetAnchoPagina()}if(HiddenButton){HiddenButton.click()}}}function GetAltoPagina(){alto=0;Aux=document.getElementById("DivCabecera");if(Aux){alto+=Aux.offsetHeight}Aux=document.getElementById("DivBotonera");if(Aux){alto+=Aux.offsetHeight}Aux=document.getElementById("DivListaActividades");if(Aux){alto+=Aux.offsetHeight}HPag=getHeight();if(HPag>alto){return HPag}return alto}function GetAnchoPagina(){return AuxMaxValue(new Array(getWidth(),document.getElementById("DivCabecera").offsetWidth,document.getElementById("DivBotonera").offsetWidth,document.getElementById("DivListaActividades").offsetWidth))}function AuxMaxValue(a){Mayor=0;for(i=0;i<a.length;i++){if(a[i]>Mayor){Mayor=a[i]}}return Mayor}function AjustarParaImpresion(a){H=getHeight();AltoAcum=0;Aux_Element=document.getElementById("DivCabecera");Aux_Element.style.top="0px";Aux_Element.style.left="0px";Aux_Element.style.width="100%";Aux_Element.style.overflow="visible";AltoAcum=Aux_Element.offsetHeight;Aux_Element=document.getElementById("DivListaActividades");Aux_Element.className="";Aux_Element.style.top=""+AltoAcum+"px";Aux_Element.style.left="0px";Aux_Element.style.width="100%";Aux_Element.style.overflow="visible";AltoAcum+=Aux_Element.offsetHeight;document.getElementById("MyCalculateHeight").value=AltoAcum;if(a){window.print()}}function ModificaSeleccion(b){T=document.getElementById("LISTAACTIVTABLE");if(T){for(var a=0;a<T.rows.length;a++){aId=T.rows[a].id.replace("TRListaActiv","");aChk=document.getElementById("CHKSELECTEDROW_"+aId);if(aChk){aChk.checked=b}}Seleccion2HiddenValue()}}function Seleccion2HiddenValue(){Value="";H=document.getElementById("HiddenLISTAACTIVTABLE_SELECCIONADOS");T=document.getElementById("LISTAACTIVTABLE");if(T&&H){for(var a=0;a<T.rows.length;a++){aId=T.rows[a].id.replace("TRListaActiv","");aChk=document.getElementById("CHKSELECTEDROW_"+aId);if(aChk){if(aChk.checked){Value=Value+"["+aChk.id+"]"}}}H.value=Value}}function primerVistazoSelecionar(a){var b=getformIdentif();var d=$("#WFListaActividadesModo").val();var c=$("#WFListaActividadesBusqueda").val();$.ajax({type:"POST",url:cUtilUrlPathName+"/ws/ajxtool.asmx/primerVistazoSelecionar",contentType:"application/json; charset=utf-8",dataType:"json",data:JSON.stringify({ag:a,modo:d,busqueda:c,URLOrigen:window.location.href}),success:function(e){e=Resd(e);if(e[0]){alert(e[0],"Error","error")}else{jQuery.globalEval(e[1])}},error:function(e){TrataErrAjax("AJ005",e)},timeout:10000,async:true})};