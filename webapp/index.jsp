<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>Iniciar Sesión</title>
		    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="assets/css/estilos.css">
        </head>
        
        <body>

        
        <main>

            <div class="contenedor__todo">
                <div class="caja__trasera">
                    <div class="caja__trasera-login">
                        <h3>¿Ya tienes una cuenta?</h3>
                        <p>Inicia sesión para entrar en la página</p>
                        <button id="btn__iniciar-sesion">Iniciar Sesión</button>
                    </div>
                    <div class="caja__trasera-register">
                        <h3>¿Aún no tienes una cuenta?</h3>
                        <p>Regístrate para que puedas iniciar sesión</p>
                        <button id="btn__registrarse">Regístrarse</button>
                    </div>
                </div>

                <!--Formulario de Login y registro-->
                <div class="contenedor__login-register">
                    <!--Login-->
                    <form action="iniciar"  method="post" class="formulario__login">
                        <h2>Iniciar Sesión</h2>
                        <input type="text" name="usuario" placeholder="Usuario" required="required">
                        <input type="password" name="password" placeholder="Contraseña" required="required">
                        <button type="submit" class="btn btn-success">Entrar</button>
                    </form>

                    <!--Register-->
                    <form action="" class="formulario__register">
                        <h2>NO FUNCIONAL</h2>
                        <input type="text" placeholder="Nombre completo">
                        <input type="text" placeholder="Coreo tronico">
                        <input type="text" placeholder="Usuario">
                        <input type="password" placeholder="Contraseña">
                        <button>Regístrarse</button>
                    </form>
                </div>
            </div>

        </main>

        <script src="assets/js/script.js"></script>
           
            
        </body>