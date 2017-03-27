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
@Table(name="ROLE")
public class Role implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonView(View.Summary.class)
    @Id @GeneratedValue	
    @Column(name = "ROLE_ID")
    private Integer roleId;
	
	@JsonView(View.Summary.class)
    @Column(name = "NAME")
    private String name;
//    private List<User> users;
    
	public Integer getRoleId() {
		return roleId;
	}
	
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
//	public List<User> getUsers() {
//		return users;
//	}
//	
//	public void setUsers(List<User> users) {
//		this.users = users;
//	}
     
}