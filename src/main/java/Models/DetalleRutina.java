package Models;

public class DetalleRutina {

    private int idDetalleRutina;
    private int idEjercicio;
    private int idRutina; // Nueva variable
    private int cantidadReps;

    // Constructores

    // Constructor para la inserción de un nuevo detalle de rutina
    public DetalleRutina(int idEjercicio, int idRutina, int cantidadReps) {
        this.idEjercicio = idEjercicio;
        this.idRutina = idRutina;
        this.cantidadReps = cantidadReps;
    }

    // Constructor para la obtención de un detalle de rutina por ID
    public DetalleRutina(int idDetalleRutina, int idEjercicio, int idRutina, int cantidadReps) {
        this.idDetalleRutina = idDetalleRutina;
        this.idEjercicio = idEjercicio;
        this.idRutina = idRutina;
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

    public int getIdRutina() {
        return idRutina;
    }

    public void setIdRutina(int idRutina) {
        this.idRutina = idRutina;
    }

    public int getCantidadReps() {
        return cantidadReps;
    }

    public void setCantidadReps(int cantidadReps) {
        this.cantidadReps = cantidadReps;
    }
}
