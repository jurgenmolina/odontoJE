function cargarArchivo(elemento, elemento2){
var file = elemento.files[0];
var file2 = elemento2.files[0];
	var objHidden = document.formulario.foto;
	var objHidden2 = document.formulario.foto2;
	objHidden.value = file.name;
	objHidden2.value = file2.name;
//	document.formulario.target = "null";
//	document.formulario.action = "fotoPaciente";
//	document.formulario.submit();
//	alert("proceso terminado");
}



if ( ! Modernizr.adownload ) {
  var $link = $('a');
 
    $link.each(function() {
        var $download = $(this).attr('download');
     
        if (typeof $download !== typeof undefined && $download !== false) {
      var $el = $('<div>').addClass('download-instruction').text('Right-click and select "Download Linked File"');
      $el.insertAfter($(this));
        }
 
    });
}

