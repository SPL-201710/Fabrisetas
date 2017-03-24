package com.fabricetas.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Role {

    @Id @GeneratedValue	
    @Column(name = "ROLE_ID")
    private Integer roleId;
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