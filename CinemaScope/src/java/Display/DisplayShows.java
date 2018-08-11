/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Display;

import com.mongodb.*;
import java.util.ArrayList;

/**
 *
 * @author Bugs
 */
public class DisplayShows {
    public ArrayList<DBObject> func10(String city, String movie) 
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Shows");
        ArrayList<DBObject> shows=new ArrayList<DBObject>();
        BasicDBObject search = new BasicDBObject();
        search.put("movie", movie);
        search.put("city", city);
        DBCursor cursor = collection.find(search);
        while(cursor.hasNext()){
            shows.add(cursor.next());
        }
        return shows;
    }
    
    public ArrayList<DBObject> func11(String city, String movie, String theater, String locality) 
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Shows");
        ArrayList<DBObject> shows=new ArrayList<DBObject>();
        BasicDBObject search = new BasicDBObject();
        search.put("movie", movie);
        search.put("city", city);
        search.put("theatre", theater);
        search.put("locality", locality);
        DBCursor cursor = collection.find(search);
        while(cursor.hasNext()){
            shows.add(cursor.next());
        }
        return shows;
    }
    
    public ArrayList<DBObject> func12(String city, String movie, String theater) 
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Shows");
        ArrayList<DBObject> shows=new ArrayList<DBObject>();
        BasicDBObject search = new BasicDBObject();
        search.put("movie", movie);
        search.put("city", city);
        search.put("theatre", theater);
        DBCursor cursor = collection.find(search);
        while(cursor.hasNext()){
            shows.add(cursor.next());
        }
        return shows;
    }
    
    public BasicDBObject func13(String city, String movie, String theater, String locality, String day, String time) 
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Shows");
        BasicDBObject search = new BasicDBObject();
        BasicDBObject show = new BasicDBObject();
        search.put("movie", movie);
        search.put("city", city);
        search.put("theatre", theater);
        search.put("locality", locality);
        search.put("day", day);
        search.put("timeofstart", time);
        DBCursor cursor = collection.find(search);
        if(cursor.hasNext()){
            show = (BasicDBObject)cursor.next();
        }
        return show;
    }
    
    public BasicDBObject func14(String city, String movie, String theater, String day, String time) 
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Shows");
        BasicDBObject search = new BasicDBObject();
        BasicDBObject show = new BasicDBObject();
        search.put("movie", movie);
        search.put("city", city);
        search.put("theatre", theater);
        search.put("day", day);
        search.put("timeofstart", time);
        DBCursor cursor = collection.find(search);
        if(cursor.hasNext()){
            show = (BasicDBObject)cursor.next();
        }
        return show;
    }
}
    
    