package com.fabricetas.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

import com.fabricetas.config.View;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;

@Entity
@Table(name="ESTAMPA")
public class Estampa implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonView(View.Summary.class)
    @Id @GeneratedValue
    @Column(name = "ESTAMPA_ID")
	private Integer estampaId;

	@JsonView(View.Summary.class)
    @Column(name = "NOMBRE")
	private String nombre;

	@JsonView(View.Summary.class)
    @Column(name = "DESCRIPCION")
	private String descripcion;

	@JsonView(View.Summary.class)
    @Column(name = "URL_ESTAMPA")
	private String urlImagen;

	@JsonView(View.Summary.class)
    @Column(name = "RATING")
	private String rating;

	@JsonView(View.Summary.class)
    @Column(name = "PRECIO")
	private String valor;

	@JsonView(View.Summary.class)
	@JsonBackReference
    @ManyToOne
	@JoinColumn(name="USER_ID", nullable = false)
    private User user;

	@JsonView(View.Summary.class)
	@JsonBackReference
    @ManyToOne//(fetch = FetchType.EAGER)
	@JoinColumn(name="TEMA_ID", nullable = false)
    private Tema tema ;

	@JsonView(View.Summary.class)
	@Transient
	private Integer temaId;

	@JsonView(View.Summary.class)
	@Transient
	private String temaNombre;

	@JsonIgnore
	@OneToMany(mappedBy = "estampa", cascade = CascadeType.ALL)
	private List<Factura> facturas = new ArrayList<>();

	public Integer getEstampaId() {
		return estampaId;
	}

	public void setEstampaId(Integer estampaId) {
		this.estampaId = estampaId;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getUrlEstampa() {
		return urlImagen;
	}

	public void setUrlEstampa(String urlEstampa) {
		this.urlImagen = urlEstampa;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getPrecio() {
		return valor;
	}

	public void setPrecio(String precio) {
		this.valor = precio;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Tema getTema() {
		return tema;
	}

	public void setTema(Tema tema) {
		this.tema = tema;
	}

	public Integer getTemaId() {
		return temaId;
	}

	public void setTemaId(Integer temaId) {
		this.temaId = temaId;
	}

	public String getTemaNombre() {
		return temaNombre;
	}

	public void setTemaNombre(String temaNombre) {
		this.temaNombre = temaNombre;
	}

	public String getUrlImagen() {
		return urlImagen;
	}

	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public List<Factura> getFacturas() {
		return facturas;
	}

	public void setFacturas(List<Factura> facturas) {
		this.facturas = facturas;
	}
}
