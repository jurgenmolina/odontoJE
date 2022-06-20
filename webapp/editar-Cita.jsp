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
		<div class="content container-fluid">
		
			<div class="row">
				<div class="col-md-12">
				<div class="card">
				<div class="card-header">
				<h4 class="card-title">Revisión del paciente</h4>
				</div>
				<div class="card-body">
				
				
				<form action="updateCita" method="post"  name ="formulario" enctype="multipart/form-data" >
				<div class="row">
					<div class="col-xl-6">
					
					<c:if test="${cita != null}">
                            <input type="hidden" name="id" value="<c:out value='${cita.id}' />" />
                    </c:if>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Paciente</label>
					<div class="col-lg-9">
						<input type="text" class="form-control" value="<c:out value='${cita.paciente.nombre} ${cita.paciente.apellido}' />" name = "paciente"  readonly="readonly">
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Odontologo</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" value="<c:out value='${cita.odontologo.nombre}' />" name = "odontologo"  readonly="readonly">
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-lg-3 col-form-label">Fecha de la cita</label>
					<div class="col-lg-9">
					<input type="text" class="form-control" value="<c:out value='${cita.fecha}' />" name = "odontologo"  readonly="readonly">
					</div>
					</div>
					
					<div class="form-group row">
					<label class="col-form-label col-md-2">	Detalle </label>
					<div class="col-md-10">
					<textarea rows="5" cols="5" class="form-control" placeholder="Detalle de la consulta odontologica " name = "consulta" required="required">${cita.consulta}</textarea>
					</div>
					</div>
					
					<div class="form-group row">
					<div class="mb-3">
						<a href="http://localhost/Servidor/archivos/${cita.archivo}" download="${cita.archivo}">${cita.archivo}</a>
						<label for="formFile"  class="form-label">Archivos (ZIP)</label>
						<input accept=".zip,.rar,.7zip" type="file" class="form-control" id="formFile" required="required" name="archivo">
						<input type="hidden" name="foto" value="" />
						
					</div>
					</div>
					
					
					
					<div class="form-group row">
					<div class="mb-3">
						<a href="http://localhost/Servidor/firmas/${cita.firma}" download="${cita.firma}">${cita.firma}</a>
						<label for="formFile"  class="form-label">Firma</label>
						<input accept=".png" type="file" class="form-control" id="formFile2" required="required" name="archivo2">
						<input type="hidden" name="foto2" value="" />
						</div>
					</div>
					
					<br>
					<br>
					 <p>Firme a continuación:</p>
		    		<canvas id="canvas"></canvas>
	    			 <br>
	   				 <button id="btnLimpiar">Limpiar</button>
	   				 <button id="btnDescargar">Descargar</button>
	    			 <button id="btnGenerarDocumento" disabled></button>
					
					
					<div class="text-end">
						<button type="submit" class="btn btn-primary" onclick="cargarArchivo(formFile, formFile2)" >Guardar</button>
					</div>
					</div>
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
<script src="assets/js/firma.js"></script>

<script src="assets/js/archivo.js"></script>

<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/bootstrap.bundle.min.js"></script>

<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="assets/js/script.js"></script>


</body>
</html>