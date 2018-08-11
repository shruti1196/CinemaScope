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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bugs
 */
@WebServlet(urlPatterns = {"/CommentServlet"})
public class CommentServlet extends HttpServlet 
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
            throws ServletException, IOException {
            String comment = request.getParameter("comment");   
            response.setContentType("text/html");  
            PrintWriter out = response.getWriter(); 
            out.print("<center><font size=\"4\" color=\"white\" class=\"w3-wide\">Thanks for your Comment!</font></center>");
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("CinemaScope");
            DBCollection collection = db.getCollection("Comments");
            HttpSession session = request.getSession(false);
            if(session.getAttribute("name")!=null && session.getAttribute("movie")!=null)
            {
                String u = (String)session.getAttribute("name");
                String m = (String)session.getAttribute("movie");
                BasicDBObject search_criteria = new BasicDBObject();
                search_criteria.put("user",u);
                search_criteria.put("movie",m);
                BasicDBObject update_criteria = new BasicDBObject();
                update_criteria.put("comment",comment);
                collection.update(search_criteria, new BasicDBObject("$set", update_criteria), true, false);
                
            }      
            RequestDispatcher rd = request.getRequestDispatcher("book.jsp");  
            rd.include(request,response);
        }

     // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
