<%-- 
    Document   : VerEjercicios
    Created on : 11-21-2023, 10:54:58 PM
    Author     : Esau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><!doctype html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
     <link href="Estilos/style.min.css" rel="stylesheet">
</head>


    <body>
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
                        <a href="index.jsp" class="nav-item nav-link active">Home</a>

                        <c:choose>
                            <c:when test="${empty sessionScope.usuario}">
                                <a class="nav-link" aria-current="page" href="LoginController" id="login-link2"><i class="bi bi-person-check"></i> Iniciar Sesión</a>
                                <a class="nav-link" href="UsuarioController" id="login-link"><i class="bi bi-person-add"></i> Registro</a>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${sessionScope.usuario.roll eq 1}">
                                        <!-- Rol 0 (Cliente) -->
                                        <!--                                    <a class="nav-link" aria-current="page" href="categorias">Ejercicios</a>-->
                                        <a class="nav-link" aria-current="page" href="RutinaController">Mi Rutina</a>
                                        <a class="nav-link" aria-current="page" href="DatosController" id="datos">Datos Cuerpo</a>
                                        <a class="nav-link" aria-current="page" href="VerCategoria">Aprender GYM</a>
                                        <a class="nav-link" aria-current="page" href="graficos">Mostrar resumen</a>
                                      <a class="btn btn-outline-danger nav-item nav-link" href="LogoutController" id="login-link3" style="color: white;">
                                                <i class="bi bi-box-arrow-right"></i> <!-- Icono de cerrar sesión -->
                                                Cerrar Sesión
                                            </a>
                                    </c:when>
                                    <c:when test="${sessionScope.usuario.roll eq 0}">
                                        <!-- Rol 1 (Administrador) --> 
                                        <a class="nav-link" aria-current="page" href="MostrarFormCategoria">Agregar Categorías</a>
                                        <a class="nav-link" aria-current="page" href="MostrarFormEjercicio">Agregar Ejercicios</a>
                                        <a class="nav-link" aria-current="page" href="CrudEjercicios">Ver Ejercicios</a>
                                        <a class="nav-link" aria-current="page" href="CrudCategorias">Ver Categorias</a>

                                       <form class="d-flex" role="search">
                                            <a class="btn btn-outline-danger nav-item nav-link" href="LogoutController" id="login-link3" style="color: white;">
                                                <i class="bi bi-box-arrow-right"></i> <!-- Icono de cerrar sesión -->
                                                Cerrar Sesión
                                            </a>
                                        </form>

                                    </c:when>
                                </c:choose>
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

        if (<%= session.getAttribute("usuario") == null %>) {
            logoutLink.style.display = "none";
        } else {
            loginLink.style.display = "none";
            loginLink2.style.display = "none";
        }

        var idRol = ${sessionScope.usuario.roll};
        console.log(idRol);

        var ejer = document.getElementById("newejercicios");
        var datos = document.getElementById("datos");
        
        // datos.style.display = "block";  // Este bloque se encuentra comentado ya que no se está utilizando.

        if (idRol === 1) {
            // newejercicios.style.display = "block";  // Este bloque se encuentra comentado ya que no se está utilizando.
        }
    </script>

        <style>
            /* Estilos para el contenedor */
            .fondo-con-imagen {
                background-color: black; /* Fondo negro */
                /* Ruta de tu imagen de fondo */
                background-size: cover; /* Ajusta el tamaño de la imagen para cubrir el elemento */
                color: #fff; /* Cambia el color del texto para que sea legible en fondo negro */
                padding: 20px; /* Añade espaciado interno si es necesario */
            }

            /* Estilos para los elementos internos (tarjetas) */
            .card {
                border: 1px solid #ccc;
                border-radius: 10px;
                margin: 10px; /* Espacio entre las tarjetas */
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* Sombra suave */
                transition: transform 0.2s; /* Efecto de transición al pasar el mouse */
            }

            .card:hover {
                transform: scale(1.05); /* Escalar la tarjeta al pasar el mouse */
            }
        </style>        
        <div class="container-fluid fondo-con-imagen" style="background-image: url('img/fondo1.jpg'); padding-bottom: 50px">
            <h1 class="" style="padding-top: 150px; background-color: rgba(0, 0, 0, 0.3); color: #f5f5f5; font-size: 50px; text-align: center;">Mejores Ejercicios</h1>


            <!-- Product List -->
            <div class="row">
                <!-- Subastas -->
                <div class="row">
                    <c:forEach var="ejercicio" items="${listaEjercicio}">
                        <div class="col-md-4 mb-4">
                            <div class="card h-100 rounded bg-light" style="max-width: 400px; position: relative;">
                                <img src="${ejercicio.imagenUrl}" alt="${ejercicio.nombre}" class="card-img-top" style="max-height: 300px; object-fit: cover;" />

                                <!-- Contenedor para el icono de reloj y el texto -->
                                <div style="position: absolute; top: 10px; right: 10px; background-color: rgba(255, 255, 255, 0.7); padding: 5px; margin-bottom: 35px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                    <path d="M7.5.5a.5.5 0 0 1 .5.5V7a.5.5 0 0 1-.293.456L7 7.707V3.5a.5.5 0 0 1 .5-.5zM8 0a8 8 0 1 0 8 8 8 8 0 0 0-8-8zm0 14A6 6 0 1 1 8 2a6 6 0 0 1 0 12z"/>
                                    <path d="M8.5 1a.5.5 0 0 0-.5.5V7a.5.5 0 0 0 .293.456L8.5 7.707V1.5a.5.5 0 0 0-.5-.5z"/>
                                    </svg> <!-- Icono de reloj (Bootstrap Icons) -->
                                    
                                </div>

                                <div class="card-body">
                                    <h5 class="card-title font-weight-bold" style="font-size: 1.5rem; font-family: 'Arial', sans-serif;">${ejercicio.nombre}</h5>
                                    <p class="card-title font-weight-bold" style="font-size: 0.9rem; font-family: 'Arial', sans-serif; color: black;">Descripción: ${ejercicio.descripcion}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>






        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
