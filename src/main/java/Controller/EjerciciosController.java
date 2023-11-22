
package Controller;

import Models.Categoria;
import Models.Ejercicio;
import Models.Usuario;
import ModelsDAO.CategoriaDAO;
import java.io.Console;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ModelsDAO.EjercicioDAO;


/**
 *
 * @author Esau
 */

@WebServlet(name = "EjerciciosController", urlPatterns = {"/MostrarFormCategoria", "/GuardarCategoria", "/MostrarFormEjercicio", "/GuardarEjercicio", "/VerEjercicio", "/VerCategoria"})
public class EjerciciosController extends HttpServlet {
     private EjercicioDAO ejercicioDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        ejercicioDAO = new EjercicioDAO();
    }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     String action = request.getServletPath();
        HttpSession session = request.getSession();
        switch (action) {
            case "/MostrarFormCategoria":
                MostrarFormCategoria(request, response);
                break;
             case "/MostrarFormEjercicio":
                MostrarFormEjercicio(request, response);
                break;
            case "/VerCategoria":
                VerCategoria(request, response);
                break;
            default:
                // Lógica para otras rutas si es necesario
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/GuardarCategoria":

                GuardarCategoria(request, response);
                break; 
                
                 case "/GuardarEjercicio":

                GuardarEjercicio(request, response);
                break; 
            default:
                // Lógica para otras rutas si es necesario
                break;
        }
    }
    
    private void MostrarFormCategoria(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession(false);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/CrearCategorias.jsp");
            dispatcher.forward(request, response);
 
    }
    
    
     private void MostrarFormEjercicio(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
            List<Categoria> listaCategorias = CategoriaDAO.consultaGeneral();
            


                if (listaCategorias != null) {
                    

                  

                    // Pasar los datos del producto a la vista de edición
                    request.setAttribute("listaCategorias", listaCategorias);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/CrearEjercicios.jsp");
                    dispatcher.forward(request, response);
                }
    }
    
    private void GuardarCategoria(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
                 HttpSession session = request.getSession();
            
             System.out.println("3333333333333 llego aqui");
          


               
            String nombreCategoria = request.getParameter("nombreCategoria");
            String urlImagen = request.getParameter("urlImagen");
            
         
          System.out.println(nombreCategoria);
           System.out.println(urlImagen);

        Categoria nuevaCategoria = new Categoria(nombreCategoria, urlImagen);

        boolean exito = CategoriaDAO.insertarCategoria(nuevaCategoria);

        if (!exito) {
             
            
            // Redirige a la página de inicio de sesión o a donde desees
            session.setAttribute("successMessage", "Encuesta registrada correctamente.");

            response.sendRedirect("index.jsp");
            
        } else {
            session.setAttribute("errorMessage", "Error al subir la encuesta");

            // Manejo de errores (puedes personalizar esto según tus necesidades)
            response.sendRedirect("index.jsp");
        }
    }
    

    private void GuardarEjercicio(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            HttpSession session = request.getSession();
            
               
            String nombreCategoria = request.getParameter("nombreEjercicio");
            String urlImagen = request.getParameter("urlImagen");
            String descripcion = request.getParameter("descripcion");
            String categoria = request.getParameter("categoria");
            
            int idCategoria = Integer.parseInt(categoria);

            
         
            System.out.println(nombreCategoria);
            System.out.println(urlImagen);

            Ejercicio nuevoEjercicio = new Ejercicio(nombreCategoria, urlImagen, descripcion, idCategoria);

             boolean exito = EjercicioDAO.insertarEjercicio(nuevoEjercicio);

        if (!exito) {
             
            
            // Redirige a la página de inicio de sesión o a donde desees
            session.setAttribute("successMessage", "Encuesta registrada correctamente.");

            response.sendRedirect("index.jsp");
            
        } else {
            session.setAttribute("errorMessage", "Error al subir la encuesta");

            // Manejo de errores (puedes personalizar esto según tus necesidades)
            response.sendRedirect("index.jsp");
        }
    }
    
    
    
            
    private void VerCategoria(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
            List<Categoria> listaCategorias = CategoriaDAO.consultaGeneral();

                if (listaCategorias != null) {      
                    // Pasar los datos del producto a la vista de edición
                    request.setAttribute("listaCategorias", listaCategorias);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/verCategorias.jsp");
                    dispatcher.forward(request, response);
                }
                
    }

    
    
}
