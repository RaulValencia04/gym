<%-- 
    Document   : CrearEjercicios
    Created on : 11-21-2023, 03:30:37 PM
    Author     : Esau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Formulario de Ejercicio</title>
</head>
<body>

  <div class="container mt-5">
    <h2>Formulario de Ejercicio</h2>
    
    <form action="procesar_ejercicio.php" method="post">
      <div class="form-group">
        <label for="nombreEjercicio">Nombre del Ejercicio:</label>
        <input type="text" class="form-control" id="nombreEjercicio" name="nombreEjercicio" required>
      </div>
      
      <div class="form-group">
        <label for="urlImagen">URL de la Imagen:</label>
        <input type="url" class="form-control" id="urlImagen" name="urlImagen" required>
      </div>

      <div class="form-group">
        <label for="descripcion">Descripción:</label>
        <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
      </div>

      <div class="form-group">
        <label for="categoria">Categoría:</label>
        <select class="form-control" id="categoria" name="categoria" required>
          <!-- Aquí deberías cargar dinámicamente las opciones del ComboBox desde tu base de datos -->
          <option value="1">Categoría 1</option>
          <option value="2">Categoría 2</option>
          <option value="3">Categoría 3</option>
        </select>
      </div>

      <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
  </div>

  <!-- Incluye la biblioteca de Bootstrap JS (opcional) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


