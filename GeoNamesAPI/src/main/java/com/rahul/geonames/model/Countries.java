package com.rahul.geonames.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Countries {

	@Id
    private String countryId;
   
    private String continent,countryCode;
    private String geonameId;
    private String capital, currencyCode,languages;
    private String population, areaInSqKm;

    public String getCountryId() {
        return countryId;
    }

    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }

    
    public String getContinent() {
  	  return continent;
 	}
  
 	public void setContinent(String continent) {
 		this.continent = continent;
 	}

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }
    
    public String getGeoNameId() {
        return geonameId;
    }

    public void setGeoNameId(String geonameId) {
        this.geonameId = geonameId;
    }
    
    public String getCapital() {
        return capital;
    }

    public void setCapital(String capital) {
        this.capital = capital;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }
    
    public String getLanguages() {
        return languages;
    }

    public void setLanguages(String languages) {
        this.languages = languages;
    }
    
    public String getPopulation() {
        return population;
    }

    public void setPopulation(String population) {
        this.population = population;
    }
    
    public String getAreaInSqKm() {
        return areaInSqKm;
    }

    public void setAreaInSqKm(String areaInSqKm) {
        this.areaInSqKm = areaInSqKm;
    }

    @Override
    public String toString() {
        return "{\"continent\":\"" + continent + "\", \"countryCode\":\"" + countryCode
                + "\", \"geonameId\":\"" + geonameId + "\", \"capital\":\"" + capital
                + "\", \"currencyCode\":\"" + currencyCode + "\", \"languages\":\"" + languages
                + "\", \"population\":\"" + population + "\", \"areaInSqKm\":\"" + areaInSqKm + "\"}";
    }
}