<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tu Sitio Web</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-rbs5IB3ZHD3oiI1SINDbBjVw4WofQ1yzS1z9tpwYlRQikqFFsfZt3yQxhqF5SquZ" crossorigin="anonymous">

    <!-- Estilos personalizados -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #343a40;
        }

        .navbar-brand {
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: #ffffff;
            margin-right: 15px;
            font-weight: bold;
        }

        .navbar-nav .nav-link:hover {
            color: #ffc107;
        }
/*
        .container {
            margin-top: 50px;
        }*/

        h1 {
            color: #007bff;
        }

        p {
            font-size: 1.1rem;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Tu Marca</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="UsuarioController" id="login-link">Registro</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LoginController"id="login-link2">Login</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="DatosController" id="datos" style="display: none;"> mi cuerpo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="DatosController" id="newejercicios" style="display: none;">Crear ejercicios</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!-- JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.28/sweetalert2.all.js" integrity="sha512-cD1xrn0N1tV0ze8axCp+noWgxMFlWVg22HBXUfowicWhJsnAcSXNKnwI77Bkn3yLyqGvwZ/a8M2PtOjVp5vMaw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js" integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
    </script>
     <script>

        // Obtener el valor de idRol del usuario de la sesi?n
        var idRol = ${sessionScope.usuario.roll} ;
        console.log(idRol);

        // Obtener los elementos de men? que deben mostrarse solo para ciertos roles
        var ejer = document.getElementById("newejercicios");
        var datos = document.getElementById("datos");
//        var proveedoresLink = document.getElementById("proveedores-link");
//        
//        var historialLink = document.getElementById("historial-link");
//        var carritoLink = document.getElementById("carrito-link");
        datos.style.display = "block";

        // Comprobar si el usuario est? autenticado
        if (idRol === 1) {
            // Si el idRol es igual a 1 (el rol que tiene acceso a todo), mostrar elementos de men? espec?ficos
            newejercicios.style.display = "block";
//            categoriasLink.style.display = "block";
//            proveedoresLink.style.display = "block";
//            historialLink.style.display = "none";
//            carritoLink.style.display = "none";
        } else {
            // Si el idRol no es igual a 1, estos elementos ya est?n ocultos por defecto, no es necesario hacer nada aqu?
        }
        

    </script>
</body>
</html>
