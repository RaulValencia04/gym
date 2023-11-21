/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author raulvalencia
 */
public class DatosCuerpo {
    
    private int idDatos;
    private String sexo;
    private int edad;
    private double peso;
    private double altura;
    private Date fecha;
    private double imc;
    private int idUsuario;

    public DatosCuerpo(String sexo, int edad, double peso, double altura, Date fecha, double imc, int idUsuario) {
        this.sexo = sexo;
        this.edad = edad;
        this.peso = peso;
        this.altura = altura;
        this.fecha = fecha;
        this.imc = imc;
        this.idUsuario = idUsuario;
    }
    
    

    public DatosCuerpo(int idDatos, String sexo, int edad, double peso, double altura, Date fecha, double imc, int idUsuario) {
        this.idDatos = idDatos;
        this.sexo = sexo;
        this.edad = edad;
        this.peso = peso;
        this.altura = altura;
        this.fecha = fecha;
        this.imc = imc;
        this.idUsuario = idUsuario;
    }

    public DatosCuerpo() {
        
    }

    public DatosCuerpo(String sexo, int edad, double peso, double altura, String fechaStr, double imc, int idUsuario) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    

    public void setIdDatos(int idDatos) {
        this.idDatos = idDatos;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void setImc(double imc) {
        this.imc = imc;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    

    public int getIdDatos() {
        return idDatos;
    }

    public String getSexo() {
        return sexo;
    }

    public int getEdad() {
        return edad;
    }

    public double getPeso() {
        return peso;
    }

    public double getAltura() {
        return altura;
    }

    public Date getFecha() {
        return fecha;
    }

    public double getImc() {
        return imc;
    }

    public int getIdUsuario() {
        return idUsuario;
    }
    
    
    
    
}
