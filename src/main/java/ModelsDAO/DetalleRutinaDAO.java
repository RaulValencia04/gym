package ModelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Conexion.Conexion;
import Models.DetalleRutina;

public class DetalleRutinaDAO {

    public void insertarDetalleRutina(DetalleRutina detalleRutina) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para insertar un nuevo detalle de rutina
            String consultaSQL = "INSERT INTO DetalleRutina (id_ejercicio, id_rutina, cantidad_reps) VALUES (?, ?, ?)";
            statement = con.prepareStatement(consultaSQL);

            // Establecer los parámetros de la consulta con los valores del detalle de rutina
            statement.setInt(1, detalleRutina.getIdEjercicio());
            statement.setInt(2, detalleRutina.getIdRutina());
            statement.setInt(3, detalleRutina.getCantidadReps());

            // Ejecutar la consulta
            statement.executeUpdate();
        } finally {
            // Cerrar recursos
            cerrarRecursos(con, statement, null);
        }
    }

    public List<DetalleRutina> obtenerTodosLosDetallesRutina() throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        List<DetalleRutina> detallesRutina = new ArrayList<>();

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para obtener todos los detalles de la rutina
            String consultaSQL = "SELECT * FROM DetalleRutina";
            statement = con.prepareStatement(consultaSQL);
            resultSet = statement.executeQuery();

            // Procesar los resultados y crear objetos DetalleRutina
            while (resultSet.next()) {
                int idDetalleRutina = resultSet.getInt("id_detalle_rutina");
                int idEjercicio = resultSet.getInt("id_ejercicio");
                int idRutina = resultSet.getInt("id_rutina");
                int cantidadReps = resultSet.getInt("cantidad_reps");

                DetalleRutina detalleRutina = new DetalleRutina(idDetalleRutina, idEjercicio, idRutina, cantidadReps);
                detallesRutina.add(detalleRutina);
            }
        } finally {
            // Cerrar recursos
            cerrarRecursos(con, statement, resultSet);
        }

        return detallesRutina;
    }
        public void eliminarRutina(int idRutina) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para eliminar una rutina por ID
            String consultaSQL = "DELETE FROM DetalleRutina WHERE id_rutina = ?";
            statement = con.prepareStatement(consultaSQL);
            statement.setInt(1, idRutina);

            // Ejecutar la consulta
            statement.executeUpdate();
        } finally {
            // Cerrar recursos
            cerrarRecursos(con, statement, null);
        }
    }

    // Otros métodos existentes...

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
