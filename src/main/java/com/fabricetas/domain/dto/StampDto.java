package com.fabricetas.domain.dto;

import java.util.Collection;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import com.fabricetas.domain.Color;
import com.fabricetas.domain.Invoice;
import com.fabricetas.domain.PersistentFile;
import com.fabricetas.domain.Rating;
import com.fabricetas.domain.Text;
import com.fabricetas.domain.Theme;
import com.fabricetas.domain.Tshirt;
import com.fabricetas.domain.User;

/**
 * Entity that models a stamp for view layer
 * Created on 20/04/2017.
 * @author belman
 */
@ToString
@EqualsAndHashCode(exclude={"stampId"})
public class StampDto {

    @Getter @Setter
    private Integer stampId;

    @Getter @Setter
    private String description;

    @Getter @Setter
    private String name;

    @Getter @Setter
    private String path;

    @Getter @Setter
    private String price;

    @Getter @Setter
    private Collection<Color> color;

    @Getter @Setter
    private Collection<Invoice> invoice;

    @Getter @Setter
    private Collection<PersistentFile> persistentFile;

    @Getter @Setter
    private Collection<Rating> rating;

    @Getter @Setter
    private Collection<Text> text;

    @Getter @Setter
    private Theme theme;

    @Getter @Setter
    private Collection<Tshirt> tshirt;

    @Getter @Setter
    private User user;

    public StampDto(String description, String name, String path, String price, Integer stampId) {
        this.description = description; this.name = name;
        this.path = path; this.price = price; this.stampId = stampId;
    }
}
