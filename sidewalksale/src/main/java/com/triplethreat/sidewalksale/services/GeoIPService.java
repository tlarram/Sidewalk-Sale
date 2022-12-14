package com.triplethreat.sidewalksale.services;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;

import org.springframework.stereotype.Service;

import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.model.CityResponse;
import com.triplethreat.sidewalksale.models.GeoIP;

@Service
public class GeoIPService {

	
	private DatabaseReader dbReader;
	
	 public GeoIPService() throws IOException {
	        File database = new File("C:\\Users\\samue\\OneDrive\\Desktop\\STSOCT2022\\GeoLocationbd\\GeoLite2-City.mmdb");
	        dbReader = new DatabaseReader.Builder(database).build();
	    }
	 public GeoIP getLocation(String ip) 
		      throws IOException, GeoIp2Exception {
		        InetAddress ipAddress = InetAddress.getByName(ip);
		        CityResponse response = dbReader.city(ipAddress);
		        
		        String cityName = response.getCity().getName();
		        String latitude = 
		          response.getLocation().getLatitude().toString();
		        String longitude = 
		          response.getLocation().getLongitude().toString();
		        return new GeoIP(ip, cityName, latitude, longitude);
	}
	 
	//public GeoIP saveLocation(String ip) throws IOException, GeoIp2Exception {
	//	        InetAddress ipAddress = InetAddress.getByName(ip);
	//	        CityResponse response = dbReader.city(ipAddress);
	//	        
	//	        String cityName = response.getCity().getName();
	//	        String latitude = 
	//	          response.getLocation().getLatitude().toString();
	//	        String longitude = 
	//	          response.getLocation().getLongitude().toString();
	//	        GeoIP newGeoIP = new GeoIP(ip, cityName, latitude, longitude);
	//	        return GeoRepo.save(newGeoIP);
	// }
	 
}
