<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rutina</title>
    <!-- Agrega los enlaces a los archivos de Bootstrap aquí -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

    <div class="container mt-5">
        <div class="row">
            <%-- Itera sobre los días de la semana --%>
            <%
                String[] diasSemana = {"Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"};
                for (String dia : diasSemana) {
            %>
            <%
                String[] rutina = {"Pecho", "Espalda", "Pierna", "Hombro", "Cardio", "Abdomen", "otro"};
            %>
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= dia%></h5>
                        <select class="form-rutina" id="rutina-select" name="rutina">
                            <option value="" disabled selected>Selecciona una opción</option>
                            <option value="Pecho">Pecho</option>
                            <option value="Espalda">Espalda</option>
                            <option value="Pierna">Pierna</option>
                            <option value="Hombro">Hombro</option>
                            <option value="Cardio">Cardio</option>
                            <option value="Abdomen">Abdomen</option>
                            <option value="otro">otro</option>
                        </select>

                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" onclick="abrirModal('<%= dia%>', document.getElementById('rutina-select').value)">Añadir ejercicio</button>
                    </div>
                </div>
            </div>

            <!-- Modal para agregar ejercicios -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                <div class="mb-3">
                                    <label for="recipient-name2" class="col-form-label rut">Rutina:</label>
                                    <input type="text" class="form-control" id="recipient-name2" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="ejercicio-select" class="col-form-label">Ejercicio:</label>
                                    <select class="form-select" id="ejercicio-select" name="ejercicios">
                                        <c:forEach var="ejercicio" items="${listaEjercicios}">
                                            <option value="${ejercicio.idEjercicio}">${ejercicio.nombre}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="repeticiones" class="col-form-label">Cantidad de repeticiones:</label>
                                    <input type="number" class="form-control" id="repeticiones">
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary">Añadir</button>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>

        <!-- Botón para guardar la rutina -->
        <div class="row mt-3">
            <div class="col-md-12">
                <button type="button" class="btn btn-success">Guardar Rutina</button>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI/tT1h1eeN/U9gIxpCUFMw+uVoF6A5eTqrs9iE=" crossorigin="anonymous"></script>

    <script>
        function abrirModal(dia, rutina) {
            // Actualiza el campo de entrada con el día y la rutina seleccionados
            var modal = document.getElementById('exampleModal');
            var inputDia = modal.querySelector('#recipient-name');
            var inputRutina = modal.querySelector('#recipient-name2');

            inputDia.value = dia;
            inputRutina.value = rutina;

            // Abre el modal
            var myModal = new bootstrap.Modal(modal);
            myModal.show();
        }
    </script>

</body>
</html>
