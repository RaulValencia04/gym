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

    public static Categoria consultaPorId(int idCategoria) {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Categoria categoria = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para consultar una categoría por su ID
            String consultaSQL = "SELECT * FROM categoria WHERE id_categoria = ?";

            // Crear un objeto PreparedStatement
            statement = con.prepareStatement(consultaSQL);

            // Establecer el parámetro ID en la consulta
            statement.setInt(1, idCategoria);

            // Ejecutar la consulta
            resultSet = statement.executeQuery();

            // Verificar si se encontró la categoría
            if (resultSet.next()) {
                // Crear un objeto de categoría a partir de los resultados de la consulta
                categoria = new Categoria();
                categoria.setIdCategoria(resultSet.getInt("id_categoria"));
                categoria.setDescripcion(resultSet.getString("descripcion"));
                categoria.setImgUrl(resultSet.getString("img_url"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos (ResultSet, Statement, Connection) en un bloque finally
            // para garantizar que se cierren correctamente incluso si ocurre una excepción.
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        // Devolver la categoría encontrada (o null si no se encuentra)
        return categoria;
    }

    public static boolean actualizarCategoria(Categoria categoria) {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para actualizar una categoría por su ID
            String consultaSQL = "UPDATE categoria SET descripcion = ?, img_url = ? WHERE id_categoria = ?";

            // Imprimir información de depuración
            System.out.println("ID: " + categoria.getIdCategoria());
            System.out.println("Nueva descripción: " + categoria.getDescripcion());
            System.out.println("Nueva URL de imagen: " + categoria.getImgUrl());

            // Crear un objeto PreparedStatement
            statement = con.prepareStatement(consultaSQL);

            // Establecer los parámetros en la consulta
            statement.setString(1, categoria.getDescripcion());
            statement.setString(2, categoria.getImgUrl());
            statement.setInt(3, categoria.getIdCategoria());

            // Ejecutar la actualización y devolver true si se actualizó al menos un registro
            int filasActualizadas = statement.executeUpdate();

            // Imprimir información de depuración
            System.out.println("Filas actualizadas: " + filasActualizadas);

            return filasActualizadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Devolver false en caso de error
        } finally {
            // Cerrar recursos (Statement, Connection) en un bloque finally
            // para garantizar que se cierren correctamente incluso si ocurre una excepción.
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static boolean eliminarCategoria(int idCategoria) {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para eliminar una categoría por su ID
            String consultaSQL = "DELETE FROM categoria WHERE id_categoria = ?";

            // Imprimir información de depuración
            System.out.println("ID de la categoría a eliminar: " + idCategoria);

            // Crear un objeto PreparedStatement
            statement = con.prepareStatement(consultaSQL);

            // Establecer el parámetro ID en la consulta
            statement.setInt(1, idCategoria);

            // Ejecutar la eliminación y devolver true si se eliminó al menos un registro
            int filasEliminadas = statement.executeUpdate();

            // Imprimir información de depuración
            System.out.println("Filas eliminadas: " + filasEliminadas);

            return filasEliminadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Devolver false en caso de error
        } finally {
            // Cerrar recursos (Statement, Connection) en un bloque finally
            // para garantizar que se cierren correctamente incluso si ocurre una excepción.
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
