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
@Table(name="CAMISETA")
public class Camiseta implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonView(View.Summary.class)
    @Id @GeneratedValue	
    @Column(name = "CAMISETA_ID")
	private Integer camisetaId;

	@JsonView(View.Summary.class)
    @Column(name = "NOMBRE")  
	private String nombre;

	@JsonView(View.Summary.class)
    @Column(name = "DESCRIPCION")  
	private String descripcion;

	@JsonView(View.Summary.class)
    @Column(name = "URL_CAMISETA")  
	private String urlCamiseta;

	@JsonView(View.Summary.class)
    @Column(name = "MATERIAL")  
	private String material;

	@JsonView(View.Summary.class)
    @Column(name = "COLOR")  
	private String color;

	@JsonView(View.Summary.class)
    @Column(name = "VALOR")  
	private String valor;
	
	@JsonView(View.Summary.class)
	@JsonBackReference
    @ManyToOne
	@JoinColumn(name="USER_ID", nullable = false)
    private User user;
	
	@JsonView(View.Summary.class)
	@JsonBackReference
    @ManyToOne
	@JoinColumn(name="TEXTO_ID", nullable = false)
    private Texto texto;

	public Integer getCamisetaId() {
		return camisetaId;
	}

	public void setCamisetaId(Integer camisetaId) {
		this.camisetaId = camisetaId;
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

	public String getUrlCamiseta() {
		return urlCamiseta;
	}

	public void setUrlCamiseta(String urlCamiseta) {
		this.urlCamiseta = urlCamiseta;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Texto getTexto() {
		return texto;
	}

	public void setTexto(Texto texto) {
		this.texto = texto;
	}
	
}
