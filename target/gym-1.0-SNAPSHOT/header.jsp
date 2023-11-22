<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tu Sitio Web</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Agregar
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-item">
                                        <a href="/MostrarFormCategoria">Agregar CategorÃ­as</a>
                                    </li>
                                    <li class="dropdown-item">
                                        <a href="/MostrarFormEjercicio">Agregar Ejercicios</a>
                                    </li>
                                </ul>
                            </li>
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
        
        // datos.style.display = "block";  // Este bloque se encuentra comentado ya que no se estÃ¡ utilizando.

        if (idRol === 1) {
            // newejercicios.style.display = "block";  // Este bloque se encuentra comentado ya que no se estÃ¡ utilizando.
        }
    </script>
</body>
</html>
