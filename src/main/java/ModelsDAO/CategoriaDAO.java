package ModelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Conexion.Conexion;
import Models.Categoria;

public class CategoriaDAO {

    public void insertarCategoria(Categoria categoria) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para insertar una nueva categoría
            String consultaSQL = "INSERT INTO categoria (descripcion, img_url) VALUES (?, ?)";
            statement = con.prepareStatement(consultaSQL);

            // Establecer los parámetros de la consulta con los valores de la categoría
            statement.setString(1, categoria.getDescripcion());
            statement.setString(2, categoria.getImgUrl());

            // Ejecutar la consulta
            statement.executeUpdate();
        } finally {
            // Cerrar recursos
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
    }

}

