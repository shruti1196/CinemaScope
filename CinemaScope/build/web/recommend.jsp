<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Database.UserBasedCF3, java.util.*, java.util.Map.Entry"%>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style-recommend.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/fonts.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/w3.css" media="all"/>
        <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <title>CinemaScope Recommends </title>
</head>

<body style="background-image: url('images/bg.png'); background-size: cover;">
	<div id="contentwrap" style="background-image: url('images/bg12.png'); background-size: cover;">
		<div id="navigation">
			<a href="welcome.jsp"><img src="images/logo2_smaller.png" class="w3-ripple" style="height:96px;"/></a>
			<a href="home.jsp"><img src="images/button1_small.png" class="w3-leftbar w3-border-indigo w3-hover-border-black w3-ripple" style="height:96px;" ></a>
			<a href="movies.jsp"><img src="images/button2_small.png" class="w3-leftbar w3-border-teal w3-hover-border-black w3-ripple" style="height:96px;"/></a>
			<a href="offers.jsp"><img src="images/button3_small.png" class="w3-leftbar w3-border-amber w3-hover-border-black w3-ripple" style="height:96px;"/></a>
			<a href="account.jsp"><img src="images/button4_small.png" class="w3-leftbar w3-border-pink w3-hover-border-black w3-ripple" style="height:96px;"/></a>
                </div>
		<div id="content">
                    <br><center><font size="8" color="black">CinemaScope Recommends</p></center>
                    <%
                        UserBasedCF3 o = new UserBasedCF3();
                        HashMap<String, Float> r = o.function(request);
                        for(Map.Entry<String, Float> entry : r.entrySet())
                        {   
                            if((Float)entry.getValue()!=(float)(-1))
                            {
                    %>
                            <br><font size="4" color="black"><strong>Rating for Movie <%= entry.getKey() %>: <%= entry.getValue() %> </strong></font>
                    <%  
                            }
                        }
                    %>
                    <br>
                    <%
                        HashMap<String, Float> p = o.function2();
                        for(Map.Entry<String, Float> entry : p.entrySet())
                        {   
                    %>
                            <br><font size="4" color="black"><strong>Prediction for Movie <%= entry.getKey() %>: <%= entry.getValue() %> </strong></font>
                    <%    
                        }
                    %>
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

















