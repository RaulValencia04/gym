<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Page</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-rbs5IB3ZHD3oiI1SINDbBjVw4WofQ1yzS1z9tpwYlRQikqFFsfZt3yQxhqF5SquZ" crossorigin="anonymous">
</head>
<body>

    <div class="container">
        <h1>Hello World!</h1>

        <%!
            // Método para verificar la sesión
            private boolean isSessionActive(HttpSession session) {
                return session != null && session.getAttribute("correo") != null;
            }
        %>

        <%
            // Verificar si hay una sesión activa llamando al método
            if (isSessionActive(request.getSession(false))) {
                // Si hay una sesión activa, muestra el contenido que deseas
                String correo = (String) session.getAttribute("id_usuario");
        %>
            <h2 class="mt-3">Bienvenido, <%= correo %>!</h2>
        <%
            }
        %>
    </div>

    <!-- Bootstrap JS and Popper.js (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-oWqNUYzfSx2lJC5qKGpvU9nTlYS9+1GGPnbDJoNlUAqOId9+hgjlPwNaWqPExl5+" crossorigin="anonymous"></script>
</body>
</html>
