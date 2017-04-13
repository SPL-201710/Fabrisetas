package com.fabricetas.service;

import com.fabricetas.model.Tema;

import java.util.List;

public interface TemaService {
	
	Tema findById(Integer id);
	
	void saveTema(Tema tema);
	
	void updateTema(Tema tema);

	void deleteTemaById(Integer id);

	List<Tema> findAllTemas();

}