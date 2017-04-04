package com.fabricetas.dao;

import com.fabricetas.model.Factura;

import java.util.List;

public interface FacturaDao {

    public List<Factura> list();
     
    public Factura get(Integer id);
     
    public void saveOrUpdate(Factura factura);
     
    public void delete(Integer id);

}
