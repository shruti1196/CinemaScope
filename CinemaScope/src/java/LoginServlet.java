/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.net.UnknownHostException;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mongodb.*;


/**
 *
 * @author Bugs
 */
@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    public static boolean validate(String e, String p, HttpServletResponse response, HttpServletRequest request) throws IOException
    {  
    	boolean status=false;      
    	try{   	
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("CinemaScope");
            DBCollection collection = db.getCollection("Users");
            response.setContentType("text/html");  
            PrintWriter out = response.getWriter();  
             
            BasicDBObject search = new BasicDBObject();
            search.put("emailid",e);
            search.put("password",p);
            DBCursor cursor = collection.find(search);
            if (cursor.hasNext())
            {
                status=true;
                DBObject obj = cursor.next();
                HttpSession session = request.getSession(false);
                if(session!=null)
                {
                    session.setAttribute("name", obj.get("name"));
                    session.setAttribute("email", obj.get("emailid"));
                    session.setAttribute("offer", "no");
                }
            }
        }    
        catch(UnknownHostException x) 
        {
            response.setContentType("text/html");  
            PrintWriter out = response.getWriter();  
            out.print("<center><font color=\"red\" size=\"4\" class=\"w3-wide\">Database Not Connected!1</font></center>"); 
            x.printStackTrace(); 
        } 

        catch(MongoException x) 
        {
            response.setContentType("text/html");  
            PrintWriter out = response.getWriter();  
            out.print("<center><font color=\"red\" size=\"4\" class=\"w3-wide\">Database Not Connected!2</font></center>"); 
            x.printStackTrace();
        }
        return status;
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
        
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
         
        String e=request.getParameter("email");  
        String p=request.getParameter("password"); 
        
        if(validate(e, p, response, request))
        {  
           RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");  
           rd.forward(request,response);  
        }  
        else
        {  
            out.print("<center><font size=\"4\" color=\"red\" class=\"w3-wide\">Incorrect Email or Password!</font></center>");  
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
            rd.include(request,response);  
        }  

        out.close();  
        
      
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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


