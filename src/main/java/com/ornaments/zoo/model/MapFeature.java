package com.ornaments.zoo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.*;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import java.io.Serializable;

import java.math.BigDecimal;

@Entity
public class MapFeature implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String description;

    private String name;

    @Enumerated(EnumType.STRING)
    private AnimalCategory category;

    private String googlePlaceId;

    private BigDecimal longitude;

    private BigDecimal latitude;

//    @GeneratedValue
    @Column(insertable = false, updatable = false)
    private  java.sql.Timestamp createTimestamp;

//    @GeneratedValue
    @Column(insertable = false, updatable = false)
    private  java.sql.Timestamp modifyTimestamp;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public String getGooglePlaceId() {
        return googlePlaceId;
    }

    public void setGooglePlaceId(String googlePlaceId) {
        this.googlePlaceId = googlePlaceId;
    }


    public java.sql.Timestamp getCreateTimestamp() {
        return createTimestamp;
    }

    public void setCreateTimestamp(java.sql.Timestamp createTimestamp) {
        this.createTimestamp = createTimestamp;
    }


    public java.sql.Timestamp getModifyTimestamp() {
        return modifyTimestamp;
    }

    public void setModifyTimestamp(java.sql.Timestamp modifyTimestamp) {
        this.modifyTimestamp = modifyTimestamp;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public AnimalCategory getCategory() {
        return category;
    }

    public void setCategory(AnimalCategory category) {
        this.category = category;
    }

}
