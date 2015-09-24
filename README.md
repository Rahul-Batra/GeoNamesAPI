# GeoNamesAPI
 With GeoNames API you can get access to countries details for various continents and countries code.

To access the data you just send a HTTP-request to address: https://localhost:8080/geonames/getCountries/{continent}/{countryCode}/{geonameId}

Sample request : https://localhost:8080/geonames/getCountries/EU/AD/3041565

This call returns a JSON object with one of the following results:

If there are no countries than response will be:
{"result": "No countries found"}
Else:
{"result": [{"continent": continent, "countryCode": countryCode, "geonameId": geonameId, "capital": capital,   "currencyCode": currencyCode, "languages": languages, "population": population, "areaInSqKm": areaInSqKm }]}

GeoNamesAPI also provides a Dashboard built using bootstrap that allows to upload csv separated by pipe ("|"), and having a specified format which can be seen from the attached sample naming "countries.csv"
It also allows to search and delete apecific plans based on continent code, country code and geoname Id

The dashboard can be accessed by -
https://localhost:8080/geonames

The login credentials are set in spring-security.xml. By default the credentials are -
username-admin
password-admin

The backend is MongoDB, the mongo credentials are set in servlet-context.xml. After setting up the Mongo environment execute ContinentMapping.txt, CountryMapping.txt and GeoNameMapping.txt

Technology: Springs MVC, MongoDB, Maven, Bootstrap, Spring Security, HTML, CSS, JS


