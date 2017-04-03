package com.fabricetas.model;

import com.fabricetas.config.View;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;

import javax.persistence.*;
import javax.swing.*;
import java.awt.*;
import java.io.OutputStream;
import java.io.Serializable;

@Entity
@Table(name="FILE")
public class PersistentFile implements Serializable {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="FILE_ID")
	private Integer fileId;

	@Lob @Basic(fetch = FetchType.LAZY)
	@Column(name="CONTENT")
	private byte[] content;

	@Transient
	private String image;

	@Column(name="DESCRIPTION")
	private String description;

	@Column(name="NAME")
	private String name;

	@Column(name="PATH")
	private String path;

	@Column(name="TYPE")
	private String type;

	@ManyToOne
	@JsonView(View.Summary.class)
	@JoinColumn(name = "USER_ID")
	private User user;

	@ManyToOne
	@JsonIgnore
	@JsonView(View.Summary.class)
	@JoinColumn(name = "CAMISETA_ID")
	private Camiseta camiseta;

	@ManyToOne
	@JsonView(View.Summary.class)
	@JoinColumn(name = "ESTAMPA_ID")
	private Estampa estampa;

	@ManyToOne
	@JsonView(View.Summary.class)
	@JoinColumn(name = "TEMA_ID")
	private Tema tema;

	public Integer getFileId() {
		return fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public String getImage() { return image; }

	public void setImage(String image) { this.image = image; }

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Camiseta getCamiseta() {
		return camiseta;
	}

	public void setCamiseta(Camiseta camiseta) {
		this.camiseta = camiseta;
	}

	public Estampa getEstampa() {
		return estampa;
	}

	public void setEstampa(Estampa estampa) {
		this.estampa = estampa;
	}

	public Tema getTema() {
		return tema;
	}

	public void setTema(Tema tema) {
		this.tema = tema;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		PersistentFile that = (PersistentFile) o;
		return fileId.equals(that.fileId);
	}

	@Override
	public int hashCode() {
		return fileId.hashCode();
	}

	@Override
	public String toString() {
		return "PersistentFile{" +
				"fileId=" + fileId +
				", description='" + description + '\'' +
				", name='" + name + '\'' +
				", path='" + path + '\'' +
				", type='" + type + '\'' +
				'}';
	}

}
