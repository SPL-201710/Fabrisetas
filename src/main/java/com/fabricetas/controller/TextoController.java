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
import com.fabricetas.dao.TextoDao;
import com.fabricetas.model.Texto;
import com.fasterxml.jackson.annotation.JsonView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TextoController {

	@Autowired
	private TextoDao textoDao;
	
//	@Autowired
//	private TextoService textoService;

	// ------------------- Obtener todos los usuarios --------------------------------------------------------

	@JsonView(View.Summary.class)
	@RequestMapping(value = "/texto", method = RequestMethod.GET)
	public ResponseEntity<List<Texto>> listAllTextos() {
//		 List<Texto> textos = textoService.listAllTextos();
		List<Texto> textos = textoDao.list();
		
		if (textos.isEmpty()) {
			return new ResponseEntity<List<Texto>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Texto>>(textos, HttpStatus.OK);
	}

	// ------------------- Obtener un usuario --------------------------------------------------------

	@RequestMapping(value = "/texto/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Texto> getTexto(@PathVariable("id") long id) {
		System.out.println("Fetching Texto with id " + id);
		Texto texto = textoDao.get(Integer.parseInt(id + ""));
		if (texto == null) {
			System.out.println("Texto with id " + id + " not found");
			return new ResponseEntity<Texto>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Texto>(texto, HttpStatus.OK);
	}

	// ------------------- Crear un usuario --------------------------------------------------------

	@RequestMapping(value = "/texto", method = RequestMethod.POST)
	public ResponseEntity<Void> createTexto(@RequestBody Texto texto, UriComponentsBuilder ucBuilder) {
		System.out.println("Creating Texto " + texto.getTitulo());

		if (textoDao.get(texto.getTextoId()) != null) {
			System.out.println("A Texto with name " + texto.getTitulo()
					+ " already exist");
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}

		textoDao.saveOrUpdate(texto);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/texto/{id}")
				.buildAndExpand(texto.getTextoId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	// ------------------- Actualizar un usuario --------------------------------------------------------

	@RequestMapping(value = "/texto/{id}", method = RequestMethod.PUT)
	public ResponseEntity<Texto> updateTexto(@PathVariable("id") long id,
			@RequestBody Texto texto) {
		System.out.println("Updating Texto " + id);

		Texto currentTexto = textoDao.get(Integer.parseInt(id + ""));

		if (currentTexto == null) {
			System.out.println("Texto with id " + id + " not found");
			return new ResponseEntity<Texto>(HttpStatus.NOT_FOUND);
		}

		currentTexto.setTitulo(texto.getTitulo());
		currentTexto.setColor(texto.getColor());

		textoDao.saveOrUpdate(currentTexto);
		return new ResponseEntity<Texto>(currentTexto, HttpStatus.OK);
	}

	// ------------------- Borrar un Usuario --------------------------------------------------------

	@RequestMapping(value = "/texto/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Texto> deleteTexto(@PathVariable("id") long id) {
		System.out.println("Fetching & Deleting Texto with id " + id);

		Texto texto = textoDao.get(Integer.parseInt(id + ""));
		if (texto == null) {
			System.out.println("Unable to delete. Texto with id " + id
					+ " not found");
			return new ResponseEntity<Texto>(HttpStatus.NOT_FOUND);
		}

		textoDao.delete(Integer.parseInt(id + ""));
		return new ResponseEntity<Texto>(HttpStatus.NO_CONTENT);
	}

	// ------------------- Borrar todos los usuarios --------------------------------------------------------

//	@RequestMapping(value = "/texto", method = RequestMethod.DELETE)
//	public ResponseEntity<Texto> deleteAllTextos() {
//		System.out.println("Deleting All Textos");
//
//		textoService.deleteAllTextos();
//		return new ResponseEntity<Texto>(HttpStatus.NO_CONTENT);
//	}

}
