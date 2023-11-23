package ModelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Conexion.Conexion;
import Models.Ejercicio;
import java.util.HashSet;

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

    public static List<Ejercicio> obtenerEjerciciosPorCategoria(int idCategoriaSeleccionada) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        List<Ejercicio> ejercicios = new ArrayList<>();

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para obtener todos los ejercicios
            String consultaSQL = "SELECT * FROM ejercicios where id_categoria = ?";
            statement = con.prepareStatement(consultaSQL);
            statement.setInt(1, idCategoriaSeleccionada);
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

    public static List<Ejercicio> consultaGeneralEjercicio() {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Ejercicio> ejercicios = new ArrayList<>();

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para consultar todas las categorías
            String consultaSQL = "SELECT * FROM ejercicios";

            // Crear un objeto PreparedStatement
            statement = con.prepareStatement(consultaSQL);

            // Ejecutar la consulta
            resultSet = statement.executeQuery();

            // Iterar sobre los resultados de la consulta
            while (resultSet.next()) {

                // Crear una nueva categoría a partir de los resultados de la consulta
                Ejercicio ejercicio = new Ejercicio();
                ejercicio.setIdEjercicio(resultSet.getInt("id_ejercicio"));
                ejercicio.setNombre(resultSet.getString("nombre"));
                ejercicio.setImagenUrl(resultSet.getString("imagen_url"));
                ejercicio.setDescripcion(resultSet.getString("descripcion"));
                ejercicio.setIdCategoria(resultSet.getInt("id_categoria"));

                // Añadir el ejercicio a la lista
                ejercicios.add(ejercicio);
            }
        } catch (SQLException e) {

            e.printStackTrace();

        }
        // Devolver la lista de ejercicios
        return ejercicios;
    }

    public static Ejercicio consultaPorId(int idEjercicio) {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Ejercicio ejercicio = null;
        System.out.println("entro al metodo consultar");

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para consultar una categoría por su ID
            String consultaSQL = "SELECT * FROM ejercicios WHERE id_ejercicio = ?";

            // Crear un objeto PreparedStatement
            statement = con.prepareStatement(consultaSQL);

            // Establecer el parámetro ID en la consulta
            statement.setInt(1, idEjercicio);

            // Ejecutar la consulta
            resultSet = statement.executeQuery();

            // Verificar si se encontró la categoría
            if (resultSet.next()) {
                // Crear un objeto de categoría a partir de los resultados de la consulta
                ejercicio = new Ejercicio();
                ejercicio.setIdEjercicio(resultSet.getInt("id_ejercicio"));
                ejercicio.setNombre(resultSet.getString("nombre"));
                ejercicio.setImagenUrl(resultSet.getString("imagen_url"));
                ejercicio.setDescripcion(resultSet.getString("descripcion"));
                ejercicio.setIdCategoria(resultSet.getInt("id_categoria"));
            }
            System.out.println(ejercicio.getDescripcion()
            );
        } catch (SQLException e) {
            System.out.println("paso algo");
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
        return ejercicio;
    }

    public static boolean eliminarEjercicio(int idEjercicio) {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para eliminar una categoría por su ID
            String consultaSQL = "DELETE FROM ejercicios WHERE id_ejercicio = ?";

            // Imprimir información de depuración
            System.out.println("ID de la categoría a eliminar: " + idEjercicio);

            // Crear un objeto PreparedStatement
            statement = con.prepareStatement(consultaSQL);

            // Establecer el parámetro ID en la consulta
            statement.setInt(1, idEjercicio);

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

    public static boolean actualizarEjercicio(Ejercicio ejercicio) {
        Connection con = null;
        PreparedStatement statement = null;

        try {
            Conexion conexionDB = new Conexion();
            con = conexionDB.obtenerConexion();

            // Consulta SQL para actualizar un ejercicio por su ID
            String consultaSQL = "UPDATE ejercicios SET nombre = ?, imagen_url = ?, descripcion = ?, id_categoria = ? WHERE id_ejercicio = ?";

            // Imprimir información de depuración
            System.out.println("ID Ejercicio: " + ejercicio.getIdEjercicio());
            System.out.println("Nuevo nombre: " + ejercicio.getNombre());
            System.out.println("Nueva URL de imagen: " + ejercicio.getImagenUrl());
            System.out.println("Nueva descripción: " + ejercicio.getDescripcion());
            System.out.println("Nuevo ID de categoría: " + ejercicio.getIdCategoria());

            // Crear un objeto PreparedStatement
            statement = con.prepareStatement(consultaSQL);

            // Establecer los parámetros en la consulta
            statement.setString(1, ejercicio.getNombre());
            statement.setString(2, ejercicio.getImagenUrl());
            statement.setString(3, ejercicio.getDescripcion());
            statement.setInt(4, ejercicio.getIdCategoria());
            statement.setInt(5, ejercicio.getIdEjercicio());

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

}
