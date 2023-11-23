<%-- 
    Document   : EditarEjercicio
    Created on : 22 nov. 2023, 22:40:47
    Author     : chris
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Formulario de Ejercicio</title>
        <link href="Estilos/style.min.css" rel="stylesheet">
        <!-- Flaticon Font -->
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
    </head>
    <body  style="background-image: url('img/fondo1.jpg');padding-bottom: 20px" >
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

        <h1 class="" style="padding-top: 160px; background-color: rgba(0, 0, 0, 0.3); color: #f5f5f5; font-size: 50px; text-align: center;">Editar Ejercicios</h1>

        <div class="container mt-5">

            <div class="card">
                <div class="card-body">
                    <form action="GuardarEjercicioEditado" method="post">
                        <div class="form-group">
                            <label for="nombreEjercicio">Nombre del Ejercicio:</label>
                            <input type="text" class="form-control" id="nombreEjercicio" name="nombreEjercicio" value="${listaEjercicios.getNombre()}" required>
                            <input type="text" class="form-control" id="id" hidden name="id" value="${listaEjercicios.getIdEjercicio()}" required>
                        </div>

                        <div class="form-group">
                            <label for="urlImagen">URL de la Imagen:</label>
                            <input type="url" class="form-control" id="urlImagen" name="urlImagen" value="${listaEjercicios.getImagenUrl()}" required>
                        </div>

                        <div class="form-group">
                            <label for="descripcion">Descripción:</label>
                            <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required>${listaEjercicios.getDescripcion()}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="categoria">Categoría:</label>
                            <select name="categoria" class="form-control form-control-lg ">
                                <c:forEach var="categoria" items="${listaCategorias}">
                                    <option value="${categoria.idCategoria}">${categoria.descripcion}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>

        </div>

        <!-- Incluye la biblioteca de Bootstrap JS (opcional) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>



