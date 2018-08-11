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
import org.bson.types.ObjectId;

/**
 *
 * @author Bugs
 */
public class DisplayTicket {
    public String movie;
    public String day;
    public String time;
    public List<Integer> seats;
    public Double price;
    public String venue;
    public void func15(HttpServletRequest request)
    {
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Shows");
        DBCollection collection2 = db.getCollection("Bookings");
        HttpSession session = request.getSession(false);
        if(session.getAttribute("locality")!=null) 
        {
            String user = (String)session.getAttribute("name");
            String city = (String)session.getAttribute("city");
            String theater = (String)session.getAttribute("theater");
            String locality = (String)session.getAttribute("locality");
            movie = (String)session.getAttribute("movie");
            day = (String)session.getAttribute("day");
            time = (String)session.getAttribute("time");
            venue = theater + ", " + locality + ", "+ city;
            BasicDBObject search = new BasicDBObject();
            search.put("movie", movie);
            search.put("city", city);
            search.put("theatre", theater);
            search.put("locality", locality);
            search.put("day", day);
            search.put("timeofstart", time);
            DBCursor c = collection.find(search);
            if(c.hasNext()) 
            {
                DBObject show = c.next();
                ObjectId showid = (ObjectId)show.get("_id");
                BasicDBObject search2 = new BasicDBObject();
                search2.put("showid", showid);
                search2.put("username", user);
                DBCursor c2 = collection2.find(search2);
                if(c2.hasNext()) 
                {
                    DBObject booking = c2.next();
                    price = (Double)booking.get("totalprice");
                    seats = (List<Integer>)booking.get("bookedseats");
                }
            }
        }
        else 
        {
            String user = (String)session.getAttribute("name");
            String city = (String)session.getAttribute("city");
            String theater = (String)session.getAttribute("theater");
            movie = (String)session.getAttribute("movie");
            day = (String)session.getAttribute("day");
            time = (String)session.getAttribute("time");
            venue = theater + ", " + city;
            BasicDBObject search = new BasicDBObject();
            search.put("movie", movie);
            search.put("city", city);
            search.put("theatre", theater);
            search.put("day", day);
            search.put("timeofstart", time);
            DBCursor c = collection.find(search);
            if(c.hasNext()) 
            {
                DBObject show = c.next();
                ObjectId showid = (ObjectId)show.get("_id");
                BasicDBObject search2 = new BasicDBObject();
                search2.put("showid", showid);
                search2.put("username", user);
                DBCursor c2 = collection2.find(search2);
                if(c2.hasNext()) 
                {
                    DBObject booking = c2.next();
                    price = (Double)booking.get("totalprice");
                    seats = (List<Integer>)booking.get("bookedseats");
                }
            }
        }
        
    }
}
