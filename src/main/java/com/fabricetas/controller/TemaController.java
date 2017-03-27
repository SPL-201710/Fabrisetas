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
import com.fabricetas.dao.TemaDao;
import com.fabricetas.model.Tema;
import com.fasterxml.jackson.annotation.JsonView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TemaController {

	@Autowired
	private TemaDao temaDao;
	
//	@Autowired
//	private TemaService temaService;

	// ------------------- Obtener todos los usuarios --------------------------------------------------------

	@JsonView(View.Summary.class)
	@RequestMapping(value = "/tema", method = RequestMethod.GET)
	public ResponseEntity<List<Tema>> listAllTemas() {
//		 List<Tema> temas = temaService.listAllTemas();
		List<Tema> temas = temaDao.list();
		
		if (temas.isEmpty()) {
			return new ResponseEntity<List<Tema>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Tema>>(temas, HttpStatus.OK);
	}

	// ------------------- Obtener un usuario --------------------------------------------------------

	@RequestMapping(value = "/tema/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Tema> getTema(@PathVariable("id") long id) {
		System.out.println("Fetching Tema with id " + id);
		Tema tema = temaDao.get(Integer.parseInt(id + ""));
		if (tema == null) {
			System.out.println("Tema with id " + id + " not found");
			return new ResponseEntity<Tema>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Tema>(tema, HttpStatus.OK);
	}

	// ------------------- Crear un usuario --------------------------------------------------------

	@RequestMapping(value = "/tema", method = RequestMethod.POST)
	public ResponseEntity<Void> createTema(@RequestBody Tema tema,
			UriComponentsBuilder ucBuilder) {
		System.out.println("Creating Tema " + tema.getNombre());

		if (temaDao.get(tema.getTemaId()) != null) {
			System.out.println("A Tema with name " + tema.getNombre()
					+ " already exist");
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}

		temaDao.saveOrUpdate(tema);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/tema/{id}")
				.buildAndExpand(tema.getTemaId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	// ------------------- Actualizar un usuario --------------------------------------------------------

	@RequestMapping(value = "/tema/{id}", method = RequestMethod.PUT)
	public ResponseEntity<Tema> updateTema(@PathVariable("id") long id,
			@RequestBody Tema tema) {
		System.out.println("Updating Tema " + id);

		Tema currentTema = temaDao.get(Integer.parseInt(id + ""));

		if (currentTema == null) {
			System.out.println("Tema with id " + id + " not found");
			return new ResponseEntity<Tema>(HttpStatus.NOT_FOUND);
		}

		currentTema.setNombre(tema.getNombre());
		currentTema.setDescripcion(tema.getDescripcion());
		currentTema.setUrlTema(tema.getUrlTema());

		temaDao.saveOrUpdate(currentTema);
		return new ResponseEntity<Tema>(currentTema, HttpStatus.OK);
	}

	// ------------------- Borrar un Usuario --------------------------------------------------------

	@RequestMapping(value = "/tema/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Tema> deleteTema(@PathVariable("id") long id) {
		System.out.println("Fetching & Deleting Tema with id " + id);

		Tema tema = temaDao.get(Integer.parseInt(id + ""));
		if (tema == null) {
			System.out.println("Unable to delete. Tema with id " + id
					+ " not found");
			return new ResponseEntity<Tema>(HttpStatus.NOT_FOUND);
		}

		temaDao.delete(Integer.parseInt(id + ""));
		return new ResponseEntity<Tema>(HttpStatus.NO_CONTENT);
	}

	// ------------------- Borrar todos los usuarios --------------------------------------------------------

//	@RequestMapping(value = "/tema", method = RequestMethod.DELETE)
//	public ResponseEntity<Tema> deleteAllTemas() {
//		System.out.println("Deleting All Temas");
//
//		temaService.deleteAllTemas();
//		return new ResponseEntity<Tema>(HttpStatus.NO_CONTENT);
//	}

}
