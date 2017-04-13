package com.fabricetas.service;

import com.fabricetas.dao.TemaDao;
import com.fabricetas.model.Tema;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("temaService")
@Transactional
public class TemaServiceImpl implements TemaService{

	@Autowired
	private TemaDao dao;

	public Tema findById(Integer id) {
		return dao.get(id);
	}

	public void saveTema(Tema tema) {
		dao.saveOrUpdate(tema);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public void updateTema(Tema tema) {
		Tema entity = dao.get(tema.getTemaId());
		if(entity!=null){
			entity.setDescripcion(tema.getDescripcion());
			entity.setNombre(tema.getNombre());
		}
		dao.saveOrUpdate(tema);
	}

	public void deleteTemaById(Integer temaId) {
		dao.delete(temaId);
	}

	public List<Tema> findAllTemas() {
		return dao.list();
	}
	
}
