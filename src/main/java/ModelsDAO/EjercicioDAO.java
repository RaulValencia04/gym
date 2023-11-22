package ModelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Conexion.Conexion;
import Models.Ejercicio;

public class EjercicioDAO {


   public static boolean insertarEjercicio(Ejercicio ejercicio) {
        Connection con = null;
        PreparedStatement statement = null;
        boolean exito = true;

          
        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para insertar una nueva categoría
             String consultaSQL = "INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES (?, ?, ?, ?)";
            statement = con.prepareStatement(consultaSQL);

            // Establecer los parámetros de la consulta con los valores de la categoría
            statement.setString(1, ejercicio.getNombre());
            statement.setString(2, ejercicio.getImagenUrl());
            statement.setString(3, ejercicio.getDescripcion());
            statement.setInt(4, ejercicio.getIdCategoria());

            // Ejecutar la consulta
            statement.executeUpdate();

            // Confirmar la transacción si todo ha ido bien
            con.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            exito = false;

            // Revertir la transacción en caso de excepción
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
        }

        // Devolver true si no hubo problemas
        return exito;   
    }


    public List<Ejercicio> obtenerTodosLosEjercicios() throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        List<Ejercicio> ejercicios = new ArrayList<>();

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para obtener todos los ejercicios
            String consultaSQL = "SELECT * FROM ejercicios";
            statement = con.prepareStatement(consultaSQL);
            resultSet = statement.executeQuery();

            // Procesar los resultados y crear objetos Ejercicio
            while (resultSet.next()) {
                int idEjercicio = resultSet.getInt("id_ejercicio");
                String nombre = resultSet.getString("nombre");
                String imagenUrl = resultSet.getString("imagen_url");
                String descripcion = resultSet.getString("descripcion");
                int idCategoria = resultSet.getInt("id_categoria");

                Ejercicio ejercicio = new Ejercicio(nombre, imagenUrl, descripcion, idCategoria);
                ejercicio.setIdEjercicio(idEjercicio);

                ejercicios.add(ejercicio);
            }
        } finally {
            // Cerrar recursos
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

        return ejercicios;
    }


}
