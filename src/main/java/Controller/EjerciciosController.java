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
@WebServlet(name = "EjerciciosController", urlPatterns = {"/EliminarEjercicio","/MostrarFormCategoria", "/GuardarCategoria", "/MostrarFormEjercicio", "/GuardarEjercicio", "/VerEjercicio", "/VerCategoria", "/CrudCategorias", "/CrudEjercicios", "/EditarCategoria", "/EliminarCategoria", "/GuardarCategoriaEditada","/EditarEjercicio", "/GuardarEjercicioEditado"})
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

            case "/CrudCategorias":
                CrudCategorias(request, response);
                break;

            case "/CrudEjercicios":
                CrudEjercicios(request, response);
                break;

            case "/EditarCategoria":
                EditarCategoria(request, response);
                break;

            case "/EliminarCategoria":
                EliminarCategoria(request, response);
                break;
            case "/EliminarEjercicio":
                EliminarEjercicio(request, response);
                break;
            case "/EditarEjercicio":
                EditarEjercicio(request, response);
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

            case "/VerEjercicio":
                VerEjercicio(request, response);
                break;

            case "/GuardarCategoriaEditada":
                GuardarCategoriaEditada(request, response);
                break;
            case "/GuardarEjercicioEditado":
               // GuardarEjercicioEditado(request, response);
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

    private void VerEjercicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String categoria = request.getParameter("cats");

        int idCategoria = Integer.parseInt(categoria);

        List<Ejercicio> listaEjercicio = null;
        try {
            listaEjercicio = EjercicioDAO.obtenerEjerciciosPorCategoria(idCategoria);
        } catch (SQLException ex) {
            Logger.getLogger(EjerciciosController.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (listaEjercicio != null) {

            for (Ejercicio ejercicio : listaEjercicio) {
                System.out.println("ID: " + ejercicio.getIdEjercicio() + ", Nombre: " + ejercicio.getNombre() + ", Descripción: " + ejercicio.getDescripcion());
                // Puedes imprimir más atributos según la estructura de tu objeto Ejercicio
            }

            // Pasar los datos del producto a la vista de edición
            request.setAttribute("listaEjercicio", listaEjercicio);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/VerEjercicios.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void CrudCategorias(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        List<Categoria> listaCategorias = CategoriaDAO.consultaGeneral();

        if (listaCategorias != null) {
            // Pasar los datos del producto a la vista de edición
            request.setAttribute("listaCategorias", listaCategorias);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/CrudCategorias.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void EditarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String idCategoriastr = request.getParameter("id");

        int idCategoria = Integer.parseInt(idCategoriastr);

        Categoria listaCategorias = CategoriaDAO.consultaPorId(idCategoria);

        if (listaCategorias != null) {
            // Pasar los datos del producto a la vista de edición
            request.setAttribute("listaCategorias", listaCategorias);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/EditarCategoria.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void CrudEjercicios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        List<Ejercicio> listaEjercicios = EjercicioDAO.consultaGeneralEjercicio();

        if (listaEjercicios != null) {
            // Pasar los datos del producto a la vista de edición
            request.setAttribute("listaEjercicios", listaEjercicios);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/CrudEjercicios.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void GuardarCategoriaEditada(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String descripcion = request.getParameter("nombreCategoria");
        String urlImagen = request.getParameter("urlImagen");
        String categoria = request.getParameter("idCategoria");

        int idCategoria = Integer.parseInt(categoria);

        // Crear un objeto Producto con los datos editados
        Categoria productoEditado = new Categoria(descripcion, urlImagen);
        productoEditado.setIdCategoria(idCategoria);

        // Lógica para guardar los cambios en la base de datos
        boolean exito = CategoriaDAO.actualizarCategoria(productoEditado);

        if (exito) {

            // Redirige a la página de inicio de sesión o a donde desees
            session.setAttribute("successMessage", "Categoria Actualizada Correctamente.");

             List<Categoria> listaCategorias = CategoriaDAO.consultaGeneral();
            // Pasar los datos del producto a la vista de edición
            request.setAttribute("listaCategorias", listaCategorias);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/CrudCategorias.jsp");
            dispatcher.forward(request, response);
       

        } else {
            session.setAttribute("errorMessage", "Error al Actualizar la Categoria");

            List<Categoria> listaCategorias = CategoriaDAO.consultaGeneral();
            // Pasar los datos del producto a la vista de edición
            request.setAttribute("listaCategorias", listaCategorias);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/CrudCategorias.jsp");
            dispatcher.forward(request, response);
        }
    }
    
     private void EliminarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String idCategoriastr = request.getParameter("id");

        int idCategoria = Integer.parseInt(idCategoriastr);


        boolean exito = CategoriaDAO.eliminarCategoria(idCategoria);

        if (exito) {
             // Redirige a la página de inicio de sesión o a donde desees
            session.setAttribute("successMessage", "Categoria Eliminada Correctamente.");

             List<Categoria> listaCategorias = CategoriaDAO.consultaGeneral();
            // Pasar los datos del producto a la vista de edición
            request.setAttribute("listaCategorias", listaCategorias);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Ejercicios/CrudCategorias.jsp");
            dispatcher.forward(request, response);
        }

    }
     
     
      private void EditarEjercicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String idEjerciciotr = request.getParameter("id");

        int idEjercicio = Integer.parseInt(idEjerciciotr);

        Ejercicio listaEjercicios = EjercicioDAO.consultaPorId(idEjercicio);
        
          System.out.println("esteeeee"+listaEjercicios.getDescripcion());
          
           List<Categoria> listaCategorias = CategoriaDAO.consultaGeneral();
            // Pasar los datos del producto a la vista de edición
          
        
        if (listaEjercicios != null) {
            // Pasar los datos del producto a la vista de edición
              request.setAttribute("listaCategorias", listaCategorias);
            request.setAttribute("listaEjercicios", listaEjercicios);
            RequestDispatcher dispatcher = request.getRequestDispatcher("./Ejercicios/EditarEjercicio.jsp");
            dispatcher.forward(request, response);
        }

    }
      
           private void EliminarEjercicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String idEjerciciotr = request.getParameter("id");

        int idEjercicio = Integer.parseInt(idEjerciciotr);


        boolean exito = EjercicioDAO.eliminarEjercicio(idEjercicio);

        if (exito) {
             // Redirige a la página de inicio de sesión o a donde desees
            session.setAttribute("successMessage", "Categoria Eliminada Correctamente.");

             List<Ejercicio> listaEjercicios = EjercicioDAO.consultaGeneralEjercicio();
            // Pasar los datos del producto a la vista de edición
            request.setAttribute("listaEjercicios", listaEjercicios);
            RequestDispatcher dispatcher = request.getRequestDispatcher("./Ejercicios/CrudEjercicios.jsp");
            dispatcher.forward(request, response);
        }

    }
    

}
