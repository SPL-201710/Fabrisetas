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
@Table(name="TEXTO")
public class Texto implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonView(View.Summary.class)
    @Id @GeneratedValue	
    @Column(name = "TEXTO_ID")
	private Integer textoId;

	@JsonView(View.Summary.class)
    @Column(name = "TITULO")  
	private String titulo;

	@JsonView(View.Summary.class)
    @Column(name = "COLOR")  
	private String color;

	public Integer getTextoId() {
		return textoId;
	}

	public void setTextoId(Integer textoId) {
		this.textoId = textoId;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
}
