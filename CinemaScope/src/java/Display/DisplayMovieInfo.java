/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Display;

import com.mongodb.*;
import java.util.*;

/**
 *
 * @author Bugs
 */
public class DisplayMovieInfo {
    public DBObject func3(String movie)
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Movies");
        BasicDBObject search = new BasicDBObject();
        search.put("_id", movie);
        DBCursor cursor = collection.find(search);
        DBObject y = cursor.next();
        return y;
    }
}
