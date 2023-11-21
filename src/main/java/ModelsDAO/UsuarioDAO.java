/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelsDAO;

/**
 *
 * @author raulvalencia
 */
import Conexion.Conexion;
import Models.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    public List<Usuario> getUsuarios() {
    List<Usuario> usuarios = new ArrayList<>();
    String consultaSQL = "SELECT * FROM usuarios";

    try {
        Conexion conexion = new Conexion();
        Connection con = conexion.obtenerConexion();
        PreparedStatement statement = con.prepareStatement(consultaSQL);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Usuario usuario = new Usuario(
                resultSet.getInt("id_usuario"),
                resultSet.getString("nombre_usuario"),
                resultSet.getString("apellido_usuario"),
                resultSet.getString("correo"),
                resultSet.getString("telefono"),
                resultSet.getString("direccion"),
                resultSet.getString("passwords")
            );
            usuarios.add(usuario);
        }

        resultSet.close();
        statement.close();
        con.close();

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return usuarios;
}

   

    public Usuario obtenerUsuarioPorId(int idUsuario) {
        Usuario usuario = null;
        String consultaSQL = "SELECT * FROM usuarios WHERE id_usuario = ?";

        try {
             Conexion conexion = new Conexion();
            Connection con = conexion.obtenerConexion();
            PreparedStatement statement = con.prepareStatement(consultaSQL);
            statement.setInt(1, idUsuario);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                usuario = new Usuario(
                    resultSet.getInt("id_usuario"),
                            resultSet.getInt("roll"),
                    resultSet.getString("nombre_usuario"),
                    resultSet.getString("apellido_usuario"),
                    resultSet.getString("correo"),
                    resultSet.getString("telefono"),
                    resultSet.getString("direccion"),
                    resultSet.getString("passwords")
                );
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public Usuario obtenerUsuarioPorCorreo(String correo) {
        Usuario usuario = null;
        String consultaSQL = "SELECT * FROM usuarios WHERE correo = ?";

        try {
             Conexion conexion = new Conexion();
            Connection con = conexion.obtenerConexion();
            PreparedStatement statement = con.prepareStatement(consultaSQL);
            statement.setString(1, correo);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                usuario = new Usuario(
                    resultSet.getInt("id_usuario"),
                    resultSet.getInt("roll"),
                    resultSet.getString("nombre_usuario"),
                    resultSet.getString("apellido_usuario"),
                    resultSet.getString("correo"),
                    resultSet.getString("telefono"),
                    resultSet.getString("direccion"),
                    resultSet.getString("passwords")
                );
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public void agregarUsuario(Usuario usuario) {
        String consultaSQL = "INSERT INTO usuarios (nombre_usuario,roll, apellido_usuario, correo, telefono, direccion, passwords) VALUES (?, ?, ?, ?, ?, ?,?)";

        try {
             Conexion conexion = new Conexion();
            Connection con = conexion.obtenerConexion();
            PreparedStatement statement = con.prepareStatement(consultaSQL);
            statement.setString(1, usuario.getNombreUsuario());
            statement.setInt(2, usuario.getRoll());
            statement.setString(3, usuario.getApellidoUsuario());
            statement.setString(4, usuario.getCorreo());
            statement.setString(5, usuario.getTelefono());
            statement.setString(6, usuario.getDireccion());
            statement.setString(7, encriptarContraseña(usuario.getPassword()));

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarUsuario(Usuario usuario) {
        String consultaSQL = "UPDATE usuarios SET nombre_usuario = ?,roll = ? , apellido_usuario = ?, correo = ?, telefono = ?, direccion = ?, passwords = ? WHERE id_usuario = ?";

        try {
             Conexion conexion = new Conexion();
            Connection con = conexion.obtenerConexion();
            PreparedStatement statement = con.prepareStatement(consultaSQL);
            statement.setString(1, usuario.getNombreUsuario());
             statement.setInt(2, usuario.getRoll());
            statement.setString(3, usuario.getApellidoUsuario());
            statement.setString(4, usuario.getCorreo());
            statement.setString(5, usuario.getTelefono());
            statement.setString(6, usuario.getDireccion());
            statement.setString(7, encriptarContraseña(usuario.getPassword()));
            statement.setInt(8, usuario.getIdUsuario());

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarUsuario(int idUsuario) {
        String consultaSQL = "DELETE FROM usuarios WHERE id_usuario = ?";

        try {
             Conexion conexion = new Conexion();
            Connection con = conexion.obtenerConexion();
            PreparedStatement statement = con.prepareStatement(consultaSQL);
            statement.setInt(1, idUsuario);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    public String encriptarContraseña(String contraseña) {
        try {
            MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
            byte[] passwordBytes = contraseña.getBytes("UTF-8");
            byte[] hashBytes = sha256.digest(passwordBytes);

            Formatter formatter = new Formatter();
            for (byte b : hashBytes) {
                formatter.format("%02x", b);
            }
            return formatter.toString();
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean verificarContraseña(String contraseñaIngresada, String contraseñaAlmacenada) {
        String contraseñaIngresadaEncriptada = encriptarContraseña(contraseñaIngresada);
        return contraseñaIngresadaEncriptada.equals(contraseñaAlmacenada);
    }
}
