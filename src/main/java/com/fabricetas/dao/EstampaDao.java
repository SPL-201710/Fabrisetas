package com.fabricetas.dao;

import java.util.List;

import com.fabricetas.model.Estampa;

public interface EstampaDao {

    public List<Estampa> list();
     
    public Estampa get(Integer id);
     
    public void saveOrUpdate(Estampa estampa);
     
    public void delete(Integer id);
    
    public List<Estampa> listXAutor(Integer autor);
    
    public List<Estampa> listXTema(Integer tema);

}
