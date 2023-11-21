package ModelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Conexion.Conexion;
import Models.Categoria;

public class CategoriaDAO {

   public static boolean insertarCategoria(Categoria categoria) {
        Connection con = null;
        PreparedStatement statement = null;
        boolean exito = true;

          System.out.println("modelooooooooooo siii lleguaaaa");
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

    
    
}

