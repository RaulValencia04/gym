/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import ModelsDAO.DetalleRutinaDAO;
import ModelsDAO.RutinaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author raulvalencia
 */
@WebServlet(name = "EditarRutinaController", urlPatterns = {"/EditarRutinaController"})
public class EditarRutinaController extends HttpServlet {

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
            out.println("<title>Servlet EditarRutinaController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditarRutinaController at " + request.getContextPath() + "</h1>");
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
        int idRutina = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        int repeticiones = Integer.parseInt(request.getParameter("repeticiones"));

        // Establecer los atributos de solicitud
        request.setAttribute("idRutina", idRutina);
        request.setAttribute("nombre", nombre);
        request.setAttribute("repeticiones", repeticiones);
        
       request.getRequestDispatcher("/Views/Rutina/EditarRutina.jsp").forward(request, response);
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

            int idRutina = Integer.parseInt(request.getParameter("idRutina"));
            int repeticionesRutina = Integer.parseInt(request.getParameter("repeticionesRutina"));
            String nombreRutina = request.getParameter("nombreRutina");

            DetalleRutinaDAO detalleDAO = new DetalleRutinaDAO();
            RutinaDAO rutinaDAO = new RutinaDAO();
            detalleDAO.actualizarDetalleRepe(idRutina,repeticionesRutina);
            rutinaDAO.actualizarRutinaNombre(idRutina, nombreRutina);

            // Redirigir a alguna página de éxito
            response.sendRedirect("RutinaController");
        } catch (SQLException ex) {
            // Manejar errores
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        }
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
