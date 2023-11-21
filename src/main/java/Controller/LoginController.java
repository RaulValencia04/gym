/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Conexion.Conexion;
import Models.Usuario;
import ModelsDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

 public LoginController() throws SQLException {
        super();
        Conexion conexion = new Conexion();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Muestra el formulario de inicio de sesión en lugar de un mensaje de bienvenida
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String correo = request.getParameter("correo");
        String claveIngresada = request.getParameter("clave");

        // Mensaje de depuración para verificar que se obtienen los datos del formulario
        System.out.println("Correo ingresado: " + correo);
        System.out.println("Contraseña ingresada: " + claveIngresada);

        // Obtener la contraseña cifrada almacenada en la base de datos para el usuario
        String salt = getSaltFromDatabase(correo); // Obtén el salt desde la base de datos
        String claveAlmacenada = getPasswordFromDatabase(correo); // Obtén la contraseña cifrada desde la base de datos

        // Mensaje de depuración para verificar las contraseñas
        System.out.println("Contraseña almacenada: " + claveAlmacenada);

        // Verificar si las contraseñas coinciden
        if (claveAlmacenada != null && verifyPassword(claveIngresada, claveAlmacenada, salt)) {
            // Las contraseñas coinciden, crear una sesión para el usuario
            HttpSession session = request.getSession();
            session.setAttribute("correo", correo);

            // Obtener todos los datos del usuario y guardarlos en la sesión
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = usuarioDAO.obtenerUsuarioPorCorreo(correo);
            session.setAttribute("usuario", usuario);

            // Realizar cualquier otra lógica que necesites

            // Redirigir al usuario a la página de inicio o a donde desees
            response.sendRedirect("index.jsp");
        } else {
            // Si las contraseñas no coinciden, mostrar un mensaje de error
            request.setAttribute("error", "Credenciales incorrectas");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private String getPasswordFromDatabase(String correo) {
        String claveAlmacenada = null;
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Obtén una instancia de la clase Conexion
            Conexion conexionDB = new Conexion();

            // Establece la conexión a la base de datos
            con = conexionDB.obtenerConexion();

            // Define la consulta SQL para obtener la contraseña por correo
            String consultaSQL = "SELECT PASSWORDS FROM USUARIOS WHERE CORREO = ?";
            statement = con.prepareStatement(consultaSQL);
            statement.setString(1, correo);

            // Ejecuta la consulta
            resultSet = statement.executeQuery();

            // Verifica si se encontró un resultado
            if (resultSet.next()) {
                claveAlmacenada = resultSet.getString("PASSWORDS");
            }
        } catch (SQLException e) {
            // Manejo de errores de la base de datos
            e.printStackTrace();
        } finally {
            // Cierra recursos
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
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

        return claveAlmacenada;
    }

    private String getSaltFromDatabase(String correo) {
        // Realiza una consulta SQL para obtener el salt desde la base de datos
        // Reemplaza esto con tu código específico para acceder a la base de datos
        String salt = null;
        // Tu lógica para obtener el salt desde la base de datos
        return salt;
    }

    private boolean verifyPassword(String passwordIngresada, String passwordAlmacenada, String salt) {
        // Verificar si la contraseña almacenada no es null
        if (passwordAlmacenada == null) {
            return false; // O maneja el caso de contraseña faltante de acuerdo a tus necesidades
        }

        // Aplicar hash a la contraseña ingresada junto con el salt
        String hashedPassword = hashPassword(passwordIngresada, salt);

        // Comparar el hash resultante con la contraseña almacenada
        return hashedPassword.equals(passwordAlmacenada);
    }

    private String hashPassword(String password, String salt) {
        // Utiliza el mismo método de cifrado que tienes en UsuarioDAO
        UsuarioDAO UD = new  UsuarioDAO();
        return UD.encriptarContraseña(password);
    }
}
