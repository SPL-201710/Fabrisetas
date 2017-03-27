package com.fabricetas.dao;

import java.util.List;

import com.fabricetas.model.Texto;

public interface TextoDao {

    public List<Texto> list();
     
    public Texto get(Integer id);
     
    public void saveOrUpdate(Texto texto);
     
    public void delete(Integer id);

}
