<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">		
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<title>Login</title>
<style> 

        body{
            background: #ffe259;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #ffa751, #ffe259);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #ffa751, #ffe259); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

        }
        .bg{
            background-image: url(img/BG.jpg);
            background-position: center center;
        }
    </style>
</head>

<body class="bg-dark">

	<c:if test="${odontologo !=null}">
				<script>
				    window.onload=function(){
				   // Una vez cargada la página, el formulario se enviara automáticamente.
					document.forms["inicio"].submit();
				    }
				</script>
	</c:if>
			
	<form name="inicio" action="inicio" method="post"></form>

    <div class="container w-50 bg-primary mt-5 rounded shadow" >
        <div class="row align-items-center align-items-stretch">
            <div class="col d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded bg">
                
            </div>
    
            <div class="col bg-white p-5 col-lg-7 col-xl-6 rounded-end">
                
                
                <br>
                
                <h2 class="fw-bold text-center pt-5 mb-5">Bienvenido</h2>

                

                <!--
                    Formulario de login
                -->
                
                <form action="login" method="post" >
                    <div class="mb-4">
                        <label for="email" class="form-label">Usuario</label>
                        <input type="text" class="form-control" name="usuario" required="required">
                    </div>
                    <div class="mb-4">
                        <label for="password" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" name="password" required="required">
                    </div>
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Iniciar sesión</button>
                    </div>
                    
                </form>
				
				
                <br>
                <br>
                <br>
               
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>