
<%-- 
    Document   : EditarCategoria
    Created on : 11-21-2023, 03:30:37 PM
    Author     : Esau
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Categoria"%> <!-- Reemplaza "tu.paquete" con el paquete real de tu clase Categoria -->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Editar Categoría</title>
</head>
<body>

  <div class="container mt-5">
    <h2>Editar Categoría</h2>
    
    <form action="GuardarCategoriaEditada" method="post">
      <div class="form-group">
        <label for="nombreCategoria">Nombre de la Categoría:</label>
        <input type="text" class="form-control" id="nombreCategoria" name="nombreCategoria" value="${listaCategorias.getDescripcion()}" required>
      </div>
      
      <div class="form-group">
        <label for="urlImagen">URL de la Imagen:</label>
        <input type="url" class="form-control" id="urlImagen" name="urlImagen" value="${listaCategorias.getImgUrl()}" required>
      </div>

      <input type="hidden" name="idCategoria" value="${listaCategorias.getIdCategoria()}">

      <button type="submit" class="btn btn-primary">Guardar cambios</button>
    </form>
  </div>

  <!-- Incluye la biblioteca de Bootstrap JS (opcional) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

