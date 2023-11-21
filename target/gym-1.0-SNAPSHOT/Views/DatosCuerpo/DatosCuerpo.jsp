<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../../header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Datos del Cuerpo</title>
    <!-- Agrega enlaces a tus estilos CSS si los tienes -->
    <link rel="stylesheet" type="text/css" href="tu_estilo.css">
    <!-- Agrega enlaces a las bibliotecas de Bootstrap si las estás utilizando -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>Datos del Cuerpo</h1>
        <form action="DatosController" method="post">
            <!-- Campo Sexo -->
            <div class="form-group">
                <label for="sexo">Sexo:</label>
                <select class="form-control" id="sexo" name="sexo" required>
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                </select>
            </div>

            <!-- Campo Edad -->
            <div class="form-group">
                <label for="edad">Edad:</label>
                <input type="number" class="form-control" id="edad" name="edad" required>
            </div>

            <!-- Campo Peso -->
            <div class="form-group">
                <label for="peso">Peso (kg):</label>
                <input type="number" step="0.01" class="form-control" id="peso" name="peso" required>
            </div>

            <!-- Campo Altura -->
            <div class="form-group">
                <label for="altura">Altura (m):</label>
                <input type="number" step="0.01" class="form-control" id="altura" name="altura" required>
            </div>

            <!-- Agrega más campos según sea necesario -->

            <!-- Botón de Enviar -->
            <button type="submit" class="btn btn-primary">Guardar Datos</button>
        </form>
    </div>

    <!-- Agrega enlaces a tus scripts JS si los tienes -->
    <script src="tu_script.js"></script>
    <!-- Agrega enlaces a las bibliotecas de Bootstrap JS si las estás utilizando -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
