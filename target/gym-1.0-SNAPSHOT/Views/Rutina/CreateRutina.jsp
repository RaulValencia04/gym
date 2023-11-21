<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rutina</title>
        <!-- Agrega los enlaces a los archivos de Bootstrap aquí -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css"
              integrity="sha512-Z/def5z5u2aR89OuzYcxmDJ0Bnd5V1cKqBEbvLOiUNWdg9PQeXVvXLI90SE4QOHGlfLqUnDNVAYyZi8UwUTmWQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
    </head>
    <body>

        <div class="container mt-5">
            <div class="row">
                <%-- Itera sobre los días de la semana --%>
                <%
                    String[] diasSemana = {"Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"};
                    for (String dia : diasSemana) {
                %>
                <div class="col-md-3 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%= dia%></h5>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal<%= dia%>">
                                Agregar Ejercicio
                            </button>
<!--                            <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="Descanso" onclick="desactivarCard(this)">
                                <i class="bi bi-pause-fill">ddd</i>
                            </button>-->
                        </div>
                    </div>
                </div>

                <!-- Modal para agregar ejercicios -->
                <div class="modal fade" id="modal<%= dia%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Agregar Ejercicio para <%= dia%></h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Aquí puedes agregar los campos para el ejercicio -->
                                <form method="post" action="EjercicioController">
                                    <!-- Campos del formulario para agregar ejercicios -->
                                    <!-- ... -->

                                    <button type="submit" class="btn btn-primary">Agregar Ejercicio</button>
                                </form>
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

        <!-- Scripts de Bootstrap (asegúrate de incluir jQuery y Popper.js si es necesario) -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.min.js"
                integrity="sha512-dL/S6ZrT5qesO4NTfsfOoXD1GYSLCX5TAgZaYIYb4tM0jJ0kudHTsXgsfWRiQQbmn9yrF+g4+KQUNc3VC9g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>
                                function desactivarCard(button) {
                                // Encuentra la card padre y desactiva su contenido
                                var cardBody = button.closest('.card-body');
                                cardBody.innerHTML = '<h1>nada<h1/><p>Descanso</p>';
                                // Puedes agregar lógica adicional para manejar el descanso
                                }
                                function activarCard(button) {
                                // Encuentra la card padre y desactiva su contenido
                                var cardBody = button.closest('.card-body');
                                cardBody.innerHTML = '  
                                
                                <div class="card-body">
                                        <h5 class="card-title"></h5>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal">
                                            Agregar Ejercicio
                                            </button>
                                                        <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="Descanso" onclick="desactivarCard(this)">
                                            <i class="bi bi-pause-fill">ddd</i>
                                            </button>
                                        </div>';
                                        // Puedes agregar lógica adicional para manejar el descanso
                                }
        </script>
    </body>
</html>
