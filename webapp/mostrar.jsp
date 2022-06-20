<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
      pageEncoding="ISO-8859-1"%> 
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>Cita - OdontoJE</title>

<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<link rel="stylesheet" href="assets/css/feathericon.min.css">

<link rel="stylesheet" href="assets/plugins/morris/morris.css">

<link rel="stylesheet" href="assets/css/style.css">

<link rel="stylesheet" href="assets/css/firma.css">

<link rel="stylesheet" href="assets/css/pdf.css">



 
</head>
<body>

<div class="main-wrapper">

<div class="header">

<div class="header-left">
<a href="inicio" class="logo">
<img src="assets/img/logo.png" alt="Logo">
</a>
<a href="inicio" class="logo logo-small">
<img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
</a>
</div>

<a href="javascript:void(0);" id="toggle_btn">
<i class="fe fe-text-align-left"></i>
</a>

<a class="mobile_btn" id="mobile_btn">
<i class="fa fa-bars"></i>
</a>

<ul class="nav user-menu">

    <li class="nav-item dropdown has-arrow">
    <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
    <span class="user-img"><img class="rounded-circle" src="assets/img/profiles/${odontologo.foto}" width="31" alt="Odontologo"></span>
    </a>
    <div class="dropdown-menu">
    <div class="user-header">
    <div class="avatar avatar-sm">
    <img src="assets/img/profiles/${odontologo.foto}" alt="User Image" class="avatar-img rounded-circle">
    </div>
    <div class="user-text">
	    <h6>${odontologo.nombre}</h6>
	    <p class="text-muted mb-0">Odontologo</p>
    </div>
    </div>
        <a class="dropdown-item" href="cerrarSesion">Cerrar Sesión</a>
    </div>
    </li>

</ul>

</div>


<div class="sidebar" id="sidebar">
<div class="sidebar-inner slimscroll">
<div id="sidebar-menu" class="sidebar-menu">
<ul>
<li class="menu-title">
</li>

			<li>
			<a href="inicio"><i class="fe fe-users"></i> <span>Lista de Pacientes</span></a>
			</li>
			
			<li  >
			<a href="registrarPaciente"><i class="fe fe-user"></i> <span>Registrar paciente</span></a>
			</li>
			
			<li>
			<a href="registrarCita"><i class="fe fe-edit"></i> <span>Agendar Cita</span></a>
			</li>
			
			<li  class="active" >
			<a href="calendario"><i class="fe fe-folder"></i> <span>Calendario de citas</span></a>
			</li>
			
			<li>
			 <a href="#"><i class="fe fe-book"></i> <span>Reportes</span></a>
			</li>


</ul>
</div>
</div>
</div>



	<div class="page-wrapper">
		
				
					<header class="clearfix">
					
				      <div id="logo">
				        <img src="assets/img/logo.png">
				      </div>
				      <h1>Resumen consulta odontologica</h1>
				      <div id="company" class="clearfix">
				        <div>Odontologo</div>
				        <div>${odontologo.nombre},<br /> ${odontologo.documento},</div>
				        <div>${odontologo.telefono},</div>
				        <div><a href="mailto:${odontologo.email}">${odontologo.email}</a></div>
				      </div>
				      <div id="project">
				        <div><span>PACIENTE</span> ${cita.paciente.nombre}   ${cita.paciente.apellido}</div>
				        <div><span>T.D.</span>  ${cita.paciente.tipodocumento}</div>
				        <div><span>DOC:</span> ${cita.paciente.documento}</div>
				        <div><span>EMAIL</span> <a href="mailto: ${cita.paciente.email}"> ${cita.paciente.email}</a></div>
				        <div><span>TELEFONO</span>  ${cita.paciente.telefono}</div>
				      </div>
				    </header>
				    <main>
				    
				    <div class="col-12 col-md-60 col-lg-40 d-flex">
					<div class="card flex-fill">
					
					<div class="card-header">
					<h5 class="card-title mb-0">Detalle</h5>
					<br>
					<h6 class="card-title mb-0">Fecha de la consulta: ${cita.fecha}</h6>
					</div>
					<div class="card-body">
					<p class="card-text">${cita.consulta}</p>
					<br>
					<p class="card-text">O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500, 
					quando uma misturou os caracteres de um texto para criar um espécime de livro. Este texto não só sobreviveu 5 séculos, 
					mas também o salto para a tipografia electrónica, mantendo-se essencialmente inalterada. Foi popularizada nos anos 60 
					com a disponibilização das folhas de Letraset, que continham passagens com Lorem Ipsum, e mais recentemente com os 
					programas de publicação como o Aldus PageMaker que incluem versões do Lorem Ipsum.</p>
					
					<br>
					<h6 class="card-title mb-0">Firma del odontologo</h6>
					<img alt="Card Image" src="http://localhost/Servidor/firmas/${cita.firma}" class="card-img-top">
					</div>
					</div>
					</div> 
				    </main>
				    
				
	</div>
	
	</div>
	


						

<script src="assets/js/archivo.js"></script>

<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/bootstrap.bundle.min.js"></script>

<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="assets/js/script.js"></script>


</body>
</html>