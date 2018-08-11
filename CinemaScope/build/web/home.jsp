<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="Display.DisplayMoviesByGenre, Display.DisplayMoviesByLanguage, com.mongodb.*, java.util.*" %>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style-home.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/fonts.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/w3.css" media="all"/>
        <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <script>
            $('.carousel').carousel({
                interval: 500 //changes the speed
            })
        </script>
        <title>CinemaScope | Home</title>
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
                </div>
                                
                <div id="content">
                        
                        <!-- Carousel -->
                        <div id="myCarousel" class="carousel slide">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="fill" style="background-image:url('images/slide1.JPG');"></div>
                                    <div class="carousel-caption">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="fill" style="background-image:url('images/slide2.JPG');"></div>
                                    <div class="carousel-caption">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="fill" style="background-image:url('images/slide3.JPG');"></div>
                                    <div class="carousel-caption">
                                    </div>
                                </div>
                            </div>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                <span class="icon-prev"></span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                <span class="icon-next"></span>
                            </a>
                        </div>
                        
                        <div class="w3-row">
                            <a href="javascript:void(0)" onclick="openCity(event, 'search-genre');">
                              <div class="w3-half tablink w3-bottombar w3-teal w3-hover-black w3-padding">
                                  <center><font size="6">Search Movies by Genre</font></center>
                              </div>
                            </a>
                            <a href="javascript:void(0)" onclick="openCity(event, 'search-language');">
                              <div class="w3-half tablink w3-bottombar w3-purple w3-hover-black w3-padding">
                                  <center><font size="6">Search Movies by Language</font></center>
                              </div>
                            </a>
                        </div>

                        <div id="search-genre" class="w3-container city">
                            <br>
                                <%
                                DisplayMoviesByGenre g = new DisplayMoviesByGenre();
                                ArrayList<String> genre_list = g.func9(request);
                                    for(String x:genre_list)
                                    {
                                       String url = "genre.jsp?g="+x; 
                                %>
                                <a href="<%= url %>"><span class="badge1big"><%= x %></span></a>
                                <%  }   %>
                        </div>

                        <div id="search-language" class="w3-container city" style="display:none">
                            <br>
                                <%
                                DisplayMoviesByLanguage l = new DisplayMoviesByLanguage();
                                ArrayList<String> lang_list = l.func9(request);
                                    for(String x:lang_list)
                                    {
                                       String url = "language.jsp?l="+x; 
                                %>
                                <a href="<%= url %>"><span class="badge2big"><%= x %></span></a>
                                <%  }   %>
                        </div>
             
                        <script>
                        function openCity(evt, cityName) {
                          var i, x, tablinks;
                          x = document.getElementsByClassName("city");
                          for (i = 0; i < x.length; i++) {
                             x[i].style.display = "none";
                          }
                          tablinks = document.getElementsByClassName("tablink");
                          for (i = 0; i < x.length; i++) {
                             tablinks[i].className = tablinks[i].className.replace(" w3-border-lime", "");
                          }
                          document.getElementById(cityName).style.display = "block";
                          evt.currentTarget.firstElementChild.className += " w3-border-lime";
                        }
                        </script>

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