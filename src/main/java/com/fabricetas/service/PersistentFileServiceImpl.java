package com.fabricetas.service;

import java.util.List;

import com.fabricetas.dao.PersistentFileDao;
import com.fabricetas.model.PersistentFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDocumentService")
@Transactional
public class PersistentFileServiceImpl implements PersistentFileService {

	@Autowired
    PersistentFileDao dao;

	public PersistentFile findById(Integer id) {
		return dao.findById(id);
	}

	public List<PersistentFile> findAll() {
		return dao.findAll();
	}

	public List<PersistentFile> findAllByUserId(Integer userId) { return dao.findAllByUserId(userId); }

	public List<PersistentFile> findAllByCamisetaId(Integer camisetaId) { return dao.findAllByCamisetaId(camisetaId); }

	public List<PersistentFile> findAllByEstampaId(Integer estampaId) { return dao.findAllByEstampaId(estampaId); }

	public List<PersistentFile> findAllByTemaId(Integer temaId) { return dao.findAllByTemaId(temaId); }
	
	public void saveDocument(PersistentFile document){
		dao.save(document);
	}

	public void deleteById(Integer id){
		dao.deleteById(id);
	}
	
}
