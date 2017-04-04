package com.fabricetas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import com.fabricetas.config.View;
import com.fabricetas.dao.EstampaDao;
import com.fabricetas.model.Estampa;
import com.fabricetas.model.Tema;
import com.fabricetas.model.User;
import com.fasterxml.jackson.annotation.JsonView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EstampaController {

	@Autowired
	private EstampaDao estampaDao;
	
//	@Autowired
//	private EstampaService estampaService;

	// ------------------- Obtener todas las estampas --------------------------------------------------------

	@JsonView(View.Summary.class)
	@RequestMapping(value = "/estampa", method = RequestMethod.GET)
	public ResponseEntity<List<Estampa>> listAllEstampas() {
//		 List<Estampa> estampas = estampaService.listAllEstampas();
		List<Estampa> estampas = estampaDao.list();
		
		if (estampas.isEmpty()) {
			return new ResponseEntity<List<Estampa>>(HttpStatus.NO_CONTENT);
		}
		for(Estampa estampa: estampas){
			estampa.setTemaId(estampa.getTema().getTemaId());
			estampa.setTemaNombre(estampa.getTema().getNombre());
		}
		return new ResponseEntity<List<Estampa>>(estampas, HttpStatus.OK);
	}

	// ------------------- Obtener una estmpa --------------------------------------------------------

	@RequestMapping(value = "/estampa/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Estampa> getEstampa(@PathVariable("id") long id) {
		System.out.println("Fetching Estampa with id " + id);
		Estampa estampa = estampaDao.get(Integer.parseInt(id + ""));
		if (estampa == null) {
			System.out.println("Estampa with id " + id + " not found");
			return new ResponseEntity<Estampa>(HttpStatus.NOT_FOUND);
		}
		estampa.setTemaId(estampa.getTema().getTemaId());
		estampa.setTemaNombre(estampa.getTema().getNombre());
		return new ResponseEntity<Estampa>(estampa, HttpStatus.OK);
	}

	// ------------------- Crear una estampa --------------------------------------------------------

	@RequestMapping(value = "/estampa", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> createEstampa(@RequestBody ModelMap estampa,
	  UriComponentsBuilder ucBuilder) {
		
		try{
			Estampa currentEstampa = new Estampa();
	
			Tema tema = new Tema();
			tema.setTemaId(Integer.valueOf(estampa.get("temaId").toString()));
			User user = new User();
			user.setUserId(Integer.valueOf(estampa.get("userId").toString()));
			
			currentEstampa.setDescripcion(estampa.get("descripcion").toString());
			currentEstampa.setNombre(estampa.get("nombre").toString());
			currentEstampa.setPrecio(estampa.get("valor").toString());
			currentEstampa.setUrlEstampa(estampa.get("urlImagen").toString());
			currentEstampa.setTema(tema);
			currentEstampa.setUser(user);
	
			estampaDao.saveOrUpdate(currentEstampa);
	
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		catch(Exception e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_MODIFIED);
		}
		
	}

	// ------------------- Actualizar una estampa --------------------------------------------------------

	@RequestMapping(value = "/estampa/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Estampa> updateEstampa(@PathVariable("id") long id,
			@RequestBody ModelMap estampa) {
		System.out.println("Updating Estampa " + id);

		Estampa currentEstampa = estampaDao.get(Integer.parseInt(id + ""));

		if (currentEstampa == null) {
			System.out.println("Estampa with id " + id + " not found");
			return new ResponseEntity<Estampa>(HttpStatus.NOT_FOUND);
		}
		
		try
		{
			Tema tema = new Tema();
			tema.setTemaId(Integer.valueOf(estampa.get("temaId").toString()));
			User user = new User();
			user.setUserId(Integer.valueOf(estampa.get("userId").toString()));
			
			currentEstampa.setDescripcion(estampa.get("descripcion").toString());
			currentEstampa.setNombre(estampa.get("nombre").toString());
			currentEstampa.setPrecio(estampa.get("valor").toString());
			currentEstampa.setUrlEstampa(estampa.get("urlImagen").toString());
			currentEstampa.setTema(tema);
			currentEstampa.setUser(user);
	
			estampaDao.saveOrUpdate(currentEstampa);
			return new ResponseEntity<Estampa>(currentEstampa, HttpStatus.OK);
		}
		catch(Exception e)
		{
			return new ResponseEntity<Estampa>(HttpStatus.NOT_MODIFIED);
		}
	}

	// ------------------- Borrar una estampa --------------------------------------------------------

	@RequestMapping(value = "/estampa/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Estampa> deleteEstampa(@PathVariable("id") long id) {
		System.out.println("Fetching & Deleting Estampa with id " + id);

		Estampa estampa = estampaDao.get(Integer.parseInt(id + ""));
		if (estampa == null) {
			System.out.println("Unable to delete. Estampa with id " + id
					+ " not found");
			return new ResponseEntity<Estampa>(HttpStatus.NOT_FOUND);
		}
		try
		{
			estampaDao.delete(Integer.parseInt(id + ""));
			return new ResponseEntity<Estampa>(HttpStatus.OK);
		}
		catch(Exception e)
		{
			return new ResponseEntity<Estampa>(HttpStatus.NOT_MODIFIED);
		}
	}
	// -- Filtros adicionales estampas
	
	@JsonView(View.Summary.class)
	@RequestMapping(value = "/estampa/autor/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Estampa>> listAllEstampasAutor(@PathVariable("id") long id) {
		List<Estampa> estampas = estampaDao.listXAutor(Integer.parseInt(id + ""));
		
		if ((estampas == null) || estampas.isEmpty()) {
			return new ResponseEntity<List<Estampa>>(HttpStatus.NO_CONTENT);
		}
		for(Estampa estampa: estampas){
			estampa.setTemaId(estampa.getTema().getTemaId());
			estampa.setTemaNombre(estampa.getTema().getNombre());
		}
		return new ResponseEntity<List<Estampa>>(estampas, HttpStatus.OK);
	}
	
	@JsonView(View.Summary.class)
	@RequestMapping(value = "/estampa/tema/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Estampa>> listAllEstampasTema(@PathVariable("id") long id) {
		List<Estampa> estampas = estampaDao.listXTema(Integer.parseInt(id + ""));
		
		if ((estampas == null) || estampas.isEmpty()) {
			return new ResponseEntity<List<Estampa>>(HttpStatus.NO_CONTENT);
		}
		for(Estampa estampa: estampas){
			estampa.setTemaId(estampa.getTema().getTemaId());
			estampa.setTemaNombre(estampa.getTema().getNombre());
		}
		return new ResponseEntity<List<Estampa>>(estampas, HttpStatus.OK);
	}
}
