function cargarArchivo(elemento){
var file = elemento.files[0];
	var objHidden = document.formulario.foto;
	objHidden.value = file.name;
//	document.formulario.target = "null";
//	document.formulario.action = "fotoPaciente";
//	document.formulario.submit();
//	alert("proceso terminado");
}