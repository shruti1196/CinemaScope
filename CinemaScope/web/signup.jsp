<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="Display.DisplayCities, com.mongodb.*, java.util.*, javax.servlet.http.HttpServletResponse" %>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style-signup.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/fonts.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/w3.css" media="all"/>
    <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<title>CinemaScope | Signup</title>
</head>

<body style="background-image: url('images/bg.png'); background-size: cover;">
	<div id="contentwrap" style="background-image: url('images/bg11.png'); background-size: cover;">
		<div id="navigation">
			<a href="#" style="cursor: not-allowed;"><img src="images/logo2_smaller.png" class="w3-ripple" style="height:98px;"/></a>
			<a href="#" style="cursor: not-allowed;"><img src="images/button1_small.png" class="w3-leftbar w3-border-indigo w3-hover-border-black w3-ripple" style="height:98px;" ></a>
			<a href="#" style="cursor: not-allowed;"><img src="images/button2_small.png" class="w3-leftbar w3-border-teal w3-hover-border-black w3-ripple" style="height:98px;"/></a>
			<a href="#" style="cursor: not-allowed;"><img src="images/button3_small.png" class="w3-leftbar w3-border-amber w3-hover-border-black w3-ripple" style="height:98px;"/></a>
			<a href="#" style="cursor: not-allowed;"><img src="images/button4_small.png" class="w3-leftbar w3-border-pink w3-hover-border-black w3-ripple" style="height:98px;"/></a>
		</div>	
		
		<div id="content">
			<br><font color="black" size="8"><center>SIGN UP</center></font>
			<form method="post" action="SignupServlet" class="form-horizontal">
				<div class="col-sm-6"><strong><font color="black" size="5">Name: </font></strong><input type="text" name="name" class="form-control" required> </div>
				<div class="col-sm-6"><strong><font color="black" size="5">E-mail: </font></strong><input type="email" name="email" class="form-control" required> </div>
				<div class="col-sm-6"><strong><font color="black" size="5">Password: </font></strong><input type="password" name="password" class="form-control" required> </div>
				<div class="col-sm-6"><strong><font color="black" size="5">Contact No: </font></strong><input type="text" name="contact" class="form-control" required> </div>
				<br><br>
				<fieldset>
					<legend><strong><font color="black" size="5">Address: </font></strong></legend>
					<div class="col-sm-6"><strong><font color="black" size="5">Locality: </font></strong><input type="text" name="locality" class="form-control"></div>
                                    <% 
                                        DisplayCities d = new DisplayCities();
                                        List<DBObject> cities = d.func();
                                        Iterator itr = cities.iterator();
                                        List states = d.func5();
                                        Iterator itr2 = states.iterator();
                                        response.setContentType("text/html");
                                    %>
                                        <div class="col-sm-6"><strong><font color="black" size="5">City: </font></strong>
                                            <select class="form-control" name="city">
                                                <%
                                                    while(itr.hasNext())
                                                    {
                                                        DBObject obj = (DBObject)itr.next();
                                                %>
                                                <option value="<%= obj.get("city")%>"><% out.print(obj.get("city")); %></option>
                                                <%  } %>
                                            </select>
                                        </div>
                                        
					<div class="col-sm-12"><strong><font color="black" size="5">State: </font></strong>
                                            <select class="form-control" name="state">
                                                <%
                                                    while(itr2.hasNext())
                                                    {
                                                        String s = (String)itr2.next();
                                                %>
                                                <option value="<%= s %>"><% out.print(s); %></option>
                                                <%  } %>
                                            </select>
                                        </div>
					
				</fieldset>
				<br><br>
				<center><input type="submit" class="w3-btn w3-teal w3-hover-green w3-large w3-ripple w3-text-shadow w3-round-xxlarge" style="width: 35%"></input></center>
			</form>
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
			
			