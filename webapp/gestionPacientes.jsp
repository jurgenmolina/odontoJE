<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!doctype html>
<html lang="en">

<head>
    
    <title>Odonto JE</title>
</head>

<body>
   	
   			<h1>Gestion de PAcientes</h1>
			<h3>Odontologo _ <c:out value='${odontologo.nombre}'/></h3>
			
			<form action="registrarPaciente" method="post">
			    <button name="1">Registrar nuevo paciente</button>
			</form>
        
</body>
  

			
			
			
