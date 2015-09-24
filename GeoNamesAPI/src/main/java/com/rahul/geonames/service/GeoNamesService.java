package com.rahul.geonames.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.mongodb.DBObject;
import com.rahul.geonames.model.Countries;

@Repository
public class GeoNamesService {

  @Autowired
  protected MongoTemplate mongoTemplate;
  
    public static final String COLLECTION_NAME = "countries";

    public void addCountry(Countries country) {
     if (!mongoTemplate.collectionExists(Countries.class)) {
          mongoTemplate.createCollection(Countries.class);
        }
       String q = "{continent : \"" + country.getContinent() + "\", countryCode : \""
                + country.getCountryCode() + "\", geonameId : \"" + country.getGeoNameId()
                + "\", areaInSqKm : \"" + country.getAreaInSqKm() + "\"}";
        BasicQuery query = new BasicQuery(q);
        long queryResCount = mongoTemplate.count(query, Countries.class);
        if (queryResCount == 0) {
        	country.setCountryId(UUID.randomUUID().toString());
            mongoTemplate.insert(country, COLLECTION_NAME);
        } else {
            Update update = new Update().set("capital", country.getCapital())
            		.set("currencyCode", country.getCurrencyCode())
                    .set("languages", country.getLanguages())
                    .set("population", country.getPopulation());
            mongoTemplate.upsert(query, update, Countries.class);
        }
    }

    public List<Countries> listCountries() {
        return mongoTemplate.findAll(Countries.class, COLLECTION_NAME);
    }

    public List<Countries> listCountriesBycontinent(String continent) {
        String q = "{continent : \"" + continent + "\"}";
        return mongoTemplate.find(new BasicQuery(q), Countries.class);
    }

    public List<Countries> listCountriesBycontinentAndcountryCode(String continent,
            String countryCode) {
        String q = "{continent : \"" + continent + "\", countryCode : \"" + countryCode
                + "\"}";
        return mongoTemplate.find(new BasicQuery(q), Countries.class);
    }

    public List<Countries> listCountriesBycontinentcountryCodeAndgeonameId(
    		String continent, String countryCode, String geonameId) {
        String q = "{continent : \"" + continent + "\", countryCode : \"" + countryCode
                + "\", geonameId : \"" + geonameId + "\"}";
        System.out.println("query=="+q);
        return mongoTemplate.find(new BasicQuery(q), Countries.class);
    }

    public void deleteCountries(Countries country) {
      mongoTemplate.remove(country, COLLECTION_NAME);
    }
    
    public void deleteCountryByCountryId(String countryId) {
        mongoTemplate.remove(new Query(Criteria.where("_id").is(countryId)), Countries.class);
      }

    public List<String> getContinents() {
        List<DBObject> ls = mongoTemplate.getCollection("continentMapping")
                .find().toArray();
        List<String> res = new ArrayList<String>();
        for (DBObject dbo : ls) {
            String obj = dbo.get("continentName").toString()
                    + " / "
                    + dbo.get("continent")
                            .toString();
            res.add(obj);
        }
        return res;
    }

    public List<String> getCountries() {
        List<DBObject> ls = mongoTemplate.getCollection("countryMapping").find()
                .toArray();
        List<String> res = new ArrayList<String>();
        for (DBObject dbo : ls) {
            String obj = dbo.get("countryName").toString()
                    + " / "
                    + dbo.get("countryCode").toString();
            res.add(obj);
        }
        return res;
    }

    public List<String> getGeoNameIds() {
        List<DBObject> ls = mongoTemplate.getCollection("geoNameMapping").find()
                .toArray();
        List<String> res = new ArrayList<String>();
        for (DBObject dbo : ls) {
            String obj = dbo.get("countryName").toString() + " / "
                    + dbo.get("geonameId").toString();
            res.add(obj);
        }
        return res;
    }
}