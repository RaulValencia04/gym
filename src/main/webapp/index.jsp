<%@page import="Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<head>
    <title>Encuesta</title>
    <!-- Incluir Bootstrap CSS y JavaScript -->
<!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Incluir FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' height='1em' viewBox='0 0 640 512'%3E%3Cpath d='M36.8 192H603.2c20.3 0 36.8-16.5 36.8-36.8c0-7.3-2.2-14.4-6.2-20.4L558.2 21.4C549.3 8 534.4 0 518.3 0H121.7c-16 0-31 8-39.9 21.4L6.2 134.7c-4 6.1-6.2 13.2-6.2 20.4C0 175.5 16.5 192 36.8 192zM64 224V384v80c0 26.5 21.5 48 48 48H336c26.5 0 48-21.5 48-48V384 224H320V384H128V224H64zm448 0V480c0 17.7 14.3 32 32 32s32-14.3 32-32V224H512z'/%3E%3C/svg%3E" type="image/svg+xml">
   <!-- SweetAlert2 CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha384-oCE1HRaxdUz+DhqFRRgtcsls4U6TG3MWzUzpgAEaY8eUn57fj5cIK83AgiNajz6b" crossorigin="anonymous">


      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="Estilos/style.min.css" rel="stylesheet">
        <!-- Flaticon Font -->
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
    <!-- Agrega las bibliotecas de DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.11.3/datatables.min.js"></script>
</head>

<body>
 <!-- Carousel Start -->
 <div class="container-fluid p-0">
  <div id="blog-carousel" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
          <div class="carousel-item active">
              <img class="w-100" src="img/carousel-1.jpg" alt="Image">
              <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                  <h3 class="text-primary text-capitalize m-0">Gym & Fitness Center</h3>
                  <h2 class="display-2 m-0 mt-2 mt-md-4 text-white font-weight-bold text-capitalize">El mejor en todo</h2>
                  <a href="/login" class="btn btn-lg btn-outline-light mt-3 mt-md-5 py-md-3 px-md-5">Comienza</a>
              </div>
          </div>
          <div class="carousel-item ">
              <img class="w-100" src="img/carousel-1.jpg" alt="Image">
              <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                  <h3 class="text-primary text-capitalize m-0">Gym & Fitness Center</h3>
                  <h2 class="display-2 m-0 mt-2 mt-md-4 text-white font-weight-bold text-capitalize">El mejor en todo</h2>
                  <a href="/login" class="btn btn-lg btn-outline-light mt-3 mt-md-5 py-md-3 px-md-5">Comienza</a>
              </div>
          </div>
      </div>
      <a class="carousel-control-prev" href="#blog-carousel" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
      </a>
      <a class="carousel-control-next" href="#blog-carousel" data-slide="next">
          <span class="carousel-control-next-icon"></span>
      </a>
  </div>
</div>
<!-- Carousel End -->




<!-- Gym Class Start -->
<div class="container gym-class mb-5">
    <div class="row px-3">
        <div class="col-md-6 p-0">
            <div class="gym-class-box d-flex flex-column align-items-end justify-content-center bg-primary text-right text-white py-5 px-5">
                <i class="flaticon-six-pack" style="font-size: 300px;"></i>

                <h3 class="display-4 mb-3 text-white font-weight-bold">Crea tus Categorias</h3>
                <p>
                    Puedes crear tus propias categorias de ejercicios para tener mejor distribuidos los ejerccios por musculos..
                </p>
                <a href="/gym/RutinaController" class="btn btn-lg btn-outline-light mt-3 mt-md-5 py-md-3 px-md-5">Comienza</a>
            </div>
        </div>
        <div class="col-md-6 p-0">
            <div class="gym-class-box d-flex flex-column align-items-start justify-content-center bg-secondary text-left text-white py-5 px-5">
                <i class="flaticon-bodybuilding icon-lg"></i>
                <h3 class="display-4 mb-3 text-white font-weight-bold">Crea tus Ejercicios</h3>
                <p>
                    Puedes crear tus propios ejercicios y agregarles una imagen para siempre recordar como realizarlos..
                </p>
                <a href="/login" class="btn btn-lg btn-outline-light mt-3 mt-md-5 py-md-3 px-md-5">Comienza</a>
            </div>
        </div>
    </div>
  </div>
  <!-- Gym Class End -->
  


<!-- About Start -->
<div class="container py-5">
  <div class="row align-items-center">
      <div class="col-lg-6">
          <img class="img-fluid mb-4 mb-lg-0" src="img/about.jpg" alt="Image">
      </div>
      <div class="col-lg-6">
          <h2 class="display-4 font-weight-bold mb-4">La mejor Web Para entrenar</h2>
          <p>Esta Web te ayudara a alcanzar la mejor version de ti y lograr resultados unicos</p>
          <div class="row py-2">
              <div class="col-sm-6">
                  <i class="flaticon-barbell display-2 text-primary"></i>
                  <h4 class="font-weight-bold">Buenos Ejercicios</h4>
                  <p>Tenemos los mejores ejercicios</p>
              </div>
              <div class="col-sm-6">
                  <i class="flaticon-medal display-2 text-primary"></i>
                  <h4 class="font-weight-bold">Somos los mejores</h4>
                  <p>La mejor web para agregar tus ejercicios</p>
              </div>
          </div>
          <a href="/login" class="btn btn-lg btn-outline-light mt-3 mt-md-5 py-md-3 px-md-5">Comienza</a>
      </div>
  </div>
</div>
<!-- About End -->


<!-- Features Start -->
<div class="container-fluid my-5">
  <div class="row">
      <div class="col-lg-4 p-0">
          <div class="d-flex align-items-center bg-secondary text-white px-5" style="min-height: 300px;">
              <i class="flaticon-training display-3 text-primary mr-3"></i>
              <div class="">
                  <h2 class="text-white mb-3">Avanza</h2>
                  <p>Avanza con estos ejercicios 
                  </p>
              </div>
          </div>
      </div>
      <div class="col-lg-4 p-0">
          <div class="d-flex align-items-center bg-primary text-white px-5" style="min-height: 300px;">
              <i class="flaticon-weightlifting display-3 text-secondary mr-3"></i>
              <div class="">
                  <h2 class="text-white mb-3">Entrena</h2>
                  <p>No te rindas hasta alcanzar los mejor de ti
                  </p>
              </div>
          </div>
      </div>
      <div class="col-lg-4 p-0">
          <div class="d-flex align-items-center bg-secondary text-white px-5" style="min-height: 300px;">
              <i class="flaticon-treadmill display-3 text-primary mr-3"></i>
              <div class="">
                  <h2 class="text-white mb-3">Salud</h2>
                  <p>No te olvides de tu salud asi que comienza ya
                  </p>
              </div>
          </div>
      </div>
  </div>
</div>
<!-- Features End -->

 <!-- GYM Feature Start -->
 <div class="container feature pt-5">
    <div class="d-flex flex-column text-center mb-5">
        <h4 class="text-primary font-weight-bold">Porque nuestra web?</h4>
        <h4 class="display-4 font-weight-bold">Beneficios de usar nuestra web</h4>
    </div>
    <div class="row">
        <div class="col-md-6 mb-5">
            <div class="row align-items-center">
                <div class="col-sm-5">
                    <img class="img-fluid mb-3 mb-sm-0" src="img/feature-1.jpg" alt="Image">
                    <i class="flaticon-barbell"></i>
                </div>
                <div class="col-sm-7">
                    <h4 class="font-weight-bold">Imagenes Instructivas</h4>
                    <p>puedes agrear tus imagenes para hacer tus ejercicios</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-5">
            <div class="row align-items-center">
                <div class="col-sm-5">
                    <img class="img-fluid mb-3 mb-sm-0" src="img/feature-2.jpg" alt="Image">
                    <i class="flaticon-training"></i>
                </div>
                <div class="col-sm-7">
                    <h4 class="font-weight-bold">Es gratuita</h4>
                    <p>solo registrate y comeinza a crear rutinas</p>
                </div>
            </div>
        </div>
        
      
    </div>
</div>
<!-- GYM Feature End -->


    
    
    
        <%-- Mostrar mensaje de éxito si está presente en la sesión --%>
    <% String successMessage = (String) session.getAttribute("successMessage"); %>
    <% if (successMessage != null) { %>
        <script>
            Swal.fire({
                title: 'Éxito',
                text: '<%= successMessage %>',
                icon: 'success',
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000
            });
        </script>
        <% session.removeAttribute("successMessage"); %>
    <% } %>

    <%-- Mostrar mensaje de error si está presente en la sesión --%>
    <% String errorMessage = (String) session.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        <script>
            Swal.fire({
                title: 'Error',
                text: '<%= errorMessage %>',
                icon: 'error',
                toast: true,
                position: 'center',
                showConfirmButton: false,
                timer: 3000
            });
        </script>
        <% session.removeAttribute("errorMessage"); %>
    <% } %>

    <%!
        // Método para verificar la sesión
        private boolean isSessionActive(HttpSession session) {
            return session != null && session.getAttribute("usuario") != null;
        }
    %>

    <%
        // Verificar si hay una sesión activa llamando al método
        if (isSessionActive(request.getSession(false))) {
            // Si hay una sesión activa, muestra el contenido que deseas
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            int nombreUsuario = usuario.getRoll();
    %>
    
    <%
        }
    %>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.28/sweetalert2.all.js" integrity="sha512-cD1xrn0N1tV0ze8axCp+noWgxMFlWVg22HBXUfowicWhJsnAcSXNKnwI77Bkn3yLyqGvwZ/a8M2PtOjVp5vMaw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js" integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>


    
    
    

    
    
