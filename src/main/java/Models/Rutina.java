/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author raulvalencia
 */
public class Rutina {
       private int idRutina;
    private String nombre;
    private String dia;
    private int idDetalleRutina;
    private int idUsuario;

    // Constructor
    public Rutina(String nombre, String dia, int idDetalleRutina, int idUsuario) {
        this.nombre = nombre;
        this.dia = dia;
        this.idDetalleRutina = idDetalleRutina;
        this.idUsuario = idUsuario;
    }

    // Getters y setters (puedes generarlos automáticamente en tu IDE)
    public int getIdRutina() {
        return idRutina;
    }

    public void setIdRutina(int idRutina) {
        this.idRutina = idRutina;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public int getIdDetalleRutina() {
        return idDetalleRutina;
    }

    public void setIdDetalleRutina(int idDetalleRutina) {
        this.idDetalleRutina = idDetalleRutina;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
}
