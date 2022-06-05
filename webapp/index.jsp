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

			<c:if test="${odontologo !=null}">
				<script>
				    window.onload=function(){
				   // Una vez cargada la página, el formulario se enviara automáticamente.
					document.forms["inicio"].submit();
				    }
				</script>
			</c:if>
			
			<form name="inicio" action="dash" method="post"></form>

	<form action="login"  method="post" >
         <h2>Iniciar Sesión</h2>
         <input type="text" name="usuario" required="required">
         <input type="password" name="password" required="required">
         <button type="submit" >Entrar</button>
    </form>
</body>
</html>