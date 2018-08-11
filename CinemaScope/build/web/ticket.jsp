<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="Display.DisplayTicket, com.mongodb.*, java.util.*" %>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style-ticket.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/fonts.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/w3.css" media="all"/>
        <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <title>CinemaScope | Ticket Booked!</title>
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
                    <br><center><font size="8" color="black">Booking Successful!</font></center><br>
                    <%
                        DisplayTicket obj = new DisplayTicket();
                        obj.func15(request);
                    %>
                    <div id="ticket" style="background-image: url('images/ticket3.png');">
                        <br><br>
                        <center><font size='7' color='black'>&#9733; <%= obj.movie %> &#9733;</font>
                        <br><font size='6' color='black'>Date: <font size='6' color='brown'><%= obj.day %></font> &emsp;&emsp;&emsp;&emsp;&emsp; Time: <font size='6' color='brown'><%= obj.time %></font></font>
                        <%
                            String offer = (String)session.getAttribute("offer");
                            if(offer.equals("yes"))
                            {
                        %>
                                <br><font size='6' color='black'>Seats: <font size='6' color='brown'><%= obj.seats %></font> &emsp;&emsp;&emsp;&emsp;&emsp; Offer Price: <font size='6' color='brown'><%= obj.price %></font></font>
                        <% 
                            }
                            else
                            {
                        %>
                                <br><font size='6' color='black'>Seats: <font size='6' color='brown'><%= obj.seats %></font> &emsp;&emsp;&emsp;&emsp;&emsp; Price: <font size='6' color='brown'><%= obj.price %></font></font>
                        <%  }  %>
                        <br><font size='6' color='black'>Venue: <font size='6' color='brown'><%= obj.venue %></font></font>
                        <br><br><br><br><br><br><br>
                        </center>
                    </div>
                    <div id="tc" style="background-image: url('images/bg12.png');"> 
                        <br><font size="5" color="black"><strong>Terms and Conditions:</strong></font>
                        <br><font size="4" color="black"><strong>1. Get your ticket at least 15 minutes prior to the start of the show at the ticket counter at the venue.</strong></font>
                        <br><font size="4" color="black"><strong>2. Payment is to be done at the ticket counter only. Modes of payment available are subject to change according to venue conditions.</strong></font>
                        <br><font size="4" color="black"><strong>3. Don't forget to grab exclusive CinemaScope food passes. Enjoy 20% off on a food item and a beverage.</strong></font>
                        <br><br>
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
