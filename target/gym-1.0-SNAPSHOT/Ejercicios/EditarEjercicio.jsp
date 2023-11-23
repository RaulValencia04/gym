<%-- 
    Document   : EditarEjercicio
    Created on : 22 nov. 2023, 22:40:47
    Author     : chris
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    
    <form action="GuardarEjercicio" method="post">
      <div class="form-group">
        <label for="nombreEjercicio">Nombre del Ejercicio:</label>
        <input type="text" class="form-control" id="nombreEjercicio" name="nombreEjercicio" value="${listaEjercicios.getNombre()}" required>
      </div>
      
      <div class="form-group">
        <label for="urlImagen">URL de la Imagen:</label>
        <input type="url" class="form-control" id="urlImagen" name="urlImagen" value="${listaEjercicios.getImagenUrl()}" required>
      </div>

      <div class="form-group">
        <label for="descripcion">Descripción:</label>
        <textarea class="form-control" id="descripcion" name="descripcion" rows="3" value="${listaEjercicios.getDescripcion()}" required>${listaEjercicios.getDescripcion()}</textarea>
      </div>

      <div class="form-group">
        <label for="categoria">Categoría:</label>
        <select name="categoria" class="form-control form-control-lg text-success">
          <c:forEach var="categoria" items="${listaCategorias}">
            <option value="${categoria.idCategoria}">${categoria.descripcion}</option>
          </c:forEach>
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



