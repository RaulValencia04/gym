<%-- 
    Document   : CrearEjercicios
    Created on : 11-21-2023, 03:30:37 PM
    Author     : Esau
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="Estilos/style.min.css" rel="stylesheet">
    </head>

    <body style="background-image: url('img/fondo1.jpg'); padding-bottom: 0px">
        <div class="container-fluid p-0 nav-bar">


            <nav class="navbar navbar-expand-lg bg-none navbar-dark py-3">
                <a href="" class="navbar-brand">
                    <h1 class="m-0 display-4 font-weight-bold text-uppercase text-white">GymRats</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto p-4 bg-secondary">
                        <a href="#" class="nav-item nav-link active">Home</a>

                        <c:choose>
                            <c:when test="${empty sessionScope.usuario}">
                                <a class="nav-link" aria-current="page" href="LoginController" id="login-link2"><i class="bi bi-person-check"></i> Iniciar SesiÃ³n</a>
                                <a class="nav-link" href="UsuarioController" id="login-link"><i class="bi bi-person-add"></i> Registro</a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" aria-current="page" href="/categorias">Ejercicios</a>
                                <a class="nav-link" aria-current="page" href="DatosController" id="datos">Datos Cuerpo</a>
                                <a class="nav-link "  aria-current="page" href="VerCategoria">Aprender GYM</a>
                                <ul class="navbar-nav">

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Agregar
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="MostrarFormCategoria">Agregar Categorías</a>
                                            <a class="dropdown-item" href="MostrarFormEjercicio">Agregar Ejercicios</a>
                                        </div>
                                    </li>
                                </ul>



                                <form class="d-flex" role="search">
                                    <a class="btn btn-outline nav-item nav-link" href="LogoutController" id="login-link3"><i class="bi bi-person-add"></i> Salir</a>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </nav>
        </div>


        <script>
            var loginLink = document.getElementById("login-link");
            var loginLink2 = document.getElementById("login-link2");
            var logoutLink = document.getElementById("logout-link");

            if (<%= session.getAttribute("usuario") == null%>) {
                logoutLink.style.display = "none";
            } else {
                loginLink.style.display = "none";
                loginLink2.style.display = "none";
            }

            var idRol = ${sessionScope.usuario.roll};
            console.log(idRol);

            var ejer = document.getElementById("newejercicios");
            var datos = document.getElementById("datos");

            // datos.style.display = "block";  // Este bloque se encuentra comentado ya que no se estÃ¡ utilizando.

            if (idRol === 1) {
                // newejercicios.style.display = "block";  // Este bloque se encuentra comentado ya que no se estÃ¡ utilizando.
            }
        </script>


        <div class="container mt-5" style="padding-top: 170px">
            <h2>Formulario de Categoría</h2>

            <form action="GuardarCategoria" method="post">
                <div class="form-group">
                    <label for="nombreCategoria">Nombre de la Categoría:</label>
                    <input type="text" class="form-control" id="nombreCategoria" name="nombreCategoria" required>
                </div>

                <div class="form-group">
                    <label for="urlImagen">URL de la Imagen:</label>
                    <input type="url" class="form-control" id="urlImagen" name="urlImagen" required>
                </div>

                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>

        <!-- Incluye la biblioteca de Bootstrap JS (opcional) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>