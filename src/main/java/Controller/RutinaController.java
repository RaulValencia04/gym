/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Conexion.Conexion;
import Models.Categoria;
import Models.DetalleRutina;
import Models.Ejercicio;
import Models.Rutina;
import ModelsDAO.CategoriaDAO;
import ModelsDAO.DetalleRutinaDAO;
import ModelsDAO.EjercicioDAO;
import ModelsDAO.RutinaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author raulvalencia
 */
@WebServlet(name = "RutinaController", urlPatterns = {"/RutinaController"})
public class RutinaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RutinaController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RutinaController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          EjercicioDAO ejercicioDAO = new EjercicioDAO();
        List<Ejercicio> ejercicios = null;
        
        
        
        
        
        try {
            CategoriaDAO cate = new CategoriaDAO();
              List<Categoria> categoria = null;
//            categoria = CategoriaDAO.obtenerTodasCategorias();
            
            ejercicios = ejercicioDAO.obtenerTodosLosEjercicios();
            System.out.println("Número de cates: " + categoria);//si me imprime la cantidad de ejercicios

        } catch (SQLException ex) {
            Logger.getLogger(DetalleEjercicioController.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Colocar la lista de ejercicios en el alcance de la solicitud
        request.setAttribute("listaEjercicios", ejercicios);


        // Redirigir a la vista JSP

        
        
        request.getRequestDispatcher("./Views/Rutina/CreateRutina.jsp").forward(request, response);
        
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Recopilar datos del formulario
        String nombreRutina = request.getParameter("rutina");
        String dia = request.getParameter("Dia");
        String[] ejercicios = request.getParameterValues("ejercicios");
        String[] repeticiones = request.getParameterValues("repeticiones");
        
        
        HttpSession session = request.getSession();
        String correo = (String) session.getAttribute("correo");

        // Obtener el ID de usuario desde la base de datos usando el correo electrónico
        int idUsuario = obtenerIdUsuarioPorCorreo(correo);

        // Crear objeto Rutina
        Rutina rutina = new Rutina(nombreRutina, dia, idUsuario); // Asegúrate de tener el idUsuario disponible

        // Guardar la rutina en la base de datos
        RutinaDAO rutinaDAO = new RutinaDAO();
        rutinaDAO.insertarRutina(rutina);

        // Obtener el ID de la rutina recién insertada
        int idRutina = rutinaDAO.obtenerIdRutina(); // Puedes agregar este método a RutinaDAO

        // Guardar detalles de la rutina
        DetalleRutinaDAO detalleRutinaDAO = new DetalleRutinaDAO();
        for (int i = 0; i < ejercicios.length; i++) {
            int idEjercicio = Integer.parseInt(ejercicios[i]);
            int cantidadReps = Integer.parseInt(repeticiones[i]);

            DetalleRutina detalleRutina = new DetalleRutina(idEjercicio, idRutina, cantidadReps);
            detalleRutinaDAO.insertarDetalleRutina(detalleRutina);
        }

        // Redirigir a alguna página de éxito
        response.sendRedirect("/RutinaController");
    } catch (SQLException ex) {
        // Manejar errores
        ex.printStackTrace();
        response.sendRedirect("error.jsp");
    }
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

        return idUsuario*1;
    }



    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
