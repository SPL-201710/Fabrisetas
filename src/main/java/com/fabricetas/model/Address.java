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
@Table(name="ADDRESS")
public class Address implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonView(View.Summary.class)
    @Id @GeneratedValue	
    @Column(name = "ADDRESS_ID")	
    private Integer addressId; 
	
	@JsonView(View.Summary.class)
    @Column(name = "NAME")  
    private String name;

	@ManyToOne
	//@JsonBackReference
	@JsonView(View.Summary.class)
	@JoinColumn(name="USER_ID", nullable = false)
    private User user;
    
	public Integer getAddressId() {
		return addressId;
	}
	
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
}