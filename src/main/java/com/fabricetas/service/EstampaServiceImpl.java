package com.fabricetas.service;

import com.fabricetas.dao.EstampaDao;
import com.fabricetas.model.Estampa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("estampaService")
@Transactional
public class EstampaServiceImpl implements EstampaService{

	@Autowired
	private EstampaDao dao;

	public Estampa findById(Integer id) {
		return dao.get(id);
	}

	public void saveEstampa(Estampa estampa) {
		dao.saveOrUpdate(estampa);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public void updateEstampa(Estampa estampa) {
		Estampa entity = dao.get(estampa.getEstampaId());
		if(entity!=null){
			entity.setNombre(estampa.getNombre());
			entity.setDescripcion(estampa.getDescripcion());
			entity.setRating(estampa.getRating());
			entity.setPrecio(estampa.getPrecio());
		}
		dao.saveOrUpdate(estampa);
	}

	public void deleteEstampaById(Integer estampaId) {
		dao.delete(estampaId);
	}

	public List<Estampa> findAllEstampas() {
		return dao.list();
	}
	
}
