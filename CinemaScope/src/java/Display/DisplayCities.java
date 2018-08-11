package Display;


import com.mongodb.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import java.util.*;
import org.bson.Document;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Bugs
 */
public class DisplayCities {
    public ArrayList<DBObject> func()
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Cities");
        ArrayList<DBObject> cities = new ArrayList<DBObject>();
        BasicDBObject allQuery = new BasicDBObject();
        BasicDBObject fields = new BasicDBObject();
        fields.put("city", 1);
        DBCursor cursor = collection.find(allQuery, fields);
        cursor.sort(new BasicDBObject("city", 1));
        while (cursor.hasNext()) {
            cities.add(cursor.next());
        }
        return cities;
    }
    
    public List func5()
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Cities");
        List states = collection.distinct("state");
        java.util.Collections.sort(states);
        return states;
    }
    
}
