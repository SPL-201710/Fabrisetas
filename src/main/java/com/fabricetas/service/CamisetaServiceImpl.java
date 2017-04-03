package com.fabricetas.service;

import com.fabricetas.dao.CamisetaDao;
import com.fabricetas.model.Camiseta;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("camisetaService")
@Transactional
public class CamisetaServiceImpl implements CamisetaService{

	@Autowired
	private CamisetaDao dao;

	public Camiseta findById(Integer id) {
		return dao.get(id);
	}

	public void saveCamiseta(Camiseta camiseta) {
		dao.saveOrUpdate(camiseta);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public void updateCamiseta(Camiseta camiseta) {
		Camiseta entity = dao.get(camiseta.getCamisetaId());
		if(entity!=null){
			entity.setMaterial(camiseta.getMaterial());
			entity.setDescripcion(camiseta.getDescripcion());
			entity.setValor(camiseta.getValor());
			entity.setNombre(camiseta.getNombre());
			entity.setColor(camiseta.getColor());
		}
		dao.saveOrUpdate(camiseta);
	}

	public void deleteCamisetaById(Integer camisetaId) {
		dao.delete(camisetaId);
	}

	public List<Camiseta> findAllCamisetas() {
		return dao.list();
	}
	
}
