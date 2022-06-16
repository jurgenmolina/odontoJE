<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<title>OdontoJE</title>
	
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
	
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="assets/css/feathericon.min.css">
	
	<link rel="stylesheet" href="assets/plugins/morris/morris.css">
	
	<link rel="stylesheet" href="assets/css/style.css">
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
			
	<form name="inicio" action="inicio" method="post"></form>

	<div class="main-wrapper login-body">
		<div class="login-wrapper">
			<div class="container">
				<div class="loginbox">
					<div class="login-right">
						<div class="login-right-wrap">
							<h1>OdontoJe</h1>
							<p class="account-subtitle">Iniciar Sesión</p>
							
								<form action="login" method = "post">
								<div class="form-group">
								 <input type="text" class="form-control" name="usuario" required="required" placeholder="Usuario">
								</div>
								<div class="form-group">
								<input type="password" class="form-control" name="password" required="required" placeholder="Contraseña">
								</div>
								<div class="form-group">
								<button class="btn btn-primary btn-block" type="submit">Entrar</button>
								</div>
								</form>
	
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