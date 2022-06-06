<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>Registrar Candidato</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
         <script>
	        function saludo() {
	        	 window.alert("Registrado con Exito");
	        	}
        </script>
        </head>

        <body>

            <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #01579B">
                    <div>
                        <a href="<%=request.getContextPath()%>/gestionPaciente" class="navbar-brand"> Volver al Inicio </a>
                    </div>

                    
                </nav>
            </header>
            <br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">

                        <c:if test="${paciente != null}">
                            <form action="update" method="post">
                        </c:if>
                        <c:if test="${paciente == null}">
                            <form action="insertarPaciente" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${paciente != null}">
                                    Editar paciente
                                </c:if>
                                <c:if test="${paciente == null}">
                                    Agregar nuevo paciente
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${paciente != null}">
                            <input type="hidden" name="id" value="<c:out value='${paciente.id}' />" />
                        </c:if>
                        
                        <fieldset class="form-group">
                            <label>Tipo Documento</label> <input type="text" value="<c:out value='${paciente.tipodocumento}' />" class="form-control" name="tipodocumento" required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Documento</label> <input type="text" value="<c:out value='${paciente.documento}' />" class="form-control" name="documento" required="required">
                        </fieldset>
                        
						<fieldset class="form-group">
                            <label>Nombre</label> <input type="text" value="<c:out value='${paciente.nombre}' />" class="form-control" name="nombre" required="required">
                        </fieldset>
                        
                       	<fieldset class="form-group">
                            <label>Apellido</label> <input type="text" value="<c:out value='${paciente.apellido}' />" class="form-control" name="apellido" required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Email</label> <input type="text" value="<c:out value='${paciente.email}' />" class="form-control" name="email" required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Telefono</label> <input type="text" value="<c:out value='${paciente.telefono}' />" class="form-control" name="telefono" required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Foto</label> <input type="text" value="<c:out value='${paciente.foto}' />" class="form-control" name="foto" >
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Odontologo</label> <input type="text" value="<c:out value='${list.get(0).id}' />" class="form-control" name="id_odontologo" readonly >
                        </fieldset>
          
                        <button type="submit" class="btn btn-success" onclick="saludo()">Registrar paciente</button>
                        </form>
                    </div>
                </div>
            </div>
        </body>
<html>