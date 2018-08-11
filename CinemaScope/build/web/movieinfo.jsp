<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="Display.DisplayMovieInfo, com.mongodb.*, java.util.*" %>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style-movieinfo.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/fonts.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/w3.css" media="all"/>
        <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <% 
            String a = request.getParameter( "b" ); 
            session.setAttribute("movie", a);
        %>
        
	<title>CinemaScope | <%= session.getAttribute("movie") %></title>
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
                <%
                    DisplayMovieInfo x = new DisplayMovieInfo();
                    DBObject y = x.func3(a);
                %>
			<div id="img">
                            <img src="images/movicon.png" alt="<%= y.get("_id") %>" style="border-style: solid; border-width: medium; height:300px; width:215px;">
                            <br><br><center><a href="book.jsp"><button class="w3-btn w3-lime w3-hover-khaki w3-large w3-ripple w3-text-shadow w3-round-xxlarge" style="width: 50%">Book!</button></a></center>
                        </div>
			<div id="info">
				<center><font color="black" size="8"><%= y.get("_id") %></font><br>
                                <% DBObject rd = (DBObject) y.get("release_date"); %>
				<img src="images/glyph-time2.png" width="20px" height="20px"><font color="black" size="5"> <%= rd.get("day") %> <%= rd.get("month") %>, <%= rd.get("year") %></font>
				<font color="white" size="2">........</font>
                                <% DBObject len = (DBObject) y.get("len_of_movie"); %>
				<img src="images/glyph-calendar2.png" width="20px" height="20px"><font color="black" size="5"> <%= len.get("hrs") %> hrs <%= len.get("min") %> mins</font>
				<font color="white" size="2">........</font>
                                <% 
                                    String cert = new String();
                                    if(y.get("certification").equals("ua"))
                                        cert = "U/A";
                                    else if(y.get("certification").equals("u"))
                                        cert = "U";
                                    else if(y.get("certification").equals("a"))
                                        cert="A";
                                %>
				<font color="black" size="5"> <%= cert %> Certificate </font></center>
				<br>
                                <% 
                                    ArrayList<String> genre = (ArrayList<String>)y.get("genre");
                                    for(String g:genre)
                                    {
                                        String url = "genre.jsp?g="+g;
                                %>
				<a href="<%= url %>"><span class="badge1big"><%= g %></span></a>
				<font color="white" size="2">.....</font>
                                <%
                                    }
                                    ArrayList<String> lang = (ArrayList<String>)y.get("language");
                                    for(String l:lang)
                                    {
                                        String url = "language.jsp?l="+l;
                                %>
				<a href="<%= url %>"><span class="badge2big"><%= l %></span></a>
                                <%  } %>
				<br><br>
                                <%
                                    ArrayList<String> cast = (ArrayList<String>)y.get("cast");
                                %>
				<font color="black" size="5"> <b>Cast:</b> <% for(String c:cast){ %> <%= c %>, <% } %>. </font>
				<br><br>       
                                    <script type="text/javascript" src="js/rating.js"></script>
                                    <form method="post" action="RatingServlet" class="form-inline">
                                        <center><img id="heart1" height="30px" src='images/heart_empty.png' onclick="func1();"  />
                                        <img id="heart2" height="30px" src='images/heart_empty.png' onclick="func2();"  />
                                        <img id="heart3" height="30px" src='images/heart_empty.png' onclick="func3();"  />
                                        <img id="heart4" height="30px" src='images/heart_empty.png' onclick="func4();"  />
                                        <img id="heart5" height="30px" src='images/heart_empty.png' onclick="func5();"  />
                                        <input id="rate" name="rate" type="hidden" value="0"/>
                                        <font color="black" size="2">...</font>
                                        <input value="Rate!" type="submit" class="w3-btn w3-pink w3-hover-red w3-large w3-ripple w3-text-shadow w3-round-xxlarge" style="width: 20%"/></center>
                                    </form>
                                    <br>
                                <form method="post" action="CommentServlet">
                                    <textarea class="form-control" rows="2" id="comment" name="comment" placeholder="Leave a comment."></textarea><br>
                                    <center><input value="Comment!" type="submit" class="w3-btn w3-indigo w3-hover-lime w3-large w3-ripple w3-text-shadow w3-round-xxlarge" style="width: 20%"/></center>
                                </form>
                                
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