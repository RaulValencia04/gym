<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Models.Usuario"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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



        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;700;900&family=Raleway:wght@100;300;500;700&display=swap');

            :root{
                --bodyBack: #ffeaed;
                --textColor: #1b2741;
                --starColor: #f67034;
                --sectionBack: #f7f6f9;
            }

            .header{
                width: 100%;
                text-align: center;
            }
            .header h1{
                font-size: 4em;
                text-transform: uppercase;
                color: var(--textColor);
            }
            .products{
                width: 100%;
                align-self: center;
                height: 70%;
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                gap: 40px;
            }
            .product{
                position: relative;
                background-color: var(--sectionBack);
                width: 400px;
                height: 350px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, .3);
                display: flex;
                flex-direction: column;
                justify-content: space-between;

                border-radius: 10px;
                transition: .3s;
            }
            .product:hover{
                transform: translateY(-15px);
                box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
            }
            .image{
                width:100%;
                height: 100%;
                display: grid;
                place-content: center;
            }
            .image img{
                max-width: 400px;
                height: 345px;
            }


            .product {
                position: relative;
            }

            .texto-centrado {
                position: absolute;
                top: 50%;
                left: 50%;
                font-size: 50px;
                transform: translate(-50%, -50%);
                background-color: rgba(255, 255, 255, 0.3); /* Fondo semitransparente para mayor legibilidad */
                padding: 10px; /* Añade relleno para que el texto sea legible */
            }

            .imagen{

                background-size: cover; /* Ajusta la imagen para cubrir todo el elemento */
                background-repeat: no-repeat; /* Evita la repetición de la imagen */
                /* Otras propiedades de fondo opcionales */
                background-position: center; /* Centra la imagen en el elemento */
                /* background-color: transparent; */ /* Opcional: ajusta el color de fondo */
                /* width: 100%; */ /* Opcional: ajusta el ancho del elemento */
                /* height: 300px; */ /* Opcional: ajusta la altura del elemento */
            }

            .sin-contorno {
                border: none;
                background: none;
                padding: 0;
                margin: 0;
                font-size: inherit;
                color: inherit;
                cursor: pointer;
            }
        </style>

        <div class="container-fluid fondo-con-imagen" style="background-image: url('img/fondo1.jpg'); padding-bottom: 50px">
            <h1 class="" style="padding-top: 150px; background-color: rgba(0, 0, 0, 0.3); color: #f5f5f5; font-size: 50px; text-align: center;">Mejores Categorias de Ejercicios</h1>
            <div class="products mb-5">
                <div class="row justify-content: space-between">

                    <div class="col-12 row justify-content-between">
                        <c:forEach var="categoria" items="${listaCategorias}">
                            <div class="col-md-4 mb-4">
                                <form action="VerEjercicio" method="post" class="form-inline">
                                    <button type="submit" class="sin-contorno">
                                        <div class="product mt-5">
                                            <div class="image">
                                                <img class="imgt imagen-categoria" src="${categoria.imgUrl}" alt="">
                                                <input type="hidden" name="cats" value="${categoria.idCategoria}">
                                                <div class="texto-centrado">${categoria.descripcion}</div>
                                            </div>
                                        </div>
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </div>


                </div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>


