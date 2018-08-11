/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mongodb.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bugs
 */
@WebServlet(urlPatterns = {"/OfferServlet"})
public class OfferServlet extends HttpServlet {
    
    public long func18(HttpServletRequest request)
    {
        long count=0;
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("CinemaScope");
        DBCollection collection = db.getCollection("Bookings");
        HttpSession session = request.getSession(false);
        String user = (String)session.getAttribute("name");
        BasicDBObject search = new BasicDBObject();
        search.put("username", user);
        count = collection.count(search);
        System.out.println(count);
        return count;
    }

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
        HttpSession session = request.getSession(false);
        
        long z = func18(request);
        if(z >= 5)
        {
            session.setAttribute("offer", "yes");
            out.print("<center><font color=\"white\" size=\"4\" class=\"w3-wide\">Offer Activated!</font></center>");
            RequestDispatcher rd=request.getRequestDispatcher("offers.jsp");  
            rd.include(request,response);  
        }
        else
        {
            out.print("<center><font color=\"white\" size=\"4\" class=\"w3-wide\">Offer Not Applicable!</font></center>");
            RequestDispatcher rd=request.getRequestDispatcher("offers.jsp");  
            rd.include(request,response);  
        }        
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
