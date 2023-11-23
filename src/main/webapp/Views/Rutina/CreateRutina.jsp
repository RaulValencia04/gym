<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

        <!-- Agregar los estilos de Bootstrap (asegúrate de que las rutas sean correctas) -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <!-- Agrega las bibliotecas de DataTables y su traducción al español -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/plug-ins/1.11.5/i18n/Spanish.json"></script>

        <!-- Otros encabezados de tu página, como título, estilos, etc. -->

        <!-- DataTables -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.js"></script>
    </head>
    <body  style="background-image: url('img/fondo1.jpg');padding-bottom: 20px" >


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
            .box{
                display: flex
            }
            .center-cards {
                justify-content: center;
            }

        </style>




        <div class="container mt-5 " >
            <h1 class="" style="padding-top: 30px; padding-bottom: 30px; background-color: rgba(0, 0, 0, 0.7); color: #f5f5f5; font-size: 50px; text-align: center;">Hacer mi rutina</h1>
            <div class="row center-cards" >
                <%-- Itera sobre los días de la semana --%>

                <%-- Obtener la fecha actual --%>
                <% Date fechaActual = new Date(); %>

                <%-- Crear una instancia de Calendar y establecer la fecha actual --%>
                <% Calendar calendar = Calendar.getInstance(); %>
                <% calendar.setTime(fechaActual); %>

                <%-- Obtener el día de la semana (en formato numérico) --%>
                <% int diaDeLaSemanaActual = calendar.get(Calendar.DAY_OF_WEEK); %>

                <%-- Convertir el número del día de la semana a un nombre --%>
                <% String nombreDiaActual = obtenerNombreDia(diaDeLaSemanaActual); %>

                <%-- Método para obtener el nombre del día a partir del número del día de la semana --%>
                <%!
                    private String obtenerNombreDia(int diaDeLaSemana) {
                        String[] diasSemana = {"Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"};
                        return diasSemana[diaDeLaSemana - 1];
                    }
                %>

                <%-- Itera sobre los días de la semana --%>
                <% String[] diasSemana = {"Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"}; %>
                <% int posicion = 0; %>
                <% for (String dia : diasSemana) { %>
                <%-- Obtener el día de la semana actual en el bucle --%>
                <% int diaDeLaSemanaBucle = (posicion % 7) + 1; %>
                <% String nombreDiaBucle = obtenerNombreDia(diaDeLaSemanaBucle); %>

                <%-- Determinar si el día actual coincide con el día en el bucle --%>
                <% boolean esDiaActual = nombreDiaActual.equals(dia);%>
                <style>
                    .box:hover {
                        /* Add your desired styles for hover state */
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                        transform: scale(1.05);
                    }
                </style>

                <div class="col-md-3 mb-3 box">
                    <div class="card" style="border-radius: 20px; height: 160px">
                        <div class="card-body p-0" style="margin: 0px; height: 25px">
                            <h5 class="card-title" style="display: grid; align-items:center; background-color: <%= esDiaActual ? "green" : "red"%>; border-radius: 20px 20px 0px 0px; height: 35px">
                                <%= dia%>
                                <div name="nombreR" id="nombreR"></div>
                            </h5>
                            <div class="numero mt-2">
                                <%posicion++;%>
                                <%=posicion%>
                            </div>
                            <button type="button" class="btn btn-primary m-2 mb-3 " data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" onclick="abrirModal('<%= dia%>')">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-plus" viewBox="0 0 16 16">
                                <!-- SVG path -->
                                </svg> Añadir Rutina
                            </button>
                            <button type="button" id="btnFiltrar" class="btn btn-success btnFiltrar m-2 mb-3 " data-dia="<%= dia%>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-week-fill" viewBox="0 0 16 16">
                                <!-- SVG path -->
                                </svg> Ver Rutina 
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
                <script>
                    document.addEventListener('click', function (event) {
                        // Verifica si el clic proviene de un botón con la clase 'btnFiltrar'
                        if (event.target.classList.contains('btnFiltrar')) {
                            // Obtener el día del botón en el que se hizo clic
                            var selectedDay = event.target.getAttribute('data-dia');

                            // Ocultar todas las filas de la tabla
                            var tableRows = document.querySelectorAll('tbody tr');
                            tableRows.forEach(function (row) {
                                row.style.display = 'none';
                            });

                            // Mostrar solo las filas correspondientes al día seleccionado
                            var selectedDayRows = document.querySelectorAll('tbody tr td.table-active');
                            selectedDayRows.forEach(function (cell) {
                                if (cell.innerText === selectedDay) {
                                    cell.parentElement.style.display = '';
                                }
                            });
                        }
                    });

                </script>


                <% }%>
            </div>

            <h1 class="" style="padding-top: 30px; padding-bottom: 30px; background-color: rgba(0, 0, 0, 0.8); color: #f5f5f5; font-size: 50px; text-align: center;">Mi rutina</h1>
            <div class="col-md-12 mt-3">
                <div class="card" style="opacity: 0.9;">
                    <div class="card-body table-container" style="opacity: 0.9;">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Dia</th>
                                    <th>Ejercicio</th>
                                    <th>Repeticiones</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="tablaRutinas<%= posicion%>">
                                <c:forEach var="rut" items="${listarutina}">
                                    <tr>
                                        <td contenteditable="true">${rut.nombre}</td>
                                        <td contenteditable="false" class="table-active">${rut.dia}</td>
                                        <td contenteditable="false" class="table-active">${rut.nombreEjercicio}</td>
                                        <td contenteditable="true" class="table-active">${rut.repeticiones}</td>
                                        <td>
                                            <a href="EditarRutinaController?id=${rut.idRutina}&nombre=${rut.nombre}&repeticiones=${rut.repeticiones}" class="btn btn-primary btn-sm">
                                                Editar
                                            </a>
                                            <!-- Botón para eliminar (usando un formulario para enviar una solicitud POST) -->
                                            <form action="EliminarRutinaServlet" method="post" style="display:inline;">
                                                <input type="hidden" name="idRutina" value="${rut.idRutina}">
                                                <button type="submit" class="btn btn-danger btn-sm"
                                                        onclick="return confirm('¿Estás seguro de que deseas eliminar esta rutina?')">Eliminar
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>



            <!-- Botón para guardar la rutina -->
            <div class="row mt-3">
                <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-success btn-lg">Guardar Rutina en Reporte</button>
                </div>
            </div>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI/tT1h1eeN/U9gIxpCUFMw+uVoF6A5eTqrs9iE=" crossorigin="anonymous"></script>
        <script>
                                                            $(document).ready(function () {
                                                                // Inicializa la tabla como un DataTable
                                                                $('.table').DataTable();
                                                            });
        </script>
    </script>


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

    <script>
        // Función para verificar si un elemento contiene un texto
        jQuery.expr[':'].contains = function (a, i, m) {
            return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
        };
    </script>

</body>
</html>


<!--codigo funciona---<chido mas chido todavia-->
