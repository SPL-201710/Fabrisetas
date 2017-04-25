package com.fabricetas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponentsBuilder;

import com.fabricetas.domain.Invoice;
import com.fabricetas.domain.dto.InvoiceDto;
import com.fabricetas.service.InvoiceService;
import com.fabricetas.util.UtilNumber;

/**
 * Controller that responds to http requests related to a Invoice
 * Created on 14/04/2017.
 * @author belman
 * @see org.springframework.stereotype.Controller
 */
@Controller
@RequestMapping("/invoice")
public class InvoiceController {

    @Autowired
    private InvoiceService invoiceService;

    /**
     * To create a invoice
     * @param invoice for create
     * @return invoice created
     * @return ucBuilder to response htt status
     */
    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Invoice> create(@RequestBody Invoice invoice, UriComponentsBuilder ucBuilder) {
        if (!UtilNumber.isNullOrZero(invoice.getInvoiceId()))
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        return new ResponseEntity<>(invoiceService.create(invoice), HttpStatus.CREATED);
    }

    /**
     * Read all invoices
     * @return invoice list
     */
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Invoice>> findAll() {
        List<Invoice> invoices = invoiceService.findAll();
        if (invoices.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(invoices, HttpStatus.OK);
    }

    /**
     * Read a invoice by id
     * @param id of the invoice to find
     * @return found invoice
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<InvoiceDto> findOne(
            @PathVariable("id") Integer id,
            @RequestParam(value="fetch", required= false) String fetch) {
        InvoiceDto invoiceDto = invoiceService.findOneDto(id, fetch);
        if (invoiceDto == null)
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(invoiceDto, HttpStatus.OK);
    }

    /**
     * To edit a invoice
     * @param invoice to edit
     * @return edited invoice
     */
    @RequestMapping(method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Invoice> updateInvoice(@RequestBody Invoice invoice) {
        if (UtilNumber.isNullOrZero(invoice.getInvoiceId()))
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        else if(!invoiceService.exist(invoice.getInvoiceId()))
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(invoiceService.update(invoice), HttpStatus.OK);
    }

    /**
     * To remove a invoice
     * @param id of the invoice to remove
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Void> delete(@PathVariable("id") Integer id) {
        if ( !invoiceService.exist(id) )
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        invoiceService.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}