/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bugs
 */
@WebServlet(urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
        public static boolean validate(String e, HttpServletResponse response) throws IOException
        {
            boolean status=false;
            try{   	
                MongoClient mongo = new MongoClient("localhost", 27017);
                DB db = mongo.getDB("CinemaScope");
                DBCollection collection = db.getCollection("Users");
                BasicDBObject search = new BasicDBObject();
                search.put("emailid",e);
                DBCursor cursor = collection.find(search);
                if (cursor.hasNext())
                {
                    status=false;
                }
                else
                {
                    status=true;
                }
            } 
            catch(MongoException x) 
            {
                response.setContentType("text/html");  
                PrintWriter out = response.getWriter();  
                out.print("<center><font color=\"red\" size=\"4\" class=\"w3-wide\">Database Not Connected!</font></center>"); 
                x.printStackTrace();
            }
            return status;
        }
        
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");
            String locality = request.getParameter("locality");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            
            if(validate(email, response))
            {
                MongoClient mongo = new MongoClient("localhost", 27017);
                DB db = mongo.getDB("CinemaScope");
                DBCollection collection = db.getCollection("Users");
                BasicDBObject obj = new BasicDBObject("name", name).append("emailid", email).append("password", password).append("contactno", contact)
                                        .append("address", new BasicDBObject("locality", locality).append("city", city).append("state", state));
                collection.insert(obj);
                HttpSession session = request.getSession(false);
                if(session!=null)
                {
                    session.setAttribute("name", name);
                    session.setAttribute("email", email);
                }
                
                RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");  
                rd.include(request,response);  
            }
            else
            {
                out.print("<center><font size=\"4\" color=\"red\" class=\"w3-wide\">Email ID already in use!</font></center>");
                RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");  
                rd.include(request,response);  
            }   
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
