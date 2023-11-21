/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author raulvalencia
 */
public class Categoria {
    private int idCategoria;
    private String descripcion;
    private String imgUrl;

    public Categoria(String descripcion, String imgUrl) {
        this.descripcion = descripcion;
        this.imgUrl = imgUrl;
    }

    public Categoria() {
    }
    

    public Categoria(int idCategoria, String descripcion, String imgUrl) {
        this.idCategoria = idCategoria;
        this.descripcion = descripcion;
        this.imgUrl = imgUrl;
    }
    

    public int getIdCategoria() {
        return idCategoria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
    
    
}
