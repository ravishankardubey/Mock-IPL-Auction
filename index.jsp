<%-- 
    Document   : index
    Created on : Oct 13, 2015, 9:02:43 PM
    Author     : ravishankar dubey
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,javax.servlet.*,javax.servlet.http.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
      <!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
	  <link rel="icon" type="image/png" href="images/ecell_logo.png">
         <meta http-equiv="refresh" content="20">
        <title>Mock IPL-Auction</title>
        <style>
            th{
                font-family: monospace;
                color:white;
                font-weight: 400;
                font-size: xx-large;
                align:left;
                background-color: #2c63ea;
                border-radius:20px;
            }
            tr:nth-child(odd)
            {
                // background-color: ;   
            }
            tr:nth-child(even)
            {
                //background-color:grey;  
            }
            td{
                border-radius:20px;
            }

            #progressbar {
                background-color:#fae055;
                border-radius: 35px; /* (height of inner div) / 2 + padding */
                padding: 3px;
                width:auto;
                height:50px;
            }

            #progressbar_in_csk{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }

            #progressbar_in_dd{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }
            #progressbar_in_kkr{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }

            #progressbar_in_kxi{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }

            #progressbar_in_mi{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }

            #progressbar_in_rcb{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }

            #progressbar_in_rr{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }

            #progressbar_in_srh{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }
			#progressbar_in_gjl{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }
			#progressbar_in_rp{
                background-color: #ff6666;
                width:0; /* Adjust with JavaScript */
                height:50px;
                border-radius: 35px;
            }


            #point{
                background:url(images/logo/coin_1.png) no-repeat;
                background-position: center; 

            }

            #bal{

            }

        </style>

    </head>
    <body onload="bar()">

        <%

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "password");

                Statement stmt1 = con1.createStatement();
                Statement stmt2 = con1.createStatement();
				Statement stmt3 = con1.createStatement();

                /* Statement stmt2= con1.createStatement();
                 Statement stmt3= con1.createStatement();
                 Statement stmt4= con1.createStatement();
                 Statement stmt5= con1.createStatement();
                 Statement stmt6= con1.createStatement();
                 Statement stmt7= con1.createStatement();
                 Statement stmt8= con1.createStatement(); */
                ResultSet rs1 = stmt1.executeQuery("select * from teams_info order by points desc");
                ResultSet rs2 = stmt2.executeQuery("select * from player");
				ResultSet rs3 = stmt3.executeQuery("select * from unsold");
                rs2.next();
				rs3.next();
				
				
                /*
                 ResultSet rs_kkr=stmt2.executeQuery("select * from teams_info where Team_Name='kkr'");
                 ResultSet rs_csk=stmt3.executeQuery("select * from teams_info where Team_Name='csk'");
                 ResultSet rs_kxi=stmt4.executeQuery("select * from teams_info where Team_Name='kxi'");
                 ResultSet rs_mi=stmt5.executeQuery("select * from teams_info where Team_Name='mi'");
                 ResultSet rs_rcb=stmt6.executeQuery("select * from teams_info where Team_Name='rcb'");
                 ResultSet rs_rr=stmt7.executeQuery("select * from teams_info where Team_Name='rr'");
                 ResultSet rs_srh=stmt8.executeQuery("select * from teams_info where Team_Name='srh'"); */

        %>
    <center>
        <table  width="95%" cellspacing="0px" cellpadding="0px">
            <tr><td width="33%" align="center"><img src="images/auction_logo.png" width="50%" height="40%"></td>
                <td width="33%"><img src="images/leaderboard.png"></td>
                <td  align="right"> <font color="red" size="4px">Batsman Left <br>Bowler Left <br>All Ronder Left</font></td>
				<td><b><font size="4px"> :&nbsp;&nbsp;<%=rs2.getString(1)%><br>:&nbsp;&nbsp;<%=rs2.getString(2)%><br>:&nbsp;&nbsp;<%=rs2.getString(3)%><br></font></b></td>
				<td>/<br>/<br>/</td>
				<td><b><font size="4px"><%=rs2.getString(4)%><br><%=rs2.getString(5)%><br><%=rs2.getString(6)%></font></td>
				<td  align="left"><font color="red" size="4px"> :&nbsp;&nbsp;Unsold<br> :&nbsp;&nbsp;Unsold<br> :&nbsp;&nbsp;Unsold</font></b><td></tr>
				</table>
        
		<table width="95%"  style="border-radius:20px;">
            <tr><th width="55%">Team - Ranking</th><th>Balance</th><th colspan="3">Team Stat</th><th width="15%">Points</th></tr>
                    <%
                        String a = null;
                        String b = null;

                        while (rs1.next()) {

                            if (rs1.getString("Team_Name").equals("csk")) {
                                request.setAttribute("csk", rs1.getString("balance"));
                            }
                            if (rs1.getString("Team_Name").equals("kkr")) {
                                request.setAttribute("kkr", rs1.getString("balance"));
                            }
                            if (rs1.getString("Team_Name").equals("dd")) {
                                request.setAttribute("dd", rs1.getString("balance"));
                            }
                            if (rs1.getString("Team_Name").equals("kxi")) {
                                request.setAttribute("kxi", rs1.getString("balance"));
                            }
                            if (rs1.getString("Team_Name").equals("mi")) {
                                request.setAttribute("mi", rs1.getString("balance"));
                            }
                            if (rs1.getString("Team_Name").equals("rcb")) {
                                request.setAttribute("rcb", rs1.getString("balance"));
                            }
                            if (rs1.getString("Team_Name").equals("rr")) {
                                request.setAttribute("rr", rs1.getString("balance"));
                            }
                            if (rs1.getString("Team_Name").equals("srh")) {
                                request.setAttribute("srh", rs1.getString("balance"));
                            }
							if (rs1.getString("Team_Name").equals("gjl")) {
                                request.setAttribute("gjl", rs1.getString("balance"));
                            }
							if (rs1.getString("Team_Name").equals("rp")) {
                                request.setAttribute("rp", rs1.getString("balance"));
                            }


                    %>
            <script>
                function bar()
                {
                    var x_csk = parseInt(<%=request.getAttribute("csk")%>);
                    var y_csk = (x_csk * 100) / 600000000;

                    var x_dd = parseInt(<%=request.getAttribute("dd")%>);
                    var y_dd = (x_dd * 100) / 600000000;

                    var x_kkr = parseInt(<%=request.getAttribute("kkr")%>);
                    var y_kkr = (x_kkr * 100) / 600000000;

                    var x_kxi = parseInt(<%=request.getAttribute("kxi")%>);
                    var y_kxi = (x_kxi * 100) / 600000000;

                    var x_mi = parseInt(<%=request.getAttribute("mi")%>);
                    var y_mi = (x_mi * 100) / 600000000;

                    var x_rcb = parseInt(<%=request.getAttribute("rcb")%>);
                    var y_rcb = (x_rcb * 100) / 600000000;

                    var x_rr = parseInt(<%=request.getAttribute("rr")%>);
                    var y_rr = (x_rr * 100) / 600000000;

                    var x_srh = parseInt(<%=request.getAttribute("srh")%>);
                    var y_srh = (x_srh * 100) / 600000000;
					
					var x_gjl = parseInt(<%=request.getAttribute("gjl")%>);
                    var y_gjl = (x_gjl * 100) / 600000000;
					
					var x_rp = parseInt(<%=request.getAttribute("rp")%>);
                    var y_rp = (x_rp * 100) / 600000000;
					



					var elem_csk = document.getElementById("progressbar_in_csk");
                    elem_csk.style.width = y_csk + "%";
					if(y_csk>=100)
                    {
                        var col_csk=document.getElementById("progressbar_in_csk");
                        col_csk.style.background="#ff1919";
                        elem_csk.style.width = "100%";
                    }
					//dd------------------------------------
                    var elem_dd = document.getElementById("progressbar_in_dd");
                    elem_dd.style.width = y_dd + "%";
					if(y_dd>=100)
                    {
                        var col_dd=document.getElementById("progressbar_in_dd");
                        col_dd.style.background="#ff1919";
                        elem_dd.style.width = "20%";
                    }
					//kkr----------------------
                    var elem_kkr = document.getElementById("progressbar_in_kkr");
                    elem_kkr.style.width = y_kkr + "%";
					if(y_kkr>=100)
                    {
                        var col_kkr=document.getElementById("progressbar_in_kkr");
                        col_kkr.style.background="#ff1919";
                        elem_kkr.style.width = "100%";
                    }
					
                    var elem_kxi = document.getElementById("progressbar_in_kxi");
                    elem_kxi.style.width = y_kxi + "%";
                    if(y_kxi>=100)
                    {
                        var col_kxi=document.getElementById("progressbar_in_kxi");
                        col_kxi.style.background="#ff1919";
                        elem_kxi.style.width = "100%";
                    }

                    var elem_mi = document.getElementById("progressbar_in_mi");
                    elem_mi.style.width = y_mi + "%";
                    if(y_mi>=100)
                    {
                        var col_mi=document.getElementById("progressbar_in_mi");
                        col_mi.style.background="#ff1919";
                        elem_mi.style.width = "100%";
                    }

                    var elem_rcb = document.getElementById("progressbar_in_rcb");
                    elem_rcb.style.width = y_rcb + "%";
                    if(y_rcb>=100)
                    {
                        var col_rcb=document.getElementById("progressbar_in_rcb");
                        col_rcb.style.background="#ff1919";
                        elem_rcb.style.width = "100%";
                    }

                    var elem_rr = document.getElementById("progressbar_in_rr");
                    elem_rr.style.width = y_rr + "%";
                    if(y_rr>=100)
                    {
                        var col_rr=document.getElementById("progressbar_in_rr");
                        col_rr.style.background="#ff1919";
                        elem_rr.style.width = "100%";
                    }

                    var elem_srh = document.getElementById("progressbar_in_srh");
                    elem_srh.style.width = y_srh + "%";
                    if(y_srh>=100)
                    {
                        var col_srh=document.getElementById("progressbar_in_srh");
                        col_srh.style.background="#ff1919";
                        elem_srh.style.width = "100%";
                    }
					
					var elem_gjl = document.getElementById("progressbar_in_gjl");
                    elem_gjl.style.width = y_gjl + "%";
                    if(y_gjl>=100)
                    {
                        var col_gjl=document.getElementById("progressbar_in_gjl");
                        col_gjl.style.background="#ff1919";
                        elem_gjl.style.width = "100%";
                    }
					var elem_rp = document.getElementById("progressbar_in_rp");
                    elem_rp.style.width = y_rp + "%";
                    if(y_rp>=100)
                    {
                        var col_rp=document.getElementById("progressbar_in_rp");
                        col_rp.style.background="#ff1919";
                        elem_rp.style.width = "100%";
                    }
				}
            </script>
            <%
            
                    int bal = (600000000 - Integer.parseInt(rs1.getString("balance")));
                    out.println("<tr><td width='55%'><img src='images/logo/" + rs1.getString("Team_Name") + ".png' width='55px' height='55px' align='left' title='" + rs1.getString("Team_Name") + "'>"
                            + "<div  id='progressbar'><div id='progressbar_in_" + rs1.getString("Team_Name") + "'></div></div></td>"
                            + "<td align='center'><font color='black' size='5'><strong>"+bal+"&nbsp;/-</strong></font></td>"
                            + "<td align='center'><img src='images/logo/bat.png' width='20px' height='20px'>&nbsp;X&nbsp;<font color='blue' size='5'>" + rs1.getString("Batsman") + "</font></td>"
                            + "<td><img src='images/logo/ball.png' width='20px' height='20px'>&nbsp;X&nbsp;<font color='blue' size='5'>" + rs1.getString("Bowler") + "</font></td>"
                            + "<td align='center'><img src='images/logo/all.png' width='20px' height='20px'>&nbsp;X&nbsp;<font color='b' size='5'>" + rs1.getString("All_Rounder") + "</font></td></td>"
                            + "<td id='point' width='10%'  align='center' ><font color='black' size='5'>" + rs1.getString("Points") + "</font></td></tr>"
                            + "<tr><td align='center'></td></tr>"
                            + "<tr></tr>");
                }
            %>
            


           
        </table>

        <%-- <div id="progress"></div> --%>
    </center>


    <%
        } catch (Exception e) {
        }
    %>


</body>
</html>
