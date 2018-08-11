<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="Display.DisplayMovies, com.mongodb.*, java.util.*" %>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style-movies.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/fonts.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/w3.css" media="all"/>
    <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<% 
            String d = (String)session.getAttribute("city");
            System.out.println(d); 
        %>
	<title>CinemaScope | <%= session.getAttribute("city") %></title>
</head>

<body style="background-image: url('images/bg.png'); background-size: cover;">
	<div id="contentwrap" style="background-image: url('images/bg12.png'); background-size: cover;">
		<div id="navigation">
			<a href="welcome.jsp"><img src="images/logo2_smaller.png" class="w3-ripple" style="height:96px;"/></a>
			<a href="home.jsp"><img src="images/button1_small.png" class="w3-leftbar w3-border-indigo w3-hover-border-black w3-ripple" style="height:96px;" ></a>
			<a href="movies.jsp"><img src="images/button2_small.png" class="w3-leftbar w3-border-teal w3-hover-border-black w3-ripple" style="height:96px;"/></a>
			<a href="offers.jsp"><img src="images/button3_small.png" class="w3-leftbar w3-border-amber w3-hover-border-black w3-ripple" style="height:96px;"/></a>
			<a href="account.jsp"><img src="images/button4_small.png" class="w3-leftbar w3-border-pink w3-hover-border-black w3-ripple" style="height:96px;"/></a>
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
			<font color="black" size="8"><center>NOW SHOWING</center></font>
                        <%
                            DisplayMovies x = new DisplayMovies();
                            ArrayList<DBObject> mov = x.func2(d);
                            Iterator itr = mov.iterator();
                            while(itr.hasNext())
                            {
                                DBObject o = (DBObject)itr.next(); 
                        %>
			<div class="container">
				<div class="gallery">
                                    <a href="movieinfo.jsp?b=<%= o.get("_id") %>" >
                                            <img src="images/movicon2.png" alt="<%= o.get("_id") %>" style="width:230px; height:300px" class="image">
						<div class="middle">
                                                    <% 
                                                        ArrayList<String> genre = (ArrayList<String>)o.get("genre");
                                                        for(String g:genre)
                                                        {
                                                    %>    
                                                        <span class="badge"><%= g %></span>
                                                    <% 
                                                        }
                                                        ArrayList<String> lang = (ArrayList<String>)o.get("language");
                                                        for(String l:lang)
                                                        {
                                                    %>  
                                                        <span class="badge2"><%= l %></span>
                                                    <%  } %>
                                                </div>
					</img>	
					</a>
					<div class="desc"><font color="black" size="4"><b><%= o.get("_id") %></b></font></div>
				</div>
			</div>
                        <%  }   %>
			
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