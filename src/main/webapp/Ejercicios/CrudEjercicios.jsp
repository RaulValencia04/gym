<%-- 
    Document   : CrudEjercicios
    Created on : 22 nov. 2023, 22:04:18
    Author     : chris
--%>

<%@page import="Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gym</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.18.0/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="Estilos/style.min.css" rel="stylesheet">
        <!-- Flaticon Font -->
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
        
        <!-- DataTables -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.js"></script>
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

            <style>
                .card:hover {
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    transform: translateY(-2px);
                }
            </style>
            <h1 class="" style="padding-top: 160px; background-color: rgba(0, 0, 0, 0.3); color: #f5f5f5; font-size: 50px; text-align: center;">Lista de Ejercicios</h1>
            
            
            <div class="container mt-2" style="padding-top: 50px">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                               
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombre</th>
                                             <th>Descripción</th>
                                            <th>Dirección de Imagen</th>
                                             <th>ID categoria</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="ejercicio" items="${listaEjercicios}">
                                            <tr>
                                                <td>${ejercicio.idEjercicio}</td>
                                                <td>${ejercicio.nombre}</td>
                                                <td>${ejercicio.descripcion}</td>
                                                <td>${ejercicio.imagenUrl}</td>
                                                <td>${ejercicio.idCategoria}</td>
                                                <td>
                                                    <a href="EditarEjercicio?id=${ejercicio.idEjercicio}" class="btn btn-warning">Editar</a>
                                                    <a href="EliminarEjercicio?id=${ejercicio.idEjercicio}" class="btn btn-danger">Eliminar</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%-- Mostrar mensaje de éxito si está presente en la sesión --%>
            <% String successMessage = (String) session.getAttribute("successMessage"); %>
            <% if (successMessage != null) {%>
            <script>
                Swal.fire({
                    title: 'Éxito',
                    text: '<%= successMessage%>',
                    icon: 'success',
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000
                });
            </script>
            <% session.removeAttribute("successMessage"); %>
            <% } %>

            <%-- Mostrar mensaje de error si está presente en la sesión --%>
            <% String errorMessage = (String) session.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) {%>
            <script>
                Swal.fire({
                    title: 'Error',
                    text: '<%= errorMessage%>',
                    icon: 'error',
                    toast: true,
                    position: 'center',
                    showConfirmButton: false,
                    timer: 3000
                });
            </script>
            <% session.removeAttribute("errorMessage"); %>
            <% } %>

            <%!
                // Método para verificar la sesión
                private boolean isSessionActive(HttpSession session) {
                    return session != null && session.getAttribute("usuario") != null;
                }
            %>

            <%
                // Verificar si hay una sesión activa llamando al método
                if (isSessionActive(request.getSession(false))) {
                    // Si hay una sesión activa, muestra el contenido que deseas
                    Usuario usuario = (Usuario) session.getAttribute("usuario");
                    int nombreUsuario = usuario.getRoll();
            %>

            <%
                }
            %>

            <script>
                $(document).ready(function () {
                    // Inicializa la tabla como un DataTable
                    $('.table').DataTable();
                });
            </script>



        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.28/sweetalert2.all.js" integrity="sha512-cD1xrn0N1tV0ze8axCp+noWgxMFlWVg22HBXUfowicWhJsnAcSXNKnwI77Bkn3yLyqGvwZ/a8M2PtOjVp5vMaw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js" integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>