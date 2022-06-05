<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
			
			<h3>Bienvenido Odontologo</h3>
			<h3><c:out value='${odontologo.id}'/></h3>
			<h3><c:out value='${odontologo.nombre}'/></h3>
			

	
</body>
</html>