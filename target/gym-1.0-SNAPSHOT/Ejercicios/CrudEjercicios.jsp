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
        <title>Ejercicios</title>

        <!-- Bootstrap CSS y JavaScript -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="Estilos/style.min.css" rel="stylesheet">
        <!-- Flaticon Font -->
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
        <!-- DataTables -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.js"></script>
    </head>


    <body style="background-image: url('img/fondo1.jpg'); padding-bottom: 50px">
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


            <style>
                .card:hover {
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    transform: translateY(-2px);
                }
            </style>
            <h1 class="" style="padding-top: 10px; background-color: rgba(0, 0, 0, 0.3); color: #f5f5f5; font-size: 50px; text-align: center;">Lista de Ejercicios</h1>
            
            
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