package com.fabricetas.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fabricetas.config.View;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonView;

@Entity
@Table(name="USER")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonView(View.Summary.class)
    @Id @GeneratedValue	
    @Column(name = "USER_ID")	
    private Integer userId;
	
	@JsonView(View.Summary.class)
    @Column(name = "NAME")
    private String name;
	
	@JsonView(View.Summary.class)
    @Column(name = "IDENTIFICATION_TYPE")
    private String identificationType;
	
	@JsonView(View.Summary.class)
    @Column(name = "IDENTIFICATION_NUMBER")
    private String identificationNumber;
	
	@JsonView(View.Summary.class)
    @Column(name = "TIPO")
    private String tipo;

	@JsonView(View.Summary.class)
	@JsonManagedReference
	@OneToMany(mappedBy="user", fetch = FetchType.EAGER, cascade = CascadeType.ALL )
    private List<Address> address;

//	@JsonView(View.Summary.class)
//	@JsonManagedReference
//	@OneToMany(mappedBy="user", fetch = FetchType.EAGER, cascade = CascadeType.ALL )
//    private List<Camiseta> camisetas;
//
//	@JsonView(View.Summary.class)
//	@JsonManagedReference
//	@OneToMany(mappedBy="user", fetch = FetchType.EAGER, cascade = CascadeType.ALL )
//    private List<Estampa> estampas;
	
//	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//    @JoinTable(name="R_USER_ROLE", catalog = "FABRICETAS", 
//    	joinColumns = { @JoinColumn(name = "R_USER_ID", referencedColumnName = "USER_ID")}, 
//    	inverseJoinColumns = { @JoinColumn(name = "R_ROLE_ID", referencedColumnName = "ROLE_ID")})
//    private List<Role> roles;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdentificationType() {
		return identificationType;
	}

	public void setIdentificationType(String identificationType) {
		this.identificationType = identificationType;
	}

	public String getIdentificationNumber() {
		return identificationNumber;
	}

	public void setIdentificationNumber(String identificationNumber) {
		this.identificationNumber = identificationNumber;
	}

	public List<Address> getAddress() {
		return address;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
//
//	public List<Camiseta> getCamisetas() {
//		return camisetas;
//	}
//
//	public void setCamisetas(List<Camiseta> camisetas) {
//		this.camisetas = camisetas;
//	}
//
//	public List<Estampa> getEstampas() {
//		return estampas;
//	}
//
//	public void setEstampas(List<Estampa> estampas) {
//		this.estampas = estampas;
//	}
     
}