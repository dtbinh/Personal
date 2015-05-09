
/** 
 *Ronald Balchand
 *109806273
 *Assignment #7
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */

import java.util.*;
import latlng.LatLng;
import java.util.ArrayList;
import com.google.code.geocoder.*;
import com.google.code.geocoder.model.*;
import java.util.Comparator;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Collections;
import java.io.IOException;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;



public class SigmaAir implements Serializable{
    private ArrayList<City> cities;
    public static final int MAX_CITIES = 100;
    private double[][] connections;
    /**
     * Default constructor for the SigmaAir class
     */
    public SigmaAir(){
        this.cities = new ArrayList<City>();
        this.connections = new double[100][100];
        for(int i = 0; i < 100; i++){
            for(int j = 0; j < 100; j++){
                this.connections[i][j] = Double.POSITIVE_INFINITY;
            }
        }
    }
    
    /**
     * Overridden constructor for the class
     * @param _cities the Arraylist of cities that exist
     * @param _connections the values of the cities to be assigned to the SigmaAir class
     */

    public SigmaAir(ArrayList<City> _cities, double[][] _connections){
        this.cities = _cities;
        this.connections = _connections;
    }
    
    /**
     * adds a new city if not already exist
     * @param city the City to be added
     */
    
    public void addCity(String city){
         String name = city;
        try{
            if(this.exists(city)){
                System.out.println("This city already is in the index");
            }
            else{
                Geocoder geocoder = new Geocoder();
                GeocoderRequest geocoderRequest;
                GeocodeResponse geocodeResponse;
                String addr;
                double lat;
                double lng;
            
                geocoderRequest = new GeocoderRequestBuilder().setAddress(name).getGeocoderRequest();
                geocodeResponse = geocoder.geocode(geocoderRequest);
                addr = geocodeResponse.getResults().get(0).getFormattedAddress();
                lat = geocodeResponse.getResults().get(0).getGeometry().getLocation().getLat().doubleValue();
                lng = geocodeResponse.getResults().get(0).getGeometry().getLocation().getLng().doubleValue();
                
                LatLng location = new LatLng(lat,lng);
                City newCity = new City(addr, location);
                
                this.cities.add(newCity);
            
                System.out.println(name + " has been added: (" + lat + ", " + lng +  ")");
            }
            
        }catch(Exception e){
            System.out.println("There was a problem");
        }
        
    }
    
    
    
    
    
    
    
    
    /**
     * if appropriate cities are given, calculate the distance between the cities, and include this entry in our adjacency table
     * @param cityFrom the initial city you are measuring from
     * @param cityTo the second city you are going to
     */
    
    public void addConnection(String cityFrom, String cityTo){
        try{
            Geocoder geocoder = new Geocoder();
            GeocoderRequest geocoderRequest;
            GeocodeResponse geocodeResponse;
            geocoderRequest = new GeocoderRequestBuilder().setAddress(cityFrom).getGeocoderRequest();
            geocodeResponse = geocoder.geocode(geocoderRequest);
        
        
            String fullfrom = geocodeResponse.getResults().get(0).getFormattedAddress();           
        
            geocoderRequest = new GeocoderRequestBuilder().setAddress(cityTo).getGeocoderRequest();
            geocodeResponse = geocoder.geocode(geocoderRequest);
            String fullTo =  geocodeResponse.getResults().get(0).getFormattedAddress();
            
        
            boolean fromfound = false;
            boolean tofound = false;
            
            int fromInt = 0;
            int toInt = 0;
            
            
            for(int i = 0; i < this.cities.size(); i++){
                City temp = this.cities.get(i);
                String tempName = temp.getName();
                if(fullfrom.equals(tempName)){
                    fromfound = true;                
                    fromInt = temp.getIndexPos();
                }
                if(fullTo.equals(tempName)){
                    tofound = true;
                    toInt = temp.getIndexPos();  
                }
            }
            
            if((fromfound == false) || (tofound == false)){
                System.out.println("This connection doesnt exist!");
            }
        
            if((fromfound == true) && (tofound == true)){
          
                City from = this.cities.get(fromInt);
                City to = this.cities.get(toInt);
                LatLng src = from.getLocation();
                LatLng dest = to.getLocation();
                double distance = LatLng.calculateDistance(src, dest);
                this.connections[fromInt][toInt] = distance;
                System.out.println(cityFrom + " --> " + cityTo + " added: \n" + distance);
            }
    
            else{
                //System.out.println("Wrong");
            }
        
        }catch(Exception ex){
            System.out.println("Error");
        }
    }
    
    
        
