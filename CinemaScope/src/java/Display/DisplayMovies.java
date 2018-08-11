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
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
/**
 *
 * @author Bugs
 */
public class DisplayMovies {
    public ArrayList<DBObject> func2(String city)
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Movies");
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
                    mov.add(obj);
                }
            }
        }
        return mov;
    }
    
}
