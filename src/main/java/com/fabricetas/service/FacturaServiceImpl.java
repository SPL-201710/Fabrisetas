package com.fabricetas.service;

import com.fabricetas.dao.FacturaDao;
import com.fabricetas.model.Factura;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("facturaService")
@Transactional
public class FacturaServiceImpl implements FacturaService{

	@Autowired
	private FacturaDao dao;

	public Factura findById(Integer id) {
		return dao.get(id);
	}

	public void saveFactura(Factura factura) {
		dao.saveOrUpdate(factura);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public void updateFactura(Factura factura) {
		Factura entity = dao.get(factura.getFacturaId());
		if(entity!=null){
			entity.setNumber(factura.getNumber());
			entity.setDate(factura.getDate());
			entity.setItemPrice(factura.getItemPrice());
			entity.setTotalPrice(factura.getTotalPrice());
		}
		dao.saveOrUpdate(factura);
	}

	public void deleteFacturaById(Integer facturaId) {
		dao.delete(facturaId);
	}

	public List<Factura> findAllFacturas() {
		return dao.list();
	}
	
}
