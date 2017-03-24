package com.fabricetas.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {

    @Id @GeneratedValue	
    @Column(name = "USER_ID")
    private Integer userId;
    private String name;
    @Column(name = "IDENTIFICATION_TYPE")
    private String identificationType;
    @Column(name = "IDENTIFICATION_NUMBER")
    private String identificationNumber;
	@OneToMany(mappedBy="user", fetch = FetchType.EAGER, cascade = CascadeType.ALL )
    private List<Address> address;
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

//	public List<Role> getRoles() {
//		return roles;
//	}
//
//	public void setRoles(List<Role> roles) {
//		this.roles = roles;
//	}
     
}