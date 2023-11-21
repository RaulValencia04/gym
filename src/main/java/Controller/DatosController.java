package Controller;

import Conexion.Conexion;
import Models.DatosCuerpo;
import ModelsDAO.DatosCuerpoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DatosController", urlPatterns = {"/DatosController"})
public class DatosController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DatosController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DatosController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./Views/DatosCuerpo/DatosCuerpo.jsp").forward(request, response);
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Obtener los datos del formulario
        String sexo = request.getParameter("sexo");
        int edad = Integer.parseInt(request.getParameter("edad"));
        double peso = Double.parseDouble(request.getParameter("peso"));
        double altura = Double.parseDouble(request.getParameter("altura"));
        String fechaStr = request.getParameter("fecha"); // Obtener la fecha como String

        // Convertir la fecha de String a java.sql.Date
        java.sql.Date fecha = convertirFecha(fechaStr);

        // Check if fecha is null, set a default date or handle accordingly
        if (fecha == null) {
            // Handle the case where fecha is null (set a default date or show an error)
            // For example, you could set it to the current date:
            fecha = new java.sql.Date(System.currentTimeMillis());
        }

        double imc = calcularIMC(peso, altura);

        // Obtener el ID de usuario desde la sesión
        HttpSession session = request.getSession();
        String correo = (String) session.getAttribute("correo");

        // Obtener el ID de usuario desde la base de datos usando el correo electrónico
        int idUsuario = obtenerIdUsuarioPorCorreo(correo);

        // Crear el objeto DatosCuerpo
        DatosCuerpo datosCuerpo = new DatosCuerpo(sexo, edad, peso, altura, fecha, imc, idUsuario);

        // Guardar los datos en la base de datos
        Connection con = (Connection) getServletContext().getAttribute("conexionDB");
        DatosCuerpoDAO datosCuerpoDAO = new DatosCuerpoDAO();
        datosCuerpoDAO.insertarDatosCuerpo(datosCuerpo);

        // Redirigir a la vista DatosCuerpo.jsp
        response.sendRedirect("./Views/DatosCuerpo/DatosCuerpo.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        // Manejar errores, redirigir a una página de error, etc.
    }
}


 private java.sql.Date convertirFecha(String fechaStr) {
    try {
        if (fechaStr != null && !fechaStr.isEmpty()) {
            // Formato esperado: "MM/dd/yyyy"
            java.util.Date fechaUtil = new SimpleDateFormat("MM/dd/yyyy").parse(fechaStr);
            return new java.sql.Date(fechaUtil.getTime());
        } else {
            // Manejar el caso donde fechaStr es nulo o vacío
            return null;
        }
    } catch (java.text.ParseException e) {
        e.printStackTrace();
        return null; // Manejar el error apropiadamente
    }
}


    private double calcularIMC(double peso, double altura) {
        // Ajusta esto según tu lógica para calcular el IMC
        return peso / (altura * altura);
    }

    private int obtenerIdUsuarioPorCorreo(String correo) throws SQLException {
        int idUsuario = -1;
        Connection con = null;
        PreparedStatement statement = null;
        try {
            // Obtén una instancia de la clase Conexion
            Conexion conexionDB = new Conexion();

            // Establece la conexión a la base de datos
            con = conexionDB.obtenerConexion();

            // Define la consulta SQL para obtener el ID de usuario por correo
            String consultaSQL = "SELECT id_usuario FROM usuarios WHERE correo = ?";
            statement = con.prepareStatement(consultaSQL);
            statement.setString(1, correo);

            // Ejecuta la consulta
            try (ResultSet resultSet = statement.executeQuery()) {
                // Verifica si se encontró un resultado
                if (resultSet.next()) {
                    idUsuario = resultSet.getInt("id_usuario");
                }
            }
        } finally {
            // Cierra recursos
            try {
                if (statement != null) {
                    statement.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return idUsuario;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
