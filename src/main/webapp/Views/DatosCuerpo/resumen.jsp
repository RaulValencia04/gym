
<%@page import="Models.DatosCuerpo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<title>Lista de Encuestas</title>

<style>
    /* Agregar sombreado al hover de los cards */
.card:hover {
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2); /* Cambia los valores según tus preferencias */
    transition: box-shadow 0.3s ease-in-out;
}

/* Cambiar el color de fondo del card al hacer hover */
.card:hover {
    background-color: #f8f9fa; /* Cambia el color de fondo según tus preferencias */
    transition: background-color 0.3s ease-in-out;
}

.card-header {
    background: url("https://img.freepik.com/vector-premium/diseno-fondo-holograma-color-pastel-abstracto-horizontal_29865-3302.jpg") center/cover no-repeat;
/*    color: white;
    text-align: center;*/
    padding: 22px;
}
</style>
   <div style="width:80%;">
        <canvas id="myChart"></canvas>
    </div>




<script src="
https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js
"></script>
<script>
    // Configura Chart.js para usar el adaptador de fecha

    var datosJSON = ${datosJSON};


// Extraer las fechas
var fechas = datosJSON.map(function(encuesta) {
  var fecha = encuesta.fecha;
  return fecha; // Formatear la fecha al formato ISO
});

// Extraer los valores de IMC
var imc = datosJSON.map(function(encuesta) {
  return encuesta.imc;
});

 
// Crear el gráfico de barras
var ctxBarras = document.getElementById('myChart').getContext('2d');
var graficoBarras = new Chart(ctxBarras, {
  type: 'bar',
  data: {
    labels: fechas, // Usar las fechas ordenadas
    datasets: [{
      label: 'IMC',
      data: imc, // Usar los valores de IMC
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)'
      ],
    }]
  }
});


    
</script>
