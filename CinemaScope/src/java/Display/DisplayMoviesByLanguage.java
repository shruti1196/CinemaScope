/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Display;
import com.mongodb.*;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
/**
 *
 * @author Bugs
 */
public class DisplayMoviesByLanguage {
    public ArrayList<DBObject> func8(String l, HttpServletRequest request)
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Movies");
        HttpSession session = request.getSession(false);
        String city = (String)session.getAttribute("city");  
        DBCursor cursor = collection.find();
        ArrayList<DBObject> mov = new ArrayList<DBObject>();
        while(cursor.hasNext())
        {
            DBObject obj = cursor.next();
            ArrayList<String> nowshowing = (ArrayList<String>)obj.get("nowshowingin");
            if(obj.get("nowshowingin")!=null)
            {
                if(nowshowing.indexOf(city)!=-1) 
                {
                    if(obj.get("language")!=null)
                    {
                        ArrayList<String> lang = (ArrayList<String>)obj.get("language");
                        if(lang.indexOf(l)!=-1) 
                        {
                            mov.add(obj);
                        }
                    }
                }
            }
        }
        return mov;
    }
    
    public ArrayList<String> func9(HttpServletRequest request)
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Movies");
        HttpSession session = request.getSession(false);
        String city = (String)session.getAttribute("city");  
        DBCursor cursor = collection.find();
        ArrayList<String> lang_list = new ArrayList<String>();
        while(cursor.hasNext())
        {
            DBObject obj = cursor.next();
            ArrayList<String> nowshowing = (ArrayList<String>)obj.get("nowshowingin");
            if(obj.get("nowshowingin")!=null)
            {
                if(nowshowing.indexOf(city)!=-1) 
                {
                    if(obj.get("language")!=null)
                    {
                        ArrayList<String> lan = (ArrayList<String>) obj.get("language");
                        for(String l: lan)
                        {
                            if(lang_list.indexOf(l)==-1)
                                lang_list.add(l);
                        }
                    }
                }
            }
        }
        Collections.sort(lang_list);
        return lang_list;
    }
    
}
