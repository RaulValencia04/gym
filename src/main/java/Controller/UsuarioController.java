package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Conexion.Conexion;
import Models.Usuario;
import ModelsDAO.UsuarioDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {
    
    
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String archivoJSP = "./Views/Usuario/CreateUsuario.jsp"; 
    UsuarioDAO userteModel = new UsuarioDAO(); 

    List<Usuario> usuario = userteModel.getUsuarios(); 
    request.setAttribute("Usuario",usuario );

    userteModel = null; 

    request.getRequestDispatcher(archivoJSP).forward(request, response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action != null) {
            if (action.equals("crear")) {
                // Crear un nuevo usuario (operación Crear)
                String nombre = request.getParameter("nombre_usuario");
                 int roll = 1;
                String apellido = request.getParameter("apellido_usuario");
                String correo = request.getParameter("correo");
                String telefono = request.getParameter("telefono");
                String direccion = request.getParameter("direccion");
                String contrasena = request.getParameter("contrasena");
                
                Usuario nuevoUsuario = new Usuario(roll,nombre,apellido, correo, telefono, direccion, contrasena);
                UsuarioDAO usuarioDAO;
                usuarioDAO = new UsuarioDAO();
                usuarioDAO.agregarUsuario(nuevoUsuario);
                response.sendRedirect(request.getContextPath() + "/LoginController");
            }
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

        return idUsuario;
    }
}

