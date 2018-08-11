<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="Display.DisplayCities, com.mongodb.*, java.util.*, javax.servlet.http.HttpServletResponse" %>

<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style-welcome.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/fonts.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/w3.css" media="all"/>
    <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<title>CinemaScope | Welcome <%= session.getAttribute("name") %>!</title>
</head>

<body style="background-image: url('images/welcome.png'); background-size: cover;">
        <font size="4" color="white" class="w3-wide"><center>Welcome  <%= session.getAttribute("name") %>!</center></font>
	<div id="headerwrap">
	
	</div>
	
	<div id="contentwrap">
		
	</div>
	<% 
            DisplayCities d = new DisplayCities();
            List<DBObject> cities = d.func();
            Iterator itr = cities.iterator();
            response.setContentType("text/html");
        %>
	<div id="footerwrap" class="w3-wide">
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<div id="dropdown"><form method="post" action="CityServlet">
			<font color="black" size="4"><center><b><select class="w3-select w3-border w3-round-xxlarge" name="region" style="width:30%">
				<option value="" disabled selected>Select Region</option>
                                <% 
                                    while(itr.hasNext())
                                    {
                                        DBObject obj = (DBObject)itr.next();  
                                %>
				<option value="<%= obj.get("city")%>"><% out.print(obj.get("city")); %></option>
				<% } %>
			</select></center>
			<center><input class="w3-btn w3-hover-yellow w3-large w3-ripple w3-text-shadow w3-round-xxlarge" style="width: 35%" type="submit"></input></center>
			</b></font></form>
		</div>
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