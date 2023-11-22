<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<jsp:include page="./../../header.jsp" />--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rutina</title>
        <!-- Agrega los enlaces a los archivos de Bootstrap aquí -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
              crossorigin="anonymous">
    </head>
    <body>

        <style>
            .card-title{
                color: white;
                padding-left: 15px;
            }
            .numero{
                display: grid;
                place-items: center;
                font-size: 40px;
                font-family: Times New Roman, serif;

            }


        </style>



        <div class="container mt-5">
            <div class="row">
                <%-- Itera sobre los días de la semana --%>
                <%
                    String[] diasSemana = {"Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"};
                    int posicion = 0;

                    for (String dia : diasSemana) {
                %>
                <div class="col-md-3 mb-3">
                    <div class="card" style="border-radius: 20px; height: 160px">
                        <div class="card-body p-0" style="margin: 0px; height: 25px ">
                            <h5 class="card-title" style=" display: grid;align-items:center; background-color: red; border-radius: 20px 20px 0px 0px; height: 35px">
                                <%= dia%>

                                <div name="nombreR" id="nombreR"></div>
                            </h5>

                            <div class="numero mt-2">
                                <%posicion++;%>
                                <%=posicion%>
                            </div>


                            <button type="button" class="btn btn-primary  m-2 mb-3 " data-bs-toggle="modal"
                                    data-bs-target="#exampleModal" data-bs-whatever="@mdo"
                                    onclick="abrirModal('<%= dia%>')"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-plus" viewBox="0 0 16 16">
                                <path d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7"/>
                                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
                                </svg>
                            </button>

                            <button type="button" class="btn btn-success  m-2 mb-3 " data-bs-toggle="modal"
                                    data-bs-target="#exampleModal" data-bs-whatever="@mdo"
                                    onclick="abrirModal('<%= dia%>')"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-week-fill" viewBox="0 0 16 16">
                                <path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4zM16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2M9.5 7h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5m3 0h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5M2 10.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>

                <%-- Modal para agregar ejercicios --%>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Ejercicios</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form  id="myForm"  action="RutinaController" method="post">
                                    <div class="mb-3">
                                        <label for="recipient-name" class="col-form-label">Día:</label>
                                        <input type="text" class="form-control" name="Dia" id="recipient-name" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="recipient-name" class="col-form-label">Nombre:</label>
                                        <input type="text" class="form-control" name="nombre" id="recipient-name" >
                                    </div>

                                    <div class="mb-3">
                                        <label for="categoria-select" class="col-form-label">Categoría</label>
                                        <select class="form-select" id="categoria-select" name="categoria">
                                            <c:forEach var="categoria" items="${listacategoria}">
                                                <option value="${categoria.idCategoria}"
                                                        ${categoria.idCategoria eq selectedCategoryId ? 'selected' : ''}>
                                                    ${categoria.descripcion}
                                                </option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                    <script>
                                        document.getElementById('categoria-select').addEventListener('change', function () {
                                            // Obtener el valor seleccionado de la categoría
                                            var selectedCategoria = this.value;

                                            // Ocultar todos los elementos de ejercicios
                                            var ejerciciosOptions = document.getElementById('ejercicio-select').getElementsByTagName('option');
                                            for (var i = 0; i < ejerciciosOptions.length; i++) {
                                                ejerciciosOptions[i].style.display = 'none';
                                            }

                                            // Mostrar solo los ejercicios que tienen el mismo valor que la categoría seleccionada
                                            var selectedEjercicios = document.querySelectorAll('#ejercicio-select option[value="' + selectedCategoria + '"]');
                                            for (var j = 0; j < selectedEjercicios.length; j++) {
                                                selectedEjercicios[j].style.display = '';
                                            }
                                        });
                                    </script>


                                    <div class="mb-3" id="ejercicioDropdown">
                                        <label for="ejercicio-select" class="col-form-label">Ejercicio:</label>
                                        <select class="form-select" id="ejercicio-select" name="ejercicios">
                                            <c:forEach var="ejercicio" items="${listaejercicios}">
                                                <option value="${ejercicio.idCategoria}">${ejercicio.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="repeticiones" class="col-form-label">Cantidad de repeticiones:</label>
                                        <input type="number" class="form-control" id="repeticiones" name="repeticiones">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Añadir</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>

            <!-- Botón para guardar la rutina -->
            <div class="row mt-3">
                <div class="col-md-12">
                    <button type="button" class="btn btn-success">Guardar Rutina</button>
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
                                            // Actualiza el campo de entrada con el día y la rutina seleccionados
                                            var modal = document.getElementById('exampleModal');
                                            var inputDia = modal.querySelector('#recipient-name');
                                            var inputRutina = modal.querySelector('#recipient-name2');

                                            inputDia.value = dia;

                                            // Abre el modal
                                            var myModal = new bootstrap.Modal(modal);
                                            myModal.show();
                                        }


        </script>

    </body>
</html>
