/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Conexion.Conexion;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author raulvalencia
 */
@WebServlet(name = "LoadReportController", urlPatterns = {"/LoadReportController"})
public class LoadReportController extends HttpServlet {

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
            out.println("<title>Servlet LoadReportController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadReportController at " + request.getContextPath() + "</h1>");
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
        try {

            ClassLoader classLoader = LoadReportController.class.getClassLoader();

// Convierte el nombre del paquete en una ruta
            String rutaRelativa = "com/example/";

// Obtén la URL del recurso (debe estar en el directorio WEB-INF/classes)
            URL url = classLoader.getResource(rutaRelativa);

// La URL puede ser nula si no se encuentra el recurso
            if (url != null) {
                // Obtén la ruta del archivo desde la URL
                String rutaAbsoluta = url.getPath();

                // Imprime la ruta relativa
                System.out.println("Ruta Relativa: " + rutaRelativa);

                // Imprime la ruta absoluta
                System.out.println("Ruta Absoluta: " + rutaAbsoluta);
            } else {
                System.out.println("El recurso no se encontró.");
            }

            Connection con = null;
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            HttpSession session = request.getSession();
            String correo = (String) session.getAttribute("correo");
            int idUsuario = obtenerIdUsuarioPorCorreo(correo);

            // Definir el mapa de parámetros
            Map<String, Object> parametros = new HashMap<>();
            parametros.put("usuario", idUsuario); // Valor del parámetro

            // Ruta del archivo JasperReport (.jasper)
//        String rutaReporte = "/Users/raulvalencia/NetBeansProjects/gym/src/main/webapp/Reportes/report1.jasper";
            String rutaReporte = "/Users/raulvalencia/NetBeansProjects/gym/src/main/webapp//report1.jasper";

            // Llenar el informe con datos y parámetros
            JasperPrint jasperPrint = JasperFillManager.fillReport(rutaReporte, parametros, con);

            // Exportar el informe a formato PDF
            byte[] pdfBytes = JasperExportManager.exportReportToPdf(jasperPrint);

            // Establecer la respuesta HTTP
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=informe.pdf");

            // Enviar el archivo PDF al cliente
            try ( OutputStream outStream = response.getOutputStream()) {
                outStream.write(pdfBytes);
                outStream.flush();
            }

            // Cerrar la conexión a la base de datos
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            processRequest(request, response);
        } catch (SQLException | JRException ex) {
            Logger.getLogger(LoadReportController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
            try ( ResultSet resultSet = statement.executeQuery()) {
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

        return idUsuario * 1;
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
