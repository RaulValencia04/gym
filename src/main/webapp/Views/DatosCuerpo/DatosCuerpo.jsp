<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rutina</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <c:forEach var="dia" items="${diasSemana}">
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${dia}" /></h5>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal" data-bs-whatever="@mdo"
                                onclick="abrirModal('${dia}')">Añadir ejercicio
                        </button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Modal para agregar ejercicios -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Ejercicios</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">Día:</label>
                            <input type="text" class="form-control" id="recipient-name" readonly>
                        </div>
                        <!-- Agrega tus campos de ejercicio aquí -->
                        <div class="mb-3">
                            <label for="ejercicio" class="col-form-label">Ejercicio:</label>
                            <input type="text" class="form-control" id="ejercicio">
                        </div>
                        <div class="mb-3">
                            <label for="repeticiones" class="col-form-label">Cantidad de repeticiones:</label>
                            <input type="number" class="form-control" id="repeticiones">
                        </div>
                        <button type="button" class="btn btn-primary" onclick="guardarEjercicio()">Guardar</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI/tT1h1eeN/U9gIxpCUFMw+uVoF6A5eTqrs9iE=" crossorigin="anonymous"></script>

<script>
    function abrirModal(dia) {
        // Actualiza el campo de entrada con el día seleccionado
        var modal = document.getElementById('exampleModal');
        var inputDia = modal.querySelector('#recipient-name');
        inputDia.value = dia;

        // Abre el modal
        var myModal = new bootstrap.Modal(modal);
        myModal.show();
    }

    function guardarEjercicio() {
        // Agrega tu lógica para guardar el ejercicio aquí
        alert('Ejercicio guardado');
        // Cierra el modal después de guardar
        $('#exampleModal').modal('hide');
    }
</script>

</body>
</html>
