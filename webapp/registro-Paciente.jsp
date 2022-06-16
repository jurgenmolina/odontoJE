<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>Registro - OdontoJE</title>

<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<link rel="stylesheet" href="assets/css/feathericon.min.css">

<link rel="stylesheet" href="assets/plugins/morris/morris.css">

<link rel="stylesheet" href="assets/css/style.css">
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
			
			<li  class="active" >
			<a href="registrarPaciente"><i class="fe fe-user"></i> <span>Registrar paciente</span></a>
			</li>
			
			<li>
			<a href="#"><i class="fe fe-edit"></i> <span>Agendar Cita</span></a>
			</li>
			
			<li>
			<a href="#"><i class="fe fe-folder"></i> <span>Calendario de citas</span></a>
			</li>
			
			<li>
			 <a href="#"><i class="fe fe-book"></i> <span>Reportes</span></a>
			</li>


</ul>
</div>
</div>
</div>

	<div class="page-wrapper">
		<div class="content container-fluid">
		
			<div class="row">
				<div class="col-md-12">
				<div class="card">
				<div class="card-header">
				<h4 class="card-title">Información del paciente</h4>
				</div>
				<div class="card-body">
				<form action="insertarPaciente" method="post" name ="formulario" enctype="multipart/form-data">
					<div class="row">
					<div class="col-xl-6">
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Tipo de documento</label>
					<div class="col-lg-9">
					<select class="select form-control" name = "tipodocumento"  required="required">
						<option disabled="disabled" selected="selected"></option>
						<option >Cedula de Ciudadania</option>
						<option >Cedula de Extranjeria</option>
						<option >Tarjeta de Identidad</option>
						<option >Pasaporte</option>
					</select>
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Documento</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name = "documento"  required="required">
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Nombre</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name="nombre"  required="required">
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Apellido</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name = "apellido"  required="required">
					</div>
					</div>
					
					</div>
					
					<div class="col-xl-6">
					
					<div class="form-group row">
						<label class="col-lg-3 col-form-label">Genero</label>
						<div class="col-lg-9">
						<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="genero" value= "Masculino" id="gender_male" checked>
						<label class="form-check-label" for="gender_male">
						Masculino
						</label>
						</div>
						<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="genero" value = "Femenino "id="gender_female">
						<label class="form-check-label" for="gender_female">
						Femenino
						</label>
						</div>
						</div>
					 </div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Email</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name = "email"  required="required">
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Telefono</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name = "telefono"  required="required">
					</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleFormControlFile1">Foto del paciente (Opcional)</label>
						<input accept="image/png,image/jpeg" type="file" class="form-control-file" id="exampleFormControlFile1" name="archivo">
						<input type="hidden" name="foto" value="" />
					</div>	
					</div>
					</div>
										
					<div class="row">
					<div class="col-xl-6">
					
					<div class="form-group row">
					<label>Fecha Nacimiento</label>
					<input type="date" id="date" value="2000-06-01" class="form-control" name="fechanacimiento">
					<span class="form-text text-muted">dd/mm/yyyy</span>
					</div>
					</div>
					
					<div class="col-xl-6">
					<br>
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Odontologo</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" value="<c:out value='${odontologo.id}' />" name = "id_odontologo"  readonly="readonly">
					</div>
					</div>
					
					
					</div>
					</div>
					
					<div class="text-end">
						<button type="submit" class="btn btn-primary" onclick="cargarArchivo(exampleFormControlFile1)">Guardar</button>
					</div>
					
					
				</form>
				<iframe name="null" style="display: none;"></iframe>
				</div>
				</div>
				</div>
				</div>
		</div>
	</div>

</div>


<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/bootstrap.bundle.min.js"></script>

<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="assets/js/script.js"></script>

<script src="assets/js/codigo.js"></script>
</body>
</html>
			
