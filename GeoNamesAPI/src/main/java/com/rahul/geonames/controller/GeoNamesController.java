package com.rahul.geonames.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rahul.geonames.model.Countries;
import com.rahul.geonames.service.GeoNamesService;

@Controller
public class GeoNamesController {

	@Autowired
	private GeoNamesService geoNamesService;

    private String chosen_continent = null;
    private String chosen_countryCode = null;
    private String chosen_geonameId = null;
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String getMainDashboard(ModelMap model) {
		return "main_dashboard";
	}

	@RequestMapping(value = "/dashboard/upload", method = RequestMethod.GET)
	public String getUploadPage() {
		return "dashboard_upload";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error) {
		ModelAndView md = new ModelAndView();
		md.setViewName("home");
		return md;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout() {
		ModelAndView md = new ModelAndView();
		md.setViewName("redirect:");
		return md;
	}

    @RequestMapping(value = "/getCountries", method = RequestMethod.GET)
    @ResponseBody
    public String queryAll() {
        List<Countries> res = null;
        try {
            res = geoNamesService.listCountries();
        } catch (Exception e) {
            String retVal = "{\"status\":false, \"data\":null, \"message\":\"Error occured in fetching countries\"}";
            return retVal;
        }
        String retVal = "{\"status\":true, \"data\":" + res.toString()
                + ", \"message\":null" + "}";
        return retVal;
    }

    @RequestMapping(value = "/getCountries/{continent}", method = RequestMethod.GET)
    @ResponseBody
    public String queryContinent(@PathVariable String continent) {
        List<Countries> res = null;
        try {
            res = geoNamesService.listCountriesBycontinent(continent);
        } catch (Exception e) {

            String retVal = "{\"status\":false, \"data\":null, \"message\":\"Error occured in fetching countries for continent code : "
                    + continent + "\"}";
            return retVal;
        }
        String retVal = "{\"status\":true, \"data\":" + res.toString()
                + ", \"message\":null" + "}";
        return retVal;
    }

    @RequestMapping(value = "/getCountries/{continent}/{countryCode}", method = RequestMethod.GET)
    @ResponseBody
    public String queryContinentCountryCode(@PathVariable String continent,
            @PathVariable String countryCode) {

        List<Countries> res = null;
        try {
            res = geoNamesService.listCountriesBycontinentAndcountryCode(continent,
                    countryCode);
        } catch (Exception e) {
            String retVal = "{\"status\":false, \"data\":null, \"message\":\"Error occured in fetching countries for continent code : "
                    + continent + ", country code : " + countryCode + "\"}";
            return retVal;
        }
        String retVal = "{\"status\":true, \"data\":" + res.toString()
                + ", \"message\":null" + "}";
        return retVal;
    }

    @RequestMapping(value = "/getCountries/{continent}/{countryCode}/{geonameId}", method = RequestMethod.GET)
    @ResponseBody
    public String queryContinentCountryCodeGeoNameId(@PathVariable String continent,
            @PathVariable String countryCode, @PathVariable String geonameId) {
        List<Countries> res = null;
        try {
            res = geoNamesService.listCountriesBycontinentcountryCodeAndgeonameId(
                    continent, countryCode, geonameId);
        } catch (Exception e) {
            String retVal = "{\"status\":false, \"data\":null, \"message\":\"Error occured in fetching countries for continent code"
                    + continent
                    + ", country code : "
                    + countryCode
                    + ", geoname Id : " + geonameId + "\"}";
            return retVal;
        }
        String retVal = "{\"status\":true, \"data\":" + res.toString()
                + ", \"message\":null" + "}";
        return retVal;
    }

	@RequestMapping(value = "/dashboard/search_update", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView handleSearchUpdate(
			@RequestParam(value = "continent", required = false) String continent,
			@RequestParam(value = "countryCode", required = false) String countryCode,
			@RequestParam(value = "geonameId", required = false) String geonameId) {
	       ModelAndView md = new ModelAndView();
	        if (continent != null && countryCode != null && geonameId != null) {
	            List<Countries> res = null;
	            chosen_continent = continent; 
	            chosen_countryCode = countryCode; 
	            chosen_geonameId = geonameId; 
	            try {
	                res = geoNamesService.listCountriesBycontinentcountryCodeAndgeonameId(
	                        continent.split(" / ")[1],
	                        countryCode.split(" / ")[1],
	                        geonameId.split(" / ")[1].split("\\.")[0]);
	                System.out.println("result=="+res);
	                md.addObject("countries", res);
	                System.out.println("\nadded result to countries");

	            } catch (Exception e) {
	            }
	        }
	    md.addObject("continents", geoNamesService.getContinents());
	    md.addObject("countrieslist", geoNamesService.getCountries());
	    md.addObject("geonameIds", geoNamesService.getGeoNameIds());
		md.setViewName("dashboard");
		return md;
	}
	 @RequestMapping(value = "/dashboard/deleteCountries", method = {
	            RequestMethod.GET, RequestMethod.POST })
	    public ModelAndView handleSearchUpdate(
	            @RequestParam(value = "countryId", required = false) String countryId) {
	        ModelAndView md = new ModelAndView();
	        if (countryId != null){
	            List<Countries> res = null;
	            try {
	            	List<String> items = Arrays.asList(countryId.split("\\s*,\\s*"));
					for(String item : items)
					geoNamesService.deleteCountryByCountryId(item);
	                res = geoNamesService.listCountriesBycontinentcountryCodeAndgeonameId(
	                        chosen_continent.split(" / ")[1],
	                        chosen_countryCode.split(" / ")[1],
	                        chosen_geonameId.split(" / ")[1]);
	                System.out.println("result=="+res);
	                md.addObject("countries", res);
	                System.out.println("\nadded result to countries1");
	            } catch (Exception e) {
	            }
	        }
	        else if (countryId == null) {
	        	 List<Countries> res = null;
	             try {
	            	 res = geoNamesService.listCountriesBycontinentcountryCodeAndgeonameId(
	            			 chosen_continent.split(" / ")[1],
		                     chosen_countryCode.split(" / ")[1],
		                     chosen_geonameId.split(" / ")[1]);
		             System.out.println("result=="+res);
	                 md.addObject("countries", res);
		                System.out.println("\nadded result to countries2");

	             } catch (Exception e) {
	             }
	        }
		    md.addObject("continents", geoNamesService.getContinents());
		    md.addObject("countrieslist", geoNamesService.getCountries());
		    md.addObject("geonameIds", geoNamesService.getGeoNameIds());
			md.setViewName("dashboard");
			return md;
	    }

	@RequestMapping(value = "/dashboard/upload/save", method = RequestMethod.POST)
	public ModelAndView handleCSVUpload(@RequestParam("name") MultipartFile file) {
		 ModelAndView md = new ModelAndView();
	        String name = null;
	        if (!file.isEmpty()) {
	            try {
	                name = file.getOriginalFilename();
	                String rootPath = System.getProperty("catalina.home");
	                File dir = new File(rootPath + File.separator + "tmpFiles");
	                if (!dir.exists())
	                    dir.mkdirs();
	                File serverFile = new File(dir.getAbsolutePath()
	                        + File.separator + name);
	                String filePath = serverFile.getAbsolutePath();
	                File dest = new File(filePath);

	                try {
	                    file.transferTo(dest);
	                } catch (IllegalStateException e) {
	                    md.addObject(
	                            "message",
	                            "File Upload Failed. Please check if it is in correct format and all columns have a value.");
	                    md.setViewName("dashboard_upload");
	                    return md;
	                } catch (IOException e) {
	                    md.addObject(
	                            "message",
	                            "File Upload Failed. Please check if it is in correct format and all columns have a value.");
	                    md.setViewName("dashboard_upload");
	                    return md;
	                }

	                BufferedReader br = null;
	                try {
	                    br = new BufferedReader(new FileReader(filePath));
	                    String ln = br.readLine();
	                    while ((ln = br.readLine()) != null) {
	                        String[] str = ln.split("\\|");
	                        Countries country = new Countries();
	                        country.setCountryCode(str[0]);
	                        country.setCurrencyCode(str[1]);
	                        country.setPopulation(str[2]);
	                        country.setCapital(str[3]);
	                        country.setContinent(str[4]);
	                        country.setAreaInSqKm(str[5]);
	                        country.setLanguages(str[6]);
	                        country.setGeoNameId(str[7]);
	                        geoNamesService.addCountry(country);
	                    }
	                } catch (IOException e) {
	                    md.addObject(
	                            "message",
	                            "File Upload Failed. Please check if it is in correct format and all columns have a value.");
	                    md.setViewName("dashboard_upload");
	                    return md;
	                } finally {
	                    br.close();
	                }
	            } catch (Exception e) {
	                md.addObject(
	                        "message",
	                        "File Upload Failed. Please check if it is in correct format and all columns have a value.");
	                md.setViewName("dashboard_upload");
	                return md;
	            }
	        }
	        md.addObject("message", "File Uploaded Successfully");
	        md.setViewName("dashboard_upload");
	        return md;
	    }
}
