package com.fabricetas.domain.dto.view;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * Entity that models a Stamp for home view
 * Created on 06/05/2017.
 * @author belman
 */
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class StampForHomeDto {

    @Getter @Setter
    private String estampaId;

    @Getter @Setter
    private String nombre;

    @Getter @Setter
    private String descripcion;

    @Getter @Setter
    private String urlImagen;

    @Getter @Setter
    private String rating;

    @Getter @Setter
    private String valor;

    @Getter @Setter
    private String temaId;

    @Getter @Setter
    private String temaNombre;

    @Getter @Setter
    private String autorId;

    @Getter @Setter
    private String autorNombre;
    
}
