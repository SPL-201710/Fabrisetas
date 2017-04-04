package com.fabricetas.model;

import com.fabricetas.config.View;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="FACTURA")
public class Factura implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonView(View.Summary.class)
    @Id @GeneratedValue	
    @Column(name = "FACTURA_ID")
    private Integer facturaId;
	
	@JsonView(View.Summary.class)
    @Column(name = "NUMBER")
    private String number;
	
	@JsonView(View.Summary.class)
    @Column(name = "DATE")
    private Date date;
	
	@JsonView(View.Summary.class)
    @Column(name = "ITEM_PRICE")
    private String itemPrice;

	@JsonView(View.Summary.class)
    @Column(name = "TOTAL_PRICE")
    private String totalPrice;

	@ManyToOne
	@JoinColumn(name="CAMISETA_ID")
	@JsonView(View.Summary.class)
    private Camiseta camiseta;

	@ManyToOne
	@JoinColumn(name="TEMA_ID")
	@JsonView(View.Summary.class)
	private Tema tema;

	@ManyToOne
	@JoinColumn(name="ESTAMPA_ID")
	@JsonView(View.Summary.class)
	private Estampa estampa;

	public Integer getFacturaId() {
		return facturaId;
	}

	public void setFacturaId(Integer facturaId) {
		this.facturaId = facturaId;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Camiseta getCamiseta() {
		return camiseta;
	}

	public void setCamiseta(Camiseta camiseta) {
		this.camiseta = camiseta;
	}

	public Tema getTema() {
		return tema;
	}

	public void setTema(Tema tema) {
		this.tema = tema;
	}

	public Estampa getEstampa() {
		return estampa;
	}

	public void setEstampa(Estampa estampa) {
		this.estampa = estampa;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Factura factura = (Factura) o;

		return number.equals(factura.number);
	}

	@Override
	public int hashCode() {
		return number.hashCode();
	}

	@Override
	public String toString() {
		return "Factura{" +
				"facturaId=" + facturaId +
				", number='" + number + '\'' +
				", date=" + date +
				", itemPrice='" + itemPrice + '\'' +
				", totalPrice='" + totalPrice + '\'' +
				", camisetaId=" + camiseta +
				", temaId=" + tema +
				", estampaId=" + estampa +
				'}';
	}
}