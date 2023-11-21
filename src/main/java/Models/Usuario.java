/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author raulvalencia
 */
public class Usuario {
    private int id_usuario;


    private int roll;
    private String nombre_usuario;
    private String apellido_usuario;
    private String correo;
    private String telefono;
    private String direccion;
    private String password;

    public Usuario(int id_usuario,int roll, String nombreUsuario, String apellidoUsuario, String correo, String telefono, String direccion, String password) {
        this.id_usuario = id_usuario;
          this.roll = roll;
        this.nombre_usuario = nombreUsuario;
        this.apellido_usuario = apellidoUsuario;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.password = password;
    }

    public Usuario(int roll, String nombreUsuario, String apellidoUsuario, String correo, String telefono, String direccion, String password) {
        this.nombre_usuario = nombreUsuario;
        this.roll = roll;
        this.apellido_usuario = apellidoUsuario;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.password = password;
    }

    public Usuario(String nombre, int roll, String apellido, String correo, String telefono, String direccion, String contrasena) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    

    public void setIdUsuario(int idUsuario) {
        this.id_usuario = idUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombre_usuario = nombreUsuario;
    }

    public void setApellidoUsuario(String apellidoUsuario) {
        this.apellido_usuario = apellidoUsuario;
    }
        public int getRoll() {
        return roll;
    }

    public void setRoll(int roll) {
        this.roll = roll;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    

    public int getIdUsuario() {
        return id_usuario;
    }

    public String getNombreUsuario() {
        return nombre_usuario;
    }

    public String getApellidoUsuario() {
        return apellido_usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getPassword() {
        return password;
    }
    
    
}
