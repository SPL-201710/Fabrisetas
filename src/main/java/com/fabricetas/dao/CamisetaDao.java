package com.fabricetas.dao;

import java.util.List;

import com.fabricetas.model.Camiseta;

public interface CamisetaDao {

    public List<Camiseta> list();
     
    public Camiseta get(Integer id);
     
    public void saveOrUpdate(Camiseta camiseta);
     
    public void delete(Integer id);

}
