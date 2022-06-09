<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!doctype html>
<html lang="en">

<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <title>Odonto JE</title>
</head>

<body>
   	
   			<h1>Gestion de PAcientes</h1>
			<h3>Odontologo _ <c:out value='${odontologo.nombre}'/></h3>
			
			<form action="registrarPaciente" method="post">
			    <button name="registro">Registrar nuevo paciente</button>
			</form>
			
			 <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Lista de Pacientes</h3>
                    <hr>
                    <div class="container text-left">

                        <a href="<%=request.getContextPath()%>/inicio" class="btn btn-success">Atras</a>
                    </div>
                    <br>
                    
                    <br>
                    <table class="table table-bordered" id="tablePaciente">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tipo Documento</th>
                                <th>Documento</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Email</th>
                                <th>Telefono</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   for (Todo todo: todos) {  -->
                            <c:forEach var="paciente" items="${list.get(1)}">

                                <tr>
                                    <td>
                                        <c:out value="${paciente.id}" />
                                    </td>
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
                                    
                                    <td><a href="editPaciente?id=<c:out value='${paciente.id}' />">Editar</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="eliminarPaciente?id=<c:out value='${paciente.id}' />">Eliminar</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
            
	
        
</body>
  

			
			
			
