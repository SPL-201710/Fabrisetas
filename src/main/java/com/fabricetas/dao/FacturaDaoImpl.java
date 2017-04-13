package com.fabricetas.dao;

import com.fabricetas.model.Factura;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class FacturaDaoImpl implements FacturaDao {
    @Autowired
    private SessionFactory sessionFactory;
 
    public FacturaDaoImpl() {
         
    }
     
    public FacturaDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Override
    @Transactional
    public List<Factura> list() {
        @SuppressWarnings("unchecked")
        List<Factura> listFactura = (List<Factura>) sessionFactory.getCurrentSession()
                .createCriteria(Factura.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
 
        return listFactura;
    }
 
    @Override
    @Transactional
    public void saveOrUpdate(Factura factura) {
        System.out.println("saveOrUpdate");
        sessionFactory.getCurrentSession().saveOrUpdate(factura);
    }
 
    @Override
    @Transactional
    public void delete(Integer id) {
        Factura facturaToDelete = new Factura();
        facturaToDelete.setFacturaId(id);
        sessionFactory.getCurrentSession().delete(facturaToDelete);
    }
 
    @Override
    @Transactional
    public Factura get(Integer id) {
        String hql = "from Factura where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Factura> listFactura = (List<Factura>) query.list();
         
        if (listFactura != null && !listFactura.isEmpty()) {
            return listFactura.get(0);
        }
         
        return null;
    }
}
