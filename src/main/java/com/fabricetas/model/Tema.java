package com.fabricetas.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import com.fabricetas.config.View;
import com.fasterxml.jackson.annotation.JsonIgnore;
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

	@ManyToOne
	@JoinColumn(name="USER_ID")
	@JsonView(View.Summary.class)
	private User user;

	@JsonIgnore
	@OneToMany(mappedBy = "tema", cascade = CascadeType.ALL)
	private List<Factura> facturas = new ArrayList<>();

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

	public List<Factura> getFacturas() {
		return facturas;
	}

	public void setFacturas(List<Factura> facturas) {
		this.facturas = facturas;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
