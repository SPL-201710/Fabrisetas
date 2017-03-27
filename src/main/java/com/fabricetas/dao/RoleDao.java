package com.fabricetas.dao;

import java.util.List;

import com.fabricetas.model.Role;

public interface RoleDao {

    public List<Role> list();
     
    public Role get(Integer id);
     
    public void saveOrUpdate(Role role);
     
    public void delete(Integer id);

}
