package com.fabricetas.dao;

import java.util.List;

import com.fabricetas.model.Tema;

public interface TemaDao {

    public List<Tema> list();
     
    public Tema get(Integer id);
     
    public void saveOrUpdate(Tema tema);
     
    public void delete(Integer id);

}
