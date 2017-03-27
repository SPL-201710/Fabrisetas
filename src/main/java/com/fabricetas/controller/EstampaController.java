package com.fabricetas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import com.fabricetas.config.View;
import com.fabricetas.dao.EstampaDao;
import com.fabricetas.model.Estampa;
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

	// ------------------- Obtener todos los usuarios --------------------------------------------------------

	@JsonView(View.Summary.class)
	@RequestMapping(value = "/estampa", method = RequestMethod.GET)
	public ResponseEntity<List<Estampa>> listAllEstampas() {
//		 List<Estampa> estampas = estampaService.listAllEstampas();
		List<Estampa> estampas = estampaDao.list();
		
		if (estampas.isEmpty()) {
			return new ResponseEntity<List<Estampa>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Estampa>>(estampas, HttpStatus.OK);
	}

	// ------------------- Obtener un usuario --------------------------------------------------------

	@RequestMapping(value = "/estampa/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Estampa> getEstampa(@PathVariable("id") long id) {
		System.out.println("Fetching Estampa with id " + id);
		Estampa estampa = estampaDao.get(Integer.parseInt(id + ""));
		if (estampa == null) {
			System.out.println("Estampa with id " + id + " not found");
			return new ResponseEntity<Estampa>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Estampa>(estampa, HttpStatus.OK);
	}

	// ------------------- Crear un usuario --------------------------------------------------------

	@RequestMapping(value = "/estampa", method = RequestMethod.POST)
	public ResponseEntity<Void> createEstampa(@RequestBody Estampa estampa,
			UriComponentsBuilder ucBuilder) {
		System.out.println("Creating Estampa " + estampa.getNombre());

		if (estampaDao.get(estampa.getEstampaId()) != null) {
			System.out.println("A Estampa with name " + estampa.getNombre()
					+ " already exist");
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}

		estampaDao.saveOrUpdate(estampa);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/estampa/{id}")
				.buildAndExpand(estampa.getEstampaId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	// ------------------- Actualizar un usuario --------------------------------------------------------

	@RequestMapping(value = "/estampa/{id}", method = RequestMethod.PUT)
	public ResponseEntity<Estampa> updateEstampa(@PathVariable("id") long id,
			@RequestBody Estampa estampa) {
		System.out.println("Updating Estampa " + id);

		Estampa currentEstampa = estampaDao.get(Integer.parseInt(id + ""));

		if (currentEstampa == null) {
			System.out.println("Estampa with id " + id + " not found");
			return new ResponseEntity<Estampa>(HttpStatus.NOT_FOUND);
		}

		currentEstampa.setDescripcion(estampa.getDescripcion());
		currentEstampa.setNombre(estampa.getNombre());
		currentEstampa.setPrecio(estampa.getPrecio());
		currentEstampa.setRating(estampa.getRating());
		currentEstampa.setUrlEstampa(estampa.getUrlEstampa());

		estampaDao.saveOrUpdate(currentEstampa);
		return new ResponseEntity<Estampa>(currentEstampa, HttpStatus.OK);
	}

	// ------------------- Borrar un Usuario --------------------------------------------------------

	@RequestMapping(value = "/estampa/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Estampa> deleteEstampa(@PathVariable("id") long id) {
		System.out.println("Fetching & Deleting Estampa with id " + id);

		Estampa estampa = estampaDao.get(Integer.parseInt(id + ""));
		if (estampa == null) {
			System.out.println("Unable to delete. Estampa with id " + id
					+ " not found");
			return new ResponseEntity<Estampa>(HttpStatus.NOT_FOUND);
		}

		estampaDao.delete(Integer.parseInt(id + ""));
		return new ResponseEntity<Estampa>(HttpStatus.NO_CONTENT);
	}

	// ------------------- Borrar todos los usuarios --------------------------------------------------------

//	@RequestMapping(value = "/estampa", method = RequestMethod.DELETE)
//	public ResponseEntity<Estampa> deleteAllEstampas() {
//		System.out.println("Deleting All Estampas");
//
//		estampaService.deleteAllEstampas();
//		return new ResponseEntity<Estampa>(HttpStatus.NO_CONTENT);
//	}

}
