package com.fabricetas.service;

import com.fabricetas.model.Camiseta;

import java.util.List;

public interface CamisetaService {
	
	Camiseta findById(Integer id);
	
	void saveCamiseta(Camiseta camiseta);
	
	void updateCamiseta(Camiseta camiseta);

	void deleteCamisetaById(Integer id);

	List<Camiseta> findAllCamisetas();

}