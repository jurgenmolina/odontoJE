function cargarArchivo(elemento){
var file = elemento.files[0];
	var objHidden = document.formulario.foto;
	objHidden.value = file.name;
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