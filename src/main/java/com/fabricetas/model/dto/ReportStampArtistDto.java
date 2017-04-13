package com.fabricetas.model.dto;

/**
 * Created by belman on 04/04/2017.
 */
public class ReportStampArtistDto {

    public ReportStampArtistDto(String artista, String nombre, String tema, String valor, String cantidad, String total) {
        this.artista = artista;
        this.nombre = nombre;
        this.tema = tema;
        this.valor = valor;
        this.cantidad = cantidad;
        this.total = total;
    }

    private String artista, nombre, tema, valor, cantidad, total;

    public String getArtista() {
        return artista;
    }

    public void setArtista(String artista) {
        this.artista = artista;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
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
