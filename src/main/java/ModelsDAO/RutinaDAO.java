package ModelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Conexion.Conexion;
import Models.Rutina;

public class RutinaDAO {

    public void insertarRutina(Rutina rutina) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para insertar una nueva rutina
            String consultaSQL = "INSERT INTO Rutina (nombre, dia, id_detalle_rutina, id_usuario) VALUES (?, ?, ?, ?)";
            statement = con.prepareStatement(consultaSQL);

            // Establecer los parámetros de la consulta con los valores de la rutina
            statement.setString(1, rutina.getNombre());
            statement.setString(2, rutina.getDia());
            statement.setInt(3, rutina.getIdDetalleRutina());
            statement.setInt(4, rutina.getIdUsuario());

            // Ejecutar la consulta
            statement.executeUpdate();
        } finally {
            // Cerrar recursos
            cerrarRecursos(con, statement, null);
        }
    }

    public List<Rutina> obtenerTodasLasRutinas() throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        List<Rutina> rutinas = new ArrayList<>();

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para obtener todas las rutinas
            String consultaSQL = "SELECT * FROM Rutina";
            statement = con.prepareStatement(consultaSQL);
            resultSet = statement.executeQuery();

            // Procesar los resultados y crear objetos Rutina
            while (resultSet.next()) {
                int idRutina = resultSet.getInt("id_rutina");
                String nombre = resultSet.getString("nombre");
                String dia = resultSet.getString("dia");
                int idUsuario = resultSet.getInt("id_usuario");

                Rutina rutina = new Rutina(nombre, dia, idUsuario);
                rutina.setIdRutina(idRutina);

                rutinas.add(rutina);
            }
        } finally {
            // Cerrar recursos
            cerrarRecursos(con, statement, resultSet);
        }

        return rutinas;
    }

    public Rutina obtenerRutinaPorId(int idRutina) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para obtener una rutina por ID
            String consultaSQL = "SELECT * FROM Rutina WHERE id_rutina = ?";
            statement = con.prepareStatement(consultaSQL);
            statement.setInt(1, idRutina);
            resultSet = statement.executeQuery();

            // Procesar los resultados y crear un objeto Rutina
            if (resultSet.next()) {
                String nombre = resultSet.getString("nombre");
                String dia = resultSet.getString("dia");
                int idDetalleRutina = resultSet.getInt("id_detalle_rutina");
                int idUsuario = resultSet.getInt("id_usuario");

                Rutina rutina = new Rutina(nombre, dia, idUsuario);
                rutina.setIdRutina(idRutina);

                return rutina;
            }
        } finally {
            // Cerrar recursos
            cerrarRecursos(con, statement, resultSet);
        }

        return null; // Retornar null si no se encuentra la rutina con el ID especificado
    }

    public void actualizarRutina(Rutina rutina) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para actualizar una rutina
            String consultaSQL = "UPDATE Rutina SET nombre = ?, dia = ?, id_usuario = ? WHERE id_rutina = ?";
            statement = con.prepareStatement(consultaSQL);

            // Establecer los parámetros de la consulta con los nuevos valores de la rutina
            statement.setString(1, rutina.getNombre());
            statement.setString(2, rutina.getDia());
            statement.setInt(3, rutina.getIdUsuario());
            statement.setInt(4, rutina.getIdRutina());

            // Ejecutar la consulta
            statement.executeUpdate();
        } finally {
            // Cerrar recursos
            cerrarRecursos(con, statement, null);
        }
    }

    public void eliminarRutina(int idRutina) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para eliminar una rutina por ID
            String consultaSQL = "DELETE FROM Rutina WHERE id_rutina = ?";
            statement = con.prepareStatement(consultaSQL);
            statement.setInt(1, idRutina);

            // Ejecutar la consulta
            statement.executeUpdate();
        } finally {
            // Cerrar recursos
            cerrarRecursos(con, statement, null);
        }
    }

    // Método para cerrar recursos (Connection, Statement, ResultSet)
    private void cerrarRecursos(Connection con, PreparedStatement statement, ResultSet resultSet) {
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
}
