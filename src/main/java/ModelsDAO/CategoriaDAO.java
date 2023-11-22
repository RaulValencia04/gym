package ModelsDAO;

import java.sql.Connection;
import Conexion.Conexion;
import Models.Categoria;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class CategoriaDAO {
    
    private Conexion CN;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;

    public CategoriaDAO() throws SQLException {
       
        CN = new Conexion();
         
    }

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
   
public static List<Categoria> consultaGeneral() {
    Connection con = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    List<Categoria> categorias = new ArrayList<>();
   

    try {
        Conexion conexionDB = new Conexion();
        con = conexionDB.obtenerConexion();

        // Consulta SQL para consultar todas las categorías
        String consultaSQL = "SELECT * FROM categoria";

        // Crear un objeto PreparedStatement
        statement = con.prepareStatement(consultaSQL);

        // Ejecutar la consulta
        resultSet = statement.executeQuery();
        


        // Iterar sobre los resultados de la consulta
        while (resultSet.next()) {
            
            // Crear una nueva categoría a partir de los resultados de la consulta
            Categoria categoria = new Categoria();
            categoria.setIdCategoria(resultSet.getInt("id_categoria"));
            categoria.setDescripcion(resultSet.getString("descripcion"));
            categoria.setImgUrl(resultSet.getString("img_url"));

            // Añadir la categoría a la lista
            categorias.add(categoria);
        }
    } catch (SQLException e) {
        
        e.printStackTrace();
        
    } 
    // Devolver la lista de categorías
    return categorias;
}



    
    
}

