package com.fabricetas.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fabricetas.config.View;
import com.fasterxml.jackson.annotation.JsonView;

@Entity
@Table(name="TEMA")
public class Tema implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonView(View.Summary.class)
    @Id @GeneratedValue	
    @Column(name = "TEMA_ID")
	private Integer temaId;

	@JsonView(View.Summary.class)
    @Column(name = "NOMBRE")  
	private String nombre;

	@JsonView(View.Summary.class)
    @Column(name = "DESCRIPCION")  
	private String descripcion;

	@JsonView(View.Summary.class)
    @Column(name = "URL_TEMA")  
	private String urlTema;

	public Integer getTemaId() {
		return temaId;
	}

	public void setTemaId(Integer temaId) {
		this.temaId = temaId;
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

	public String getUrlTema() {
		return urlTema;
	}

	public void setUrlTema(String urlTema) {
		this.urlTema = urlTema;
	}
	
}
