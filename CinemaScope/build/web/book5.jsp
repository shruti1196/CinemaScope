<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="Display.DisplayShows, com.mongodb.*, java.util.*" %>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style-book.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/fonts.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/w3.css" media="all"/>
        <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <script src="js/seatplan.js"></script>
        <title>CinemaScope | Book - <%= session.getAttribute("movie") %></title>
</head>

<body style="background-image: url('images/bg.png'); background-size: cover;">
	<div id="contentwrap" style="background-image: url('images/bg12.png'); background-size: cover;">
		<div id="navigation">
			<a href="welcome.jsp"><img src="images/logo2_smaller.png" class="w3-ripple" style="height:98px;"/></a>
			<a href="home.jsp"><img src="images/button1_small.png" class="w3-leftbar w3-border-indigo w3-hover-border-black w3-ripple" style="height:98px;" ></a>
			<a href="movies.jsp"><img src="images/button2_small.png" class="w3-leftbar w3-border-teal w3-hover-border-black w3-ripple" style="height:98px;"/></a>
			<a href="offers.jsp"><img src="images/button3_small.png" class="w3-leftbar w3-border-amber w3-hover-border-black w3-ripple" style="height:98px;"/></a>
			<a href="account.jsp"><img src="images/button4_small.png" class="w3-leftbar w3-border-pink w3-hover-border-black w3-ripple" style="height:98px;"/></a>
			<br><font color="white" size="1">...</font><br>
			<div id="sidebar" class="w3-sidebar w3-bar-block w3-pale-green w3-border-right w3-border-bottom" style="height:510px; width:300px; display:none;">
				<button onclick="w3_close()" class="w3-bar-item w3-large"><font color="black" size="5"><b><%= session.getAttribute("city") %> &times;</b></font></button>
				<a href="movies.jsp" class="w3-bar-item w3-button w3-hover-black w3-ripple w3-text-shadow"><center><img src="images/now_smaller.png" style="width:200px; height:200px;"/></center></a>
				<a href="#" class="w3-bar-item w3-button w3-hover-black w3-ripple w3-text-shadow"><center><img src="images/next_smaller.png" style="width:250px; height:175px;"/></center></a>
				<a href="welcome.jsp" class="w3-bar-item w3-button w3-hover-black w3-ripple w3-text-shadow"><center><font size="5"><b>Change Region</b></font></center></a>
			</div>
			<button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
			<script>
				function w3_open() {
					document.getElementById("sidebar").style.display = "block";
				}
				function w3_close() {
					document.getElementById("sidebar").style.display = "none";
				}
			</script>
		</div>
                                
                <div id="content">
                    <div id="details">
                        <%
                            String m = (String)session.getAttribute("movie");
                            String c = (String)session.getAttribute("city");
                            String t = (String)session.getAttribute("theater");
                            String day = (String)session.getAttribute("day");
                            String time = (String)session.getAttribute("time");
                            DisplayShows x = new DisplayShows();
                            ArrayList<DBObject> s = x.func10(c, m);
                            Iterator itr = s.iterator();  
                        %>
                        <center><font color="black" size="8">Book</font>
                        <br><font color="#0B2172" size="6"><strong>Movie: </strong></font><font color="black" size="6"><%= m %></font>
                        <br><font color="#0B2172" size="6"><strong>City: </strong></font><font color="black" size="6"><%= c %></font>
                        <br><font color="#0B2172" size="6"><strong>Theater: </strong></font>
                        <form method="post" action="BookServlet1" class="form-horizontal">
                            <select onchange="this.form.submit()" class="form-control" name="theater">
                                <option disabled>--Select Theater--</option>
                                <%
                                    while(itr.hasNext())
                                    {
                                        DBObject o = (DBObject)itr.next();
                                        String str = new String();
                                        if(o.get("locality")!=null)
                                            str = (String)o.get("theatre")+", "+(String)o.get("locality");
                                        else 
                                            str = (String)o.get("theatre");
                                        if(str.equals(t))
                                        {
                                %>
                                        <option value="<%= str %>" selected><% out.print("<font color=/'black/' size=/'6/'>"+str+"<\font>"); %></option>
                                <%   
                                        }
                                        else
                                        {
                                %>
                                        <option value="<%= str %>"><% out.print("<font color=/'black/' size=/'6/'>"+str+"<\font>"); %></option>
                                <%
                                        }
                                    }
                                %>    
                            </select>
                        </form>
                        <% 
                            ArrayList<DBObject> s1 = x.func12(c, m, t);
                            Iterator itr3 = s1.iterator();
                        %>
                        <font color="#0B2172" size="6"><strong>Show: </strong></font>
                        <form method="post" action="BookServlet2">
                            <select onchange="this.form.submit()" class="form-control" name="show">
                                <option disabled>--Select Show--</option>
                            <% 
                                while(itr3.hasNext())
                                {
                                    DBObject ob = (DBObject)itr3.next();
                                    String z = (String)ob.get("day")+" "+(String)ob.get("timeofstart");
                            %>
                                    <option value="<%= z %>"><% out.print("<font color=/'black/' size=/'6/'>"+z+"<\font>"); %></option>   
                            <%  } %>
                            </select>
                        </form>
                        <% 
                            BasicDBObject p = x.func14(c, m, t, day, time);
                            ArrayList<String> f = (ArrayList<String>)p.get("floorplan");
                            Set<Integer> booked = new HashSet<Integer>();
                            for (int i = 0; i < f.size(); i++) 
                            {
                                if ("b".equals(f.get(i))) {
                                    booked.add(i);
                                }
                            }
                        %>
                        <form method="post" action="BookServlet3">
                            <div id="seats" style="background-image: url('images/bg11.png');">
                            <br>
                            <%
                                int count = 1;
                                for(int i = 1; i <= 3; i++) 
                                {
                                    for(int j = 1; j <= 15; j++) 
                                    {
                                        if(booked.contains(count) == false) 
                                        {   
                            %>
                                            <img id="seat<%= count%>" name="<%= count%>" height="20px" src='images/seat_platinum.png' onclick="func1(<%= count%>)" />
                                            <input type="hidden" id="s<%= count%>" name="s<%= count%>" value="no" >
                            <%
                                        } 
                                        else 
                                        {
                            %>      
                                            <img id="seat<%= count%>" name="<%= count%>" height="20px" src='images/seat_occupied.png' />
                                            <input type="hidden" id="s<%= count%>" name="s<%= count%>" value="no" >
                            <%          }
                                        count++;
                                    }   
                            %>  
                                        <br>
                            <%  }   %> 
                            <br>
                            <%
                                for(int i = 4; i <= 10; i++) 
                                {
                                    for(int j = 1; j <= 6; j++) 
                                    {
                                        if(booked.contains(count) == false) 
                                        {
                            %>
                                            <img id="seat<%= count%>" name="<%= count%>" height="20px" src='images/seat_gold.png' onclick="func2(<%= count%>);" />
                                            <input type="hidden" id="s<%= count%>" name="s<%= count%>" value="no" >
                            <%
                                        } 
                                        else    
                                        {
                            %>
                                            <img id="seat<%= count%>" name="<%= count%>" height="20px" src='images/seat_occupied.png' />
                                            <input type="hidden" id="s<%= count%>" name="s<%= count%>" value="no" >

                            <%          }
                                        count++;
                                    }
                                    for (int j = 7; j <= 9; j++) 
                                    {
                            %>
                                        <img height="20px" src='images/seat_none.png' />
                            <%
                                    }
                                    for (int j = 10; j <= 15; j++) 
                                    {
                                        if (booked.contains(count) == false) 
                                        {
                            %>
                                            <img id="seat<%= count%>" name="<%= count%>" height="20px" src='images/seat_gold.png' onclick="func2(<%= count%>);" />
                                            <input type="hidden" id="s<%= count%>" name="s<%= count%>" value="no" >
                            <%
                                        }
                                        else
                                        {
                            %>
                                            <img id="seat<%= count%>" name="<%= count%>" height="20px" src='images/seat_occupied.png' />
                                            <input type="hidden" id="s<%= count%>" name="s<%= count%>" value="no" >
                            <%
                                        }
                                        count++;
                                    }
                            %>
                                    <br>
                            <%
                                }
                            %>
                            <br>
                            <%
                                for (int i = 18; i <= 20; i++) 
                                {
                                    for (int j = 1; j <= 15; j++) 
                                    {
                                        if (booked.contains(count) == false) 
                                        {
                            %>
                                            <img id="seat<%= count%>" name="<%= count%>" height="20px" src='images/seat_silver.png' onclick="func3(<%= count%>);" />
                                            <input type="hidden" id="s<%= count%>" name="s<%= count%>" value="no" >
                            <%
                                        } 
                                        else 
                                        {
                            %>
                                            <img id="seat<%= count%>" name="<%= count%>" height="20px" src='images/seat_occupied.png' />
                                            <input type="hidden" id="s<%= count%>" name="s<%= count%>" value="no" >
                            <%
                                        }
                                        count++;
                                    }
                            %>      
                                    <br>        
                            <%  
                                }
                            %>
                            <br><font size="6" color="black"><strong>SCREEN</strong></font>
                            <br><br>
                            </div>
                            <br><input value="Book!" type="submit" class="w3-btn w3-black w3-hover-black w3-large w3-ripple w3-text-shadow w3-round-xxlarge" style="width: 20%"/>
                        </form>
                        </center>
                    </div>    
                </div>    
        </div>
	
	<div id="footerwrap" class="w3-wide">
	<br>
		<font size="4" color="white"><center>   &copy Copyright 2017 CinemaScope All Rights Reserved. <br>
		<a href="https://www.facebook.com"><span class="social social-facebook"><img src="images/icon_f.png" width="40px" height="40px" align="center-right"/></span></a>
		<a href="https://twitter.com"> <span class="social social-twitter"><img src="images/icon_t.png" width="40px"  height="40px" align="center-right"/></span></a>
		<a href="https://plus.google.com"> <span class="social social-googleplus"><img src="images/google.png" width="40px"  height="40px" align="center-right"/></span></a></center>
		</font>
	<br>
	</div>

</body>

</html>