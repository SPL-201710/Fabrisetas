package com.fabricetas.controller;

import com.fabricetas.dao.EstampaDao;
import com.fabricetas.model.Estampa;
import com.fabricetas.model.Factura;
import com.fabricetas.model.dto.ReportShirtDto;
import com.fabricetas.model.dto.ReportStampArtistByDateDto;
import com.fabricetas.model.dto.ReportStampArtistDto;
import com.fabricetas.service.FacturaService;
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

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReportController {

	@Autowired
	private FacturaService facturaService;

	@Autowired
	private EstampaDao estampaDao;

	// ------------ Obtener todas las Estampas vendidas por un artista en un rango de fechas -------------------

	@RequestMapping(value = "/reporte_artista_fecha/{artistaId}_{fechaInicial}_{fechaFinal}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReportStampArtistByDateDto>> listEstampasPorArtistaFecha(
			@PathVariable("artistaId") Integer artistaId, @PathVariable("fechaInicial") String fechaInicial, @PathVariable("fechaFinal") String fechaFinal) {

		List<Factura> facturasList = facturaService.findAllFacturas();
		List<ReportStampArtistByDateDto> report = new ArrayList<>();
		Date initialDate, finalDate;
		initialDate = finalDate = new Date(0);
		Integer counter, total;
		counter = total = 0;
		try {
			initialDate = new Date(new SimpleDateFormat("yyyy-MM-dd").parse(fechaInicial).getTime());
			finalDate = new Date(new SimpleDateFormat("yyyy-MM-dd").parse(fechaFinal).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}

		for (Factura factura: facturasList)
			if(factura.getEstampa() != null && factura.getEstampa().getUser().getUserId().equals(artistaId))
				if(initialDate.before(factura.getDate()) && finalDate.after(factura.getDate())) {
					total += Integer.parseInt(factura.getEstampa().getPrecio());
					counter++;
				}
		if(counter > 0)
			for (Factura factura: facturasList)
				if(factura.getEstampa() != null && factura.getEstampa().getUser().getUserId().equals(artistaId))
					if(initialDate.before(factura.getDate()) && finalDate.after(factura.getDate()))
						report.add(
							new ReportStampArtistByDateDto(
								factura.getEstampa().getNombre(),
								factura.getEstampa().getTema().getNombre(),
								factura.getEstampa().getValor(),
								counter+"",
								total+""));

		if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);

		return new ResponseEntity<>(report, HttpStatus.OK);

	}

	// ------------ Obtener todas las Estampas vendidas por un tema de artista -------------------

	@RequestMapping(value = "/reporte_artista_tema/{artistaId}_{temaId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReportStampArtistByDateDto>> listEstampasPorArtistatEMA(
			@PathVariable("artistaId") Integer artistaId, @PathVariable("temaId") Integer temaId) {

		List<Factura> facturasList = facturaService.findAllFacturas();
		List<ReportStampArtistByDateDto> report = new ArrayList<>();
		Integer counter, total;
		counter = total = 0;

		for (Factura factura: facturasList)
			if(factura.getEstampa() != null && factura.getEstampa().getUser().getUserId().equals(artistaId) && factura.getEstampa().getTema().getTemaId().equals(temaId)) {
				total += Integer.parseInt(factura.getEstampa().getPrecio());
				counter++;
			}

		if(counter > 0)
			for (Factura factura: facturasList)
				if(factura.getEstampa() != null && factura.getEstampa().getUser().getUserId().equals(artistaId) && factura.getEstampa().getTema().getTemaId().equals(temaId))
					report.add(
						new ReportStampArtistByDateDto(
							factura.getEstampa().getNombre(),
							factura.getEstampa().getTema().getNombre(),
							factura.getEstampa().getValor(),
							counter+"",
							total+""));

		if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);

		return new ResponseEntity<>(report, HttpStatus.OK);
	}

	// ------------ Obtener todas las Estampas vendidas  -------------------

	@RequestMapping(value = "/reporte_estampas", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReportStampArtistByDateDto>> listEstampas() {

		List<Factura> facturasList = facturaService.findAllFacturas();
		List<ReportStampArtistByDateDto> report = new ArrayList<>();
		Integer counter, total;
		counter = total = 0;

		for (Factura factura: facturasList)
			if(factura.getEstampa() != null) {
				total += Integer.parseInt(factura.getEstampa().getPrecio());
				counter++;
			}

		if(counter > 0)
			for (Factura factura: facturasList)
				if(factura.getEstampa() != null)
					report.add(
							new ReportStampArtistByDateDto(
									factura.getEstampa().getNombre(),
									factura.getEstampa().getTema().getNombre(),
									factura.getEstampa().getValor(),
									counter+"",
									total+""));

		if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);

		return new ResponseEntity<>(report, HttpStatus.OK);
	}

	// ------------ Obtener todas las Estampas vendidas por artista  -------------------

	@RequestMapping(value = "/reporte_estampas_{artistaId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReportStampArtistDto>> listEstampasPorArtista(@PathVariable("artistaId") Integer artistaId) {

		List<Factura> facturasList = facturaService.findAllFacturas();
		List<ReportStampArtistDto> report = new ArrayList<>();
		Integer counter, total;
		counter = total = 0;

		for (Factura factura: facturasList)
			if(factura.getEstampa() != null && factura.getEstampa().getUser().getUserId().equals(artistaId)) {
				total += Integer.parseInt(factura.getEstampa().getPrecio());
				counter++;
			}

		if(counter > 0)
			for (Factura factura: facturasList)
				if(factura.getEstampa() != null && factura.getEstampa().getUser().getUserId().equals(artistaId))
					report.add(
						new ReportStampArtistDto(
							factura.getEstampa().getUser().getName(),
							factura.getEstampa().getNombre(),
							factura.getEstampa().getTema().getNombre(),
							factura.getEstampa().getValor(),
							counter+"",
							total+""));

		if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);

		return new ResponseEntity<>(report, HttpStatus.OK);
	}

	// ------------ Obtener todas las Camisetas vendidas  -------------------

	@RequestMapping(value = "/reporte_camisetas", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReportShirtDto>> listCamisetas() {

		List<Factura> facturasList = facturaService.findAllFacturas();
		List<ReportShirtDto> report = new ArrayList<>();
		Integer counter, total;
		counter = total = 0;

		for (Factura factura: facturasList)
			if(factura.getCamiseta() != null) {
				total += Integer.parseInt(factura.getCamiseta().getValor());
				counter++;
			}

		if(counter > 0)
			for (Factura factura: facturasList)
				if(factura.getCamiseta() != null)
					report.add(
							new ReportShirtDto(
									factura.getCamiseta().getNombre(),
									factura.getCamiseta().getColor(),
									"L",/*Por ahora va quemado, tengo sueño =)*/
									factura.getCamiseta().getValor(),
									counter+"",
									total+""));

		if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);

		return new ResponseEntity<>(report, HttpStatus.OK);
	}

}
