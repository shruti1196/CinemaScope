<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Display.DisplayAccount, com.mongodb.*, java.util.*, org.bson.types.ObjectId" %>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style-account.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/fonts.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/w3.css" media="all"/>
        <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <title>CinemaScope | <%= session.getAttribute("name") %>'s Account</title>
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
                    <div id="left">
                        <br><br><img src="images/watcher2.gif" height="375px" width="450px">
                    </div>
                    <div id="right">
                        <%
                            DisplayAccount a = new DisplayAccount();
                            DBObject o = a.func16(request);
                            DBObject y = (DBObject)o.get("address");
                        %>
                        <br><br><center><font size="8" color="black"><%= session.getAttribute("name") %>'s Account</font></center>
                        <font size="6" color="#0B2172"><strong>&emsp;Email: </strong></font><font size="6" color="black"><%= o.get("emailid") %></font>
                        <br><font size="6" color="#0B2172"><strong>&emsp;Contact No: </strong></font><font size="6" color="black"><%= o.get("contactno") %></font>
                        <br><font size="6" color="#0B2172"><strong>&emsp;Locality: </strong></font><font size="6" color="black"><%= y.get("locality") %></font>
                        <br><font size="6" color="#0B2172"><strong>&emsp;City: </strong></font><font size="6" color="black"><%= y.get("city") %></font>
                        <br><font size="6" color="#0B2172"><strong>&emsp;State: </strong></font><font size="6" color="black"><%= y.get("state") %></font>
                        <form method="post" action="LogoutServlet">
                            <br><center><input class="w3-btn w3-green w3-hover-lime w3-large w3-ripple w3-text-shadow w3-round-xxlarge" style="width: 40%" type="submit" value="Logout"></center>
                        </form>
                        <br>
                    </div>
                    <center><font size="6" color="#0B2172"><strong>Bookings</strong></font></center>
                    <div id="bookings">
                        <%
                            DisplayAccount b = new DisplayAccount();
                            MongoClient mongo = new MongoClient("localhost", 27017);
                            DB db = mongo.getDB("CinemaScope");
                            DBCollection collection = db.getCollection("Shows");
                            ArrayList<DBObject> list = b.func17(request);
                            Iterator itr = list.iterator();
                            while(itr.hasNext())
                            {
                                DBObject x = (DBObject)itr.next();
                                Double p = (Double)x.get("totalprice");
                                List<Integer> s = (List<Integer>)x.get("bookedseats");
                                ObjectId showid = (ObjectId)x.get("showid");
                                BasicDBObject search = new BasicDBObject();
                                search.put("_id", showid);
                                DBCursor c = collection.find(search);
                                if(c.hasNext())
                                {
                                    DBObject show = c.next();
                                    String m = (String)show.get("movie");
                                    String d = (String)show.get("day");
                                    String t = (String)show.get("timeofstart");
                                    String v1 = (String)show.get("theatre");
                                    String v3 = (String)show.get("city");
                                    String v = new String();
                                    if(show.get("locality")!=null)
                                    {
                                        String v2 = (String)show.get("locality");
                                        v = v1 + ", " + v2 + ", " + v3;
                                    }
                                    else
                                    {
                                        v = v1 + ", " + v3;
                                    }
                        %>
                                    <div style="background-image: url('images/bg12.png'); padding-left: 25px;">
                                        <font size="5" color="#0B2172"><strong>Movie: </strong></font><font size="5" color="black"><%= m %></font>
                                        <font size="5" color="#0B2172"><strong>&emsp;&emsp;Day: </strong></font><font size="5" color="black"><%= d %></font>
                                        <font size="5" color="#0B2172"><strong>&emsp;&emsp;Time: </strong></font><font size="5" color="black"><%= t %></font>
                                        <font size="5" color="#0B2172"><strong>&emsp;&emsp;Venue: </strong></font><font size="5" color="black"><%= v %></font>
                                        <font size="5" color="#0B2172"><strong>&emsp;&emsp;Price: </strong></font><font size="5" color="black"><%= p %></font>
                                        <font size="5" color="#0B2172"><strong>&emsp;&emsp;Seats: </strong></font><font size="5" color="black"><%= s %></font>
                                    </div>
                        <%        
                                }
                            }
                        %>
                    </div>
                    <br>
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
