/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Display;

import com.mongodb.*;
import java.util.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Bugs
 */
public class DisplayAccount {
    
    public DBObject func16(HttpServletRequest request)
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Users");
        HttpSession session = request.getSession(false);
        String email = (String)session.getAttribute("email");
        BasicDBObject search = new BasicDBObject();
        search.put("emailid", email);
        DBCursor c = collection.find(search);
        BasicDBObject obj = new BasicDBObject();
        if(c.hasNext()) 
        {
            obj = (BasicDBObject)c.next();
        }
        DBObject x = (DBObject)obj;
        return x;
    }
    
    public ArrayList<DBObject> func17(HttpServletRequest request)
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Bookings");
        HttpSession session = request.getSession(false);
        String user = (String)session.getAttribute("name");
        ArrayList<DBObject> list = new ArrayList<DBObject>();
        BasicDBObject search = new BasicDBObject();
        search.put("username", user);
        DBCursor c = collection.find(search);
        while(c.hasNext()) 
        {
            DBObject obj = c.next();
            list.add(obj);
        }
        return list;
    }
    
}
