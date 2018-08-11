/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.mongodb.*;
import org.bson.types.ObjectId;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bugs
 */
@WebServlet(urlPatterns = {"/BookServlet3"})
public class BookServlet3 extends HttpServlet 
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();    
            ArrayList<Integer> bookedseats = new ArrayList<>();
            for(int i=1; i<=258; i++) 
            {
                String s = "s" + i;
                if ("yes".equals(request.getParameter(s))) 
                {
                    bookedseats.add(i);
                } 
                else 
                {

                }
            }
            double price = 0;
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("CinemaScope");
            DBCollection collection = db.getCollection("Shows");
            DBCollection collection2 = db.getCollection("Bookings");
            HttpSession session = request.getSession(false);
            if(session.getAttribute("locality")!=null)
            {
                DBObject search = new BasicDBObject();
                String user = (String)session.getAttribute("name");
                String movie = (String)session.getAttribute("movie");
                String city = (String)session.getAttribute("city");
                String theater = (String)session.getAttribute("theater");
                String locality = (String)session.getAttribute("locality");
                String day = (String)session.getAttribute("day");
                String time = (String)session.getAttribute("time");
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
                    List<String> floorplan = (List)show.get("floorplan");
                    for(int i = 0; i < bookedseats.size(); i++) 
                    {
                        if("p".equals(floorplan.get(bookedseats.get(i)))) 
                        {
                            price += (double) show.get("price") + (double)(((double) show.get("price") * (int)40) / (int)100);
                        } 
                        else if("g".equals(floorplan.get(bookedseats.get(i)))) 
                        {
                            price += (double) show.get("price") + (double)(((double) show.get("price") * (int)20) / (int)100);
                        } 
                        else if("s".equals(floorplan.get(bookedseats.get(i)))) 
                        {
                            price += (double) show.get("price");
                        }
                        floorplan.set(bookedseats.get(i), "b");
                    }
                    String offer = (String)session.getAttribute("offer");
                    if(offer.equals("yes"))
                    {
                        price = 0.8 * price;
                    }
                    ObjectId showid = (ObjectId)show.get("_id");
                    BasicDBObject find = new BasicDBObject("_id", showid);
                    BasicDBObject set = new BasicDBObject("$set",new BasicDBObject("floorplan", floorplan));
                    collection.update(find, set);
                    BasicDBObject obj = new BasicDBObject("showid", showid).append("username", user).append("dateofbooking", day).append("totalprice", price).append("bookedseats", bookedseats);
                    collection2.insert(obj);
                }
                out.print("<center><font size=\"4\" color=\"white\" class=\"w3-wide\">Thanks for Booking!</font></center>");
                RequestDispatcher rd = request.getRequestDispatcher("ticket.jsp");
                rd.include(request, response);
            }
            else
            {
                DBObject search = new BasicDBObject();
                String user = (String)session.getAttribute("name");
                String movie = (String)session.getAttribute("movie");
                String city = (String)session.getAttribute("city");
                String theater = (String)session.getAttribute("theater");
                String day = (String)session.getAttribute("day");
                String time = (String)session.getAttribute("time");
                search.put("movie", movie);
                search.put("city", city);
                search.put("theatre", theater);
                search.put("day", day);
                search.put("timeofstart", time);
                DBCursor c = collection.find(search);
                if(c.hasNext()) 
                {
                    DBObject show = c.next();
                    List<String> floorplan = (List)show.get("floorplan");
                    for(int i = 0; i < bookedseats.size(); i++) 
                    {
                        if("p".equals(floorplan.get(bookedseats.get(i)))) 
                        {
                            price += (double) show.get("price") + (double)(((double) show.get("price") * (int)40) / (int)100);
                        } 
                        else if("g".equals(floorplan.get(bookedseats.get(i)))) 
                        {
                            price += (double) show.get("price") + (double)(((double) show.get("price") * (int)20) / (int)100);
                        } 
                        else if("s".equals(floorplan.get(bookedseats.get(i)))) 
                        {
                            price += (double) show.get("price");
                        }
                        floorplan.set(bookedseats.get(i), "b");
                    }
                    String offer = (String)session.getAttribute("offer");
                    if(offer.equals("yes"))
                    {
                        price = 0.8 * price;
                    }
                    ObjectId showid = (ObjectId)show.get("_id");
                    BasicDBObject find = new BasicDBObject("_id", showid);
                    BasicDBObject set = new BasicDBObject("$set",new BasicDBObject("floorplan", floorplan));
                    collection.update(find, set);
                    BasicDBObject obj = new BasicDBObject("showid", showid).append("username", user).append("dateofbooking", day).append("totalprice", price).append("bookedseats", bookedseats);
                    collection2.insert(obj);
                }
                out.print("<center><font size=\"4\" color=\"white\" class=\"w3-wide\">Thanks for Booking!</font></center>");
                RequestDispatcher rd = request.getRequestDispatcher("ticket.jsp");
                rd.include(request, response);
            }
    }


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
