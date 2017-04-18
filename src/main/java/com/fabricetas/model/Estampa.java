package com.fabricetas.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fabricetas.config.View;
import com.fasterxml.jackson.annotation.JsonBackReference;
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
	private String urlEstampa;

	@JsonView(View.Summary.class)
    @Column(name = "RATING")  
	private String rating;

	@JsonView(View.Summary.class)
    @Column(name = "PRECIO")  
	private String precio;
	
	@JsonView(View.Summary.class)
	@JsonBackReference
    @ManyToOne
	@JoinColumn(name="USER_ID", nullable = false)
    private User user;

	@JsonView(View.Summary.class)
	@JsonBackReference
    @ManyToOne
	@JoinColumn(name="TEMA_ID", nullable = true)
    private Tema tema;
	
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
		return urlEstampa;
	}

	public void setUrlEstampa(String urlEstampa) {
		this.urlEstampa = urlEstampa;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getPrecio() {
		return precio;
	}

	public void setPrecio(String precio) {
		this.precio = precio;
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
}
