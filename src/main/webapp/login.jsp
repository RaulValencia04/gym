<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.28/sweetalert2.min.css"
          integrity="sha512-IScV5kvJo+TIPbxENerxZcEpu9VrLUGh1qYWv6Z9aylhxWE4k4Fch3CHl0IYYmN+jrnWQBPlpoTVoWfSMakoKA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css"
          integrity="sha512-Z/def5z5u2aR89OuzYcxmDJ0Bnd5V1cKqBEbvLOiUNWdg9PQeXVvXLI90SE4QOHGlfLqUnDNVAYyZi8UwUTmWQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="WEB-INF/styles.min.css" rel="stylesheet" type="text/css" />
    <link href="WEB-INF/tailwind.output.css" rel="stylesheet" type="text/css" />
    <link href="WEB-INF/login.css" rel="stylesheet" type="text/css" />
</head>

<body style="background-image: url('img/inicio.jpg'); padding-bottom: 20px">

    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <div style="max-width: 900px;" class="d-flex align-items-center justify-content-center w-100">
                <div class="row justify-content-center w-100">
                    <div class="col-md-10 col-lg-8 col-xxl-6">
                        <div class="card mb-0" style="padding: 19px">
                            <div class="card-body">
                                <h2 class="card-title text-center">Inicio de Sesión <i class="bi bi-door-closed-fill"></i>
                                </h2>
                                <form method="POST" action="LoginController">
                                    <div class="mb-3">
                                        <label for="correo" class="form-label">Correo:</label>
                                        <input type="text" class="form-control" id="correo" name="correo" required>
                                    </div>
                                    <div class="mb-4">
                                        <label for="clave" class="form-label">Contraseña:</label>
                                        <input type="password" class="form-control" id="clave" name="clave" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100 py-2 fs-5 mb-3 rounded-2">
                                        Iniciar sesión <i class="bi bi-box-arrow-in-right"></i>
                                    </button>
                                </form>
                                <div class="text-center">
                                    <a href="UsuarioController">Registrarse</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
