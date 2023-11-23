<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../header.jsp" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Crear Usuario</title>
    <!-- Agregar los estilos de Bootstrap (asegúrate de que las rutas sean correctas) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="ruta/a/bootstrap.min.css">
    <link href="Estilos/style.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('img/inicio.jpg');
            padding-bottom: 20px;
            padding-top: 20px;
            padding: 20px;
        }

        .color {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 80px;
        }

        h2 {
            color: #000;
            font-size: 50px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        button {
            background-color: #28a745;
            color: #fff;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        
        <div class="row justify-content-center">
            <div class="col-md-6 color">
                <h2 class="mt-4 text-center">Crear Usuario</h2>
                <form action="UsuarioController" method="post">
                    <input type="hidden" name="action" value="crear">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" class="form-control" id="apellido_usuario" name="apellido_usuario" required>
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="email" class="form-control" id="correo" name="correo" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" required>
                    </div>
                    <div class="form-group">
                        <label for="direccion">Dirección:</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" required>
                    </div>
                    <div class="form-group">
                        <label for="contrasena">Contraseña:</label>
                        <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Crear Usuario</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Agregar los scripts de Bootstrap (asegúrate de que las rutas sean correctas) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>
