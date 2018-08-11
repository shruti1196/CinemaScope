/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import com.mongodb.*;
import java.util.*;

/**
 *
 * @author Bugs
 */
public class Add {
    public void add1()
    {      
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Users");
        for(int i=1; i<=943; i++)
        {
            String u = "User "+i;
            BasicDBObject obj = new BasicDBObject("name", u);
            collection.insert(obj);
        }
    }
    public void add2()
    {      
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Movies");
        for(int i=1; i<=1682; i++)
        {
            String m = "Movie "+i;
            BasicDBObject obj = new BasicDBObject("_id", m);
            collection.insert(obj);
        }
    }
    public void update()
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Users");
        for(int i=1; i<=943; i++)
        {
            BasicDBObject search = new BasicDBObject();
            String u = "User "+i;
            String e = "user"+i+"@gmail.com";
            String p = "user"+i;
            search.put("name", u);
            BasicDBObject update = new BasicDBObject();
            update.put("emailid", e);
            update.put("password", p);
            collection.update(search, new BasicDBObject("$set", update));
        }
    }
    
    public static void main(String args[])
    {
        Add a = new Add();
        //a.update();
    }
    
}