    public boolean exists(String city){
        boolean ans = false;
        int i = 0; 
        while(i < this.cities.size()){
            City temp = this.cities.get(i);
            String tempName = temp.getName();
            if(city.equals(tempName)){
                ans = true;
            }
            i++;
        }
        return ans;
    }
    
    
    /**
     * if appropriate cities are given, remove the entry in our adjacency table (set value to âˆž)
     * @param cityFrom the source city in the connection
     * @param cityTo the destination city in the connection
     */
    public void removeConnection(String cityFrom, String cityTo){
        try{
            Geocoder geocoder = new Geocoder();
            GeocoderRequest geocoderRequest;
            GeocodeResponse geocodeResponse;
            geocoderRequest = new GeocoderRequestBuilder().setAddress(cityFrom).getGeocoderRequest();
            geocodeResponse = geocoder.geocode(geocoderRequest);
        
        
            String fullfrom = geocodeResponse.getResults().get(0).getFormattedAddress();           
        
            geocoderRequest = new GeocoderRequestBuilder().setAddress(cityTo).getGeocoderRequest();
            geocodeResponse = geocoder.geocode(geocoderRequest);
            String fullTo =  geocodeResponse.getResults().get(0).getFormattedAddress();
            
            boolean fromfound = false;
            boolean tofound = false;
            int fromInt = 0;
            int toInt = 0;
            
            for(int i = 0; i < this.cities.size(); i++){
                City temp = this.cities.get(i);
                String tempName = temp.getName();
                if(fullfrom.equals(tempName)){
                    fromfound = true;                
                    fromInt = temp.getIndexPos();
                }
                if(fullTo.equals(tempName)){
                    tofound = true;
                    toInt = temp.getIndexPos();  
                }
            }
            
            
            if((fromfound == false) || (tofound == false)){
                System.out.println("This connection doesnt exist!");
            }
            
            if((fromfound == true) && (tofound == true) && (this.connections[fromInt][toInt] == Double.POSITIVE_INFINITY)){
                System.out.println("This connection doesn't exist");
            }
            
            if((fromfound == true) && (tofound == true) && (this.connections[fromInt][toInt] != Double.POSITIVE_INFINITY)){
                this.connections[fromInt][toInt] = Double.POSITIVE_INFINITY;
                System.out.println("Connection from " + cityFrom + " to " + cityTo + " has been removed!");
            
            }
            
        }catch(Exception ex){
            System.out.println("Error");
        }     
    }
    
    /**
     * 
     * @param cityFrom the source city  
     * @param cityTo the destination city
     * @return String the shortest path between the two cities
     */
    public String shortestPath(String cityFrom, String cityTo){
        String ans = ""; 
        try{
            if((this.exists(cityFrom) == false) ||(this.exists(cityTo))){
                System.out.println("This connection does not exist");
                ans = "";
               }
            else if(cityFrom == cityTo){
                System.out.println("Your source and destination are the same");
                ans = "";
            }
            else{
                ans = "";
            }            
        }catch (Exception ex){
            System.out.println("there was a problem");
        }
        
        return ans;
    }
    
    /**
     * displays another menu that allows the user to sort the list based on a specific field.
     * @param comp determines which way its being sorted
     */
    
    public void printAllCities(String comp){
        System.out.println("Cities:");
        System.out.println("City Name                   Latitude        Longitude");
        System.out.println("-------------------------------------------------------------");
        
        ArrayList<City> temp;
        temp = this.cities;
        
        if(comp.equals("a")){
            Collections.sort(temp, new NameComparator());
        }
        if(comp.equals("b")){
            Collections.sort(temp, new LatComparator());
        }
        if(comp.equals("c")){
            Collections.sort(temp, new LngComparator());
        }
        
        for(City city: temp){
            LatLng ll = city.getLocation();
            double d1 = ll.getLat();
            double d2 = ll.getLng();
            System.out.printf("%-25s" + "%14s" + "%15s" + "\n", city.getName(),d1, d2);
            
        }
        
    }
    
    /**
     * prints all connections available from all recorded cities 
     */
    
    public void printAllConnections(){
        System.out.println("Connections");
        System.out.println("Route                               Distance");
        System.out.println("----------------------------------------------------------");
        for(int i = 0; i < 100; i++){
            for(int j = 0; j < 100; j++){
                if(!(this.connections[i][j] == Double.POSITIVE_INFINITY)){
                    City src4 = this.cities.get(i);
                    City dest4 = this.cities.get(j);
                    String name1 = src4.getName();
                    String name2 = dest4.getName();
                    double distance = this.connections[i][j];
                    System.out.println(name1 + "  -->  " + name2 + "     " + distance);
                }
            }
        }
        
    }
    
    /**
     * parses a file and add all cities to the city list. Assume file content is correct.
     * @param filename the name of the file being parsed
     */
    public void loadAllCities(String filename)throws Exception{
        String pathname;
        pathname = "./" + filename;
        File notYet = new File(pathname);
        if(notYet.exists() == false){
            try{
                throw new Exception();
            }catch (Exception ex){
                System.out.println("the file you are looking to draw from does not exist");
            }
        }
        else{
            BufferedReader br = null;
            try{
                String currentLine;
                br = new BufferedReader(new FileReader(pathname));
                while((currentLine = br.readLine()) != null){
                    String name = currentLine;
                    this.addCity(name);
                }
            }catch (Exception ex){
                System.out.println("problem reading the file");
            }
            
        } 
    }
    
    /**
     * parses a file and add all connections to the adjacency matrix
     * @param filename 
     */
    public void loadAllConnections(String filename)throws Exception{
        String pathname;
        pathname = "./" + filename;
        File notYet = new File(pathname);
        if(notYet.exists() == false){
            try{
                throw new Exception();
            }catch (Exception ex){
                System.out.println("the file you are looking to draw from does not exist");
            }
        }
        else{
            BufferedReader br = null;
            try{
                String currentLine;
                br = new BufferedReader(new FileReader(pathname));
                while((currentLine = br.readLine()) != null){
                    String line = currentLine;
                    String[] destinations = line.split(",");
                    String src3 = destinations[0];
                    String dest3 = destinations[1];
                            
                    this.addConnection(src3, dest3);
                }
            }catch(Exception ex){
                
            }
                
        }
        
    }
   
}