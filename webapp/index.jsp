<%@ page language="java" contentType="text/html; charset = utf-8"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>Inicio - OdontoJE</title>

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
    <span class="user-img"><img class="rounded-circle" src="assets/img/profiles/jurgen1.jpg" width="31" alt="Seema Sisty"></span>
    </a>
    <div class="dropdown-menu">
    <div class="user-header">
    <div class="avatar avatar-sm">
    <img src="assets/img/profiles/jurgen1.jpg" alt="User Image" class="avatar-img rounded-circle">
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

			<li class="active" >
			<a href="inicio"><i class="fe fe-users"></i> <span>Lista de Pacientes</span></a>
			</li>
			
			<li>
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
			<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
				<h4 class="card-title">Pacientes</h4>
				</div>
				
			<div class="card-body">
			<div class="table-responsive">
			<table class="table mb-0">
				<thead>
					<tr>
					<th>Tipo Documento</th>
					<th>Documento</th>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Email</th>
					<th>Telefono</th>
					<th></th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach var="paciente" items="${listPaciente}">

                                <tr>
                                    
                                    <td>
                                        <c:out value="${paciente.tipodocumento}" />
                                    </td>
                                    <td>
                                        <c:out value="${paciente.documento}" />
                                    </td>
                                    <td>
                                        <c:out value="${paciente.nombre}" />
                                    </td>
                                    <td>
                                        <c:out value="${paciente.apellido}" />
                                    </td>
                                    <td>
                                        <c:out value="${paciente.email}" />
                                    </td>
                                    <td>
                                        <c:out value="${paciente.telefono}" />
                                    </td>
                                    
                                    <td><a href="editarPaciente?id=<c:out value='${paciente.id}' />">Editar</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="eliminarPaciente?id=<c:out value='${paciente.id}' />">Eliminar</a></td>
                                </tr>
                            </c:forEach>
				</tbody>
			</table>
			</div>
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
</body>
</html>