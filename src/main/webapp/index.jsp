<%@page import="Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />


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
          <div class="carousel-item">
              <img class="w-100" src=img/carousel-2.jpg" alt="Image">
              <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                  <h3 class="text-primary text-capitalize m-0">Gym & Fitness Center</h3>
                  <h2 class="display-2 m-0 mt-2 mt-md-4 text-white font-weight-bold text-capitalize">Get Body In Shape</h2>
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



!-- JS -->
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.28/sweetalert2.all.js" integrity="sha512-cD1xrn0N1tV0ze8axCp+noWgxMFlWVg22HBXUfowicWhJsnAcSXNKnwI77Bkn3yLyqGvwZ/a8M2PtOjVp5vMaw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js" integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>


    
    
    

    
    
