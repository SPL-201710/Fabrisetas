package com.fabricetas.model.dto;

/**
 * Created by belman on 04/04/2017.
 */
public class ReportShirtDto {

    public ReportShirtDto(String nombre, String color, String talla, String valor, String cantidad, String total) {
        this.nombre = nombre;
        this.color = color;
        this.talla = talla;
        this.valor = valor;
        this.cantidad = cantidad;
        this.total = total;
    }

    private String nombre, color, talla, valor, cantidad, total;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}
