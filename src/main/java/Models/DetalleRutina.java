/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author raulvalencia
 */
public class DetalleRutina {
    
     private int idDetalleRutina;
    private int idEjercicio;
    private int cantidadReps;

    // Constructor
    public DetalleRutina(int idEjercicio, int cantidadReps) {
        this.idEjercicio = idEjercicio;
        this.cantidadReps = cantidadReps;
    }

    // Getters y setters (puedes generarlos automáticamente en tu IDE)
    public int getIdDetalleRutina() {
        return idDetalleRutina;
    }

    public void setIdDetalleRutina(int idDetalleRutina) {
        this.idDetalleRutina = idDetalleRutina;
    }

    public int getIdEjercicio() {
        return idEjercicio;
    }

    public void setIdEjercicio(int idEjercicio) {
        this.idEjercicio = idEjercicio;
    }

    public int getCantidadReps() {
        return cantidadReps;
    }

    public void setCantidadReps(int cantidadReps) {
        this.cantidadReps = cantidadReps;
    }
    
    
}
