/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Juanjo
 */
public class ConstruyeBD {

    private String url;
    private String usuario;
    private String password;
    private Connection conexion;

    public ConstruyeBD() {
        this.url = "jdbc:mysql://localhost:3306/phpmyadmin";
        this.usuario = "root";
        this.password = "";

    }

    public Connection obtenerConexion() throws SQLException {
            if (conexion == null || conexion.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");

                // Establecer la conexión a la base de datos
                conexion = DriverManager.getConnection(url, usuario, password);
                Statement statement = conexion.createStatement();
                ResultSet resultSet = statement.executeQuery("SHOW DATABASES LIKE 'gym';");
                if (!resultSet.next()) {
                    statement.executeUpdate("CREATE DATABASE IF NOT EXISTS gym;");
                    statement.executeUpdate("USE gym;");

                    resultSet = statement.executeQuery("SHOW TABLES LIKE 'categoria';");

                    if (!resultSet.next()) {
                        statement.executeUpdate("CREATE TABLE categoria ("
                                + "id_categoria INT AUTO_INCREMENT PRIMARY KEY,"
                                + "descripcion VARCHAR(255) NOT NULL,"
                                + "img_url VARCHAR(255) NOT NULL);");
                    }
                    
                       resultSet = statement.executeQuery("SHOW TABLES LIKE 'usuarios';");
                    if (!resultSet.next()) {
                        statement.executeUpdate("CREATE TABLE usuarios ("
                                + "id_usuario INT AUTO_INCREMENT PRIMARY KEY," +
                                "    roll INT not null," +
                                "    nombre_usuario VARCHAR(255) NOT NULL," +
                                "    apellido_usuario VARCHAR(255) NOT NULL," +
                                "    correo VARCHAR(255) NOT NULL," +
                                "    telefono VARCHAR(15) NOT NULL," +
                                "    direccion VARCHAR(255) NOT NULL," +
                                "    passwords VARCHAR(255) NOT NULL);");
                    }
                    resultSet = statement.executeQuery("SHOW TABLES LIKE 'ejercicios';");
                    if (!resultSet.next()) {
                        statement.executeUpdate("CREATE TABLE ejercicios (" +
                                            "    id_ejercicio INT AUTO_INCREMENT PRIMARY KEY," +
                                            "    nombre VARCHAR(255) NOT NULL," +
                                            "    imagen_url VARCHAR(255) NOT NULL," +
                                            "    descripcion VARCHAR(255) NOT NULL," +
                                            "    id_categoria INT NOT NULL," +
                                            "    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)" +
                                            ");");
                    }
                      resultSet = statement.executeQuery("SHOW TABLES LIKE 'Rutina';");
                    if (!resultSet.next()) {
                        statement.executeUpdate("CREATE TABLE Rutina (" +
                            "    id_rutina INT AUTO_INCREMENT PRIMARY KEY," +
                            "    nombre VARCHAR(255) NOT NULL," +
                            "    Dia VARCHAR(50) NOT NULL," +
                            "    id_usuario INT NOT NULL," +
                            "    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)" +
                            ");");
                    }
                      resultSet = statement.executeQuery("SHOW TABLES LIKE 'DetalleRutina';");
                    if (!resultSet.next()) {
                        statement.executeUpdate("CREATE TABLE DetalleRutina (" +
                            "    id_detalle_rutina INT AUTO_INCREMENT PRIMARY KEY," +
                            "    id_rutina INT NOT NULL," +
                            "    id_ejercicio INT NOT NULL," +
                            "    cantidad_reps INT NOT NULL," +
                            "    FOREIGN KEY (id_rutina) REFERENCES Rutina (id_rutina)," +
                            "    FOREIGN KEY (id_ejercicio) REFERENCES ejercicios (id_ejercicio)" +
                            ");");
                    }
                       resultSet = statement.executeQuery("SHOW TABLES LIKE 'DatosCuerpo';");
                    if (!resultSet.next()) {
                        statement.executeUpdate("CREATE TABLE DatosCuerpo (" +
                        "    id_datos INT AUTO_INCREMENT PRIMARY KEY," +
                        "    sexo VARCHAR(10) NOT NULL," +
                        "    edad INT NOT NULL," +
                        "    peso DECIMAL(5,2) NOT NULL," +
                        "    altura DECIMAL(5,2) NOT NULL," +
                        "    fecha DATE NOT NULL," +
                        "    imc DECIMAL(5,2) NOT NULL," +
                        "    id_usuario INT NOT NULL," +
                        "    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)" +
                        ");");
                    }
                  this.cerrarConexion();

                }else{
                    this.cerrarConexion();
                }
            } catch (ClassNotFoundException | SQLException e) {
                throw new SQLException("Error al establecer la conexión: " + e.getMessage());
            }
        }
        return conexion;
    }

    public void cerrarConexion() throws SQLException {
        if (conexion != null && !conexion.isClosed()) {
            conexion.close();
            System.out.println("Conexión cerrada con éxito.");
        }
    }
}
