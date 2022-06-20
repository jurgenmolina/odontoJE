<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
      pageEncoding="ISO-8859-1"%> 
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>Paciente - OdontoJE</title>

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
			
			<li  >
			<a href="registrarPaciente"><i class="fe fe-user"></i> <span>Registrar paciente</span></a>
			</li>
			
			<li>
			<a href="registrarCita"><i class="fe fe-edit"></i> <span>Agendar Cita</span></a>
			</li>
			
			<li>
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
<div class="content container-fluid">
<div class="page-header">
<div class="row align-items-center">
	<div class="col">
	<h3 class="page-title">Perfil del Paciente</h3>
	
	</div>
</div>
</div>
<div class="row settings-tab">
<div class="col-md-4">
<div class="card">
<div class="card-header all-center">
<a href="" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="http://localhost/Servidor/profiles/${paciente.foto}" alt="Foto del paciente">
</a>
<h6>${paciente.nombre} ${paciente.apellido}</h6>
<p>Paciente</p>
</div>
<div class="card-body p-0">
<div class="profile-list">
<a href="#"><i class="fe fe-comment-o"></i></a>
<a href="#">Mensajes</a>
<a href="#" class="float-end"><h5>deshabilitado</h5></a>
</div>
<div class="profile-list">
<a href="#"><i class="fe fe-phone"></i></a>
<a href="#">Llamadas</a>
<a href="#" class="float-end"><h5>deshabilitado</h5></a>
</div>
<div class="profile-list">
<a href="#"><i class="fe fe-disabled"></i></a>
<a href="#">Citas</a>
<a href="#" class="float-end"><h5>deshabilitado</h5></a>
</div>

<form action="updateFotoPaciente" method="post" name ="formulario" enctype="multipart/form-data">
<h6>Actualizar foto</h6>

	<div class="form-group row">
						<c:if test="${paciente != null}">
                            <input type="hidden" name="id" value="<c:out value='${paciente.id}' />" />
                    	</c:if>
						<input  accept=".jpg,.png,.jpge" type="file" class="form-control-file" id="exampleFormControlFile1" name="archivo">
						<input type="hidden" name="foto" value="" />
					</div>	
	
	<button type="submit" class="btn btn-primary" onclick="cargarArchivo(exampleFormControlFile1)">Guardar</button>
</form>

</div>
</div>
</div>
<div class="col-md-8">
<div class="card">
<div class="card-header">
 <h4 class="card-title">Información del paciente</h4>
</div>
<div class="card-body">
				<form action="actualizarPaciente" method="post"">
					<div class="row">
					
					<c:if test="${paciente != null}">
                            <input type="hidden" name="id" value="<c:out value='${paciente.id}' />" />
                    </c:if>
                    
                    <c:if test="${paciente != null}">
                            <input type="hidden" name="foto" value="<c:out value='${paciente.foto}' />" />
                    </c:if>
					
					<c:if test="${paciente.tipodocumento == 'Cedula de Ciudadania'}">
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Tipo de documento</label>
					<div class="col-lg-9">
					<select class="select form-control" name = "tipodocumento" required="required">
						<option selected="selected" >Cedula de Ciudadania</option>
						<option >Cedula de Extranjeria</option>
						<option >Tarjeta de Identidad</option>
						<option >Pasaporte</option>
					</select>
					</div>
					</div>
					</c:if>
					
					<c:if test="${paciente.tipodocumento == 'Cedula de Extranjeria'}">
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Tipo de documento</label>
					<div class="col-lg-9">
					<select class="select form-control" name = "tipodocumento" required="required">
						<option >Cedula de Ciudadania</option>
						<option selected="selected" >Cedula de Extranjeria</option>
						<option >Tarjeta de Identidad</option>
						<option >Pasaporte</option>
					</select>
					</div>
					</div>
					</c:if>
					
					<c:if test="${paciente.tipodocumento == 'Tarjeta de Identidad'}">
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Tipo de documento</label>
					<div class="col-lg-9">
					<select class="select form-control" name = "tipodocumento" required="required">
						<option >Cedula de Ciudadania</option>
						<option >Cedula de Extranjeria</option>
						<option selected="selected" >Tarjeta de Identidad</option>
						<option >Pasaporte</option>
					</select>
					</div>
					</div>
					</c:if>
					
					<c:if test="${paciente.tipodocumento == 'Pasaporte'}">
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Tipo de documento</label>
					<div class="col-lg-9">
					<select class="select form-control" name = "tipodocumento" required="required">
						<option >Cedula de Ciudadania</option>
						<option >Cedula de Extranjeria</option>
						<option >Tarjeta de Identidad</option>
						<option selected="selected" >Pasaporte</option>
					</select>
					</div>
					</div>
					</c:if>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Documento</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name = "documento"  value="<c:out value='${paciente.documento}' />" required="required">
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Nombre</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name="nombre" value="<c:out value='${paciente.nombre}' />" required="required">
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Apellido</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name = "apellido" value="<c:out value='${paciente.apellido}' />" required="required">
					</div>
					</div>
					
					<c:if test="${paciente.genero == 'Femenino '}">
                           <div class="form-group row">
						<label class="col-lg-3 col-form-label">Genero</label>
						<div class="col-lg-9">
						<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="genero" value= "Masculino" id="gender_male">
						<label class="form-check-label" for="gender_male">
						Masculino
						</label>
						</div>
						<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="genero" value = "Femenino "id="gender_female"  checked>
						<label class="form-check-label" for="gender_female">
						Femenino
						</label>
						</div>
						</div>
					 </div>
                    </c:if>
                    
					<c:if test="${paciente.genero == 'Masculino'}">
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
					</c:if>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Email</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name = "email"  value="<c:out value='${paciente.email}' />"  required="required">
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Telefono</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" name = "telefono"  value="<c:out value='${paciente.telefono}' />" required="required">
					</div>
					</div>
					
									
					
					<div class="form-group row">
					<label>Fecha Nacimiento</label>
					<input type="date" id="date"  value="<c:out value='${paciente.fechanacimiento}' />" class="form-control" name="fechanacimiento">
					<span class="form-text text-muted">dd/mm/yyyy</span>
					</div>
					
					<br>
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Odontologo</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" value="<c:out value='${odontologo.id}' />" name = "id_odontologo"  readonly="readonly">
					</div>
					</div>
					</div>
					
					
					<div class="text-end">
						<button type="submit" class="btn btn-primary">Actualizar</button>
					</div>
					
					
				</form>
				
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