<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

</head>
<body>


    <h2>Crear Usuario</h2>
<form action="UsuarioController" method="post">
    <input type="hidden" name="action" value="crear">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" required><br>
    <label for="apellido">Apellido:</label>
    <input type="text" name="apellido" required><br>
    <label for="correo">Correo:</label>
    <input type="email" name="correo" required><br>
    <label for="telefono">Teléfono:</label>
    <input type="text" name="telefono" required><br>
    <label for="direccion">Dirección:</label>
    <input type="text" name="direccion" required><br>
    <label for="password">Contraseña:</label> <!-- Nombre corregido -->
    <input type="password" name="password" required><br>
    <input type="submit" value="Crear Usuario">
</form>

</body>
</html>
