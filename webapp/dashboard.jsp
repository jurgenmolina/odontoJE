<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!doctype html>
<html lang="en">

<head>
    
    <title>Odonto JE</title>
</head>

<body>
   	
   			<h1>INICIO</h1>
			<h3><c:out value='${odontologo.nombre}'/></h3>
			
			<form action="gestionPaciente" method="post">
			    <button name="gestion">Gestion Pacientes</button>
			</form>
        
</body>
  

			
			
			
