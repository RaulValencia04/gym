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
    private String nombreEjercicio;
    private int  repeticiones;

    public Rutina(String nombre, String dia,  String nombreEjercicio, int repeticiones) {
        this.nombre = nombre;
        this.dia = dia;
        this.nombreEjercicio = nombreEjercicio;
        this.repeticiones = repeticiones;
        
    }

    public Rutina(int idRutina, String nombre, String dia, String nombreEjercicio, int repeticiones, int idUsuario) {
        this.idRutina = idRutina;
        this.nombre = nombre;
        this.dia = dia;
        this.nombreEjercicio = nombreEjercicio;
        this.repeticiones = repeticiones;
        this.idUsuario = idUsuario;
    }

    public String getNombreEjercicio() {
        return nombreEjercicio;
    }

    public void setNombreEjercicio(String nombreEjercicio) {
        this.nombreEjercicio = nombreEjercicio;
    }

    public int getRepeticiones() {
        return repeticiones;
    }

    public void setRepeticiones(int repeticiones) {
        this.repeticiones = repeticiones;
    }
  
    private int idUsuario;

    // Constructor
    public Rutina(String nombre, String dia, int idUsuario) {
        this.nombre = nombre;
        this.dia = dia;
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


    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
}
