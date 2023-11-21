<%@page import="Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Page</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.28/sweetalert2.min.css"
          integrity="sha512-IScV5kvJo+TIPbxENerxZcEpu9VrLUGh1qYWv6Z9aylhxWE4k4Fch3CHl0IYYmN+jrnWQBPlpoTVoWfSMakoKA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css"
          integrity="sha512-Z/def5z5u2aR89OuzYcxmDJ0Bnd5V1cKqBEbvLOiUNWdg9PQeXVvXLI90SE4QOHGlfLqUnDNVAYyZi8UwUTmWQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="WEB-INF/styles.min.css" rel="stylesheet" type="text/css"/>
    <link href="WEB-INF/tailwind.output.css" rel="stylesheet" type="text/css"/>
    <link href="WEB-INF/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="container">
    <h1>Hello World!</h1>

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
    <h2 class="mt-3">Bienvenido, <%= nombreUsuario%>!</h2>
    <%
        }
    %>
</div>

<div class="container">
    <div class="row">
        <div class="col-3"></div>
        <div class="col-4">
            <!-- Envolvemos la card en un hipervínculo -->
            <a href="RutinaController" class="card text-bg-dark" style="width: 400px; height: 300px">
                <img src="./img/gym1.jpeg" class="card-img" alt="...">
                <div class="card-img-overlay">
                    <h5 class="card-title">Crear mi rutina</h5>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                    <p class="card-text"><small>Last updated 3 mins ago</small></p>
                </div>
            </a>
        </div>
        <div class="col-3"></div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.28/sweetalert2.all.js"
        integrity="sha512-cD1xrn0N1tV0ze8axCp+noWgxMFlWVg22HBXUfowicWhJsnAcSXNKnwI77Bkn3yLyqGvwZ/a8M2PtOjVp5vMaw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js"
        integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
