/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author raulvalencia
 */
public class Ejercicio {
    
    private int idEjercicio;
    private String nombre;
    private String imagenUrl;
    private String descripcion;
    private int idCategoria;

    public Ejercicio(int idEjercicio, String nombre, String imagenUrl, String descripcion, int idCategoria) {
        this.idEjercicio = idEjercicio;
        this.nombre = nombre;
        this.imagenUrl = imagenUrl;
        this.descripcion = descripcion;
        this.idCategoria = idCategoria;
    }

    public Ejercicio(String nombre, String imagenUrl, String descripcion, int idCategoria) {
        this.nombre = nombre;
        this.imagenUrl = imagenUrl;
        this.descripcion = descripcion;
        this.idCategoria = idCategoria;
    }

    public Ejercicio() {
    }
    
    

    public int getIdEjercicio() {
        return idEjercicio;
    }

    public void setIdEjercicio(int idEjercicio) {
        this.idEjercicio = idEjercicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImagenUrl() {
        return imagenUrl;
    }

    public void setImagenUrl(String imagenUrl) {
        this.imagenUrl = imagenUrl;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    
}
