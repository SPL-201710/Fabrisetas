package com.fabricetas.dao;

import java.util.List;

import com.fabricetas.model.Address;

public interface AddressDao {

    public List<Address> list();
     
    public Address get(Integer id);
     
    public void saveOrUpdate(Address address);
     
    public void delete(Integer id);

}
