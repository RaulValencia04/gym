<%-- 
    Document   : EditarRutina
    Created on : 22 nov. 2023, 18:57:05
    Author     : raulvalencia
--%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Editar Rutina</title>
        <!-- Agrega los enlaces a los archivos de Bootstrap aquí -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
              crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-5">
            <h1>Editar Rutina</h1>
            <form action="EditarRutinaController" method="post">
                <!-- Aquí muestra los detalles de la rutina y permite la edición -->
                <div class="mb-3">
                    <label for="nombreEdit" class="col-form-label">Nombre:</label>
                    <input type="text" class="form-control" id="nombreEdit" name="nombreRutina" value="${nombre}">
                </div>
                <div class="mb-3">
                    <label for="repeticionesEdit" class="col-form-label">Repeticiones:</label>
                    <input type="number" min="1"class="form-control" id="repeticionesEdit" name="repeticionesRutina" value="${repeticiones}">
                </div>
                <input type="hidden" name="idRutina" value="${idRutina}">
                  
                    <button type="submit" class="btn btn-primary btn-sm"> 
                        Editar
                    </button>
               

            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI/tT1h1eeN/U9gIxpCUFMw+uVoF6A5eTqrs9iE=" crossorigin="anonymous"></script>
    </body>
</html>
