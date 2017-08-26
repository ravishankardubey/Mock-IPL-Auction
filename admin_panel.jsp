

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,javax.servlet.*,javax.servlet.http.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/png" href="images/ecell_logo.png">
        <title>Admin Panel</title>
        <script>
            function validate_points()
            {
                var x = document.getElementsByTagName("points");

                if (isNaN(x))
                {
                    alert("only enter numeric value");
                    points.focus();
                    points.select();
                }
            }

            function validate_balance()
            {
                var y = document.getElementsByTagName("balance");

                if (isNaN(y))
                {
                    alert("only enter numeric value");
                    balance.focus();
                    balance.select();
                }
            }

            }
        </script>
    </head>
    <body>
        <%session.invalidate();%>
        <%-- <%  
            
             
             try
             {
                       String Query="";
                       String query_1="";
                       String type="";
                       String team="";
                       String point="";
                       String bal="";
              Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","password");
              
              
              
              
              
              
               if(request.getParameter("submit")!=null)
               {
                   if(request.getParameterValues("player")!=null)
                   {
                    String Player[]=request.getParameterValues("player");
                    for(String eml:Player)
                    {
                        type=type+eml;
                    }
                   }
                    point=request.getParameter("points");
                    bal=request.getParameter("balance");
                   
                   if(request.getParameterValues("team")!=null)
                   { 
                       String Team[]=request.getParameterValues("team");
                    for(String eml:Team)
                    {
                        team=team+eml;
                    }
                       
                   }
                   if(type.equals("batsman"))
                   {
     
                       Query="Update teams_info set Batsman=Batsman+1,Points=Points+'"+point+"',balance=balance+'"+bal+"'where Team_Name='"+team+"'";
                       query_1="Update player set batsman=batsman-1";
                   }
                   if(type.equals("bowler"))
                   {
     
                    Query= "Update teams_info set Bowler=Bowler+1,Points=Points+'"+point+"',balance=balance+'"+bal+"'where Team_Name='"+team+"'";
                    query_1="Update player set bowler=bowler-1";
                   }
                   if(type.equals("all"))
                   {
                       Query="Update teams_info set All_Rounder=All_Rounder+1,Points=Points+'"+point+"',balance=balance+'"+bal+"'where Team_Name='"+team+"'";
                       query_1="Update player set all_rounder=all_rounder-1";
                   }
                   
                 }
               if(Query.equals("")==false)
               {
              Statement stmt=con.createStatement();
              int i=stmt.executeUpdate(Query);
              int j=stmt.executeUpdate(query_1);
              
              /*while(rs.next())
              {
              out.println(rs.getString(1)+""+rs.getString(2)+""+rs.getString(3)+""+rs.getString(4)+""+rs.getString(5));
              }*/
               
             }
             
             
         %>--%>
    <center>
        <fieldset><legend>MOCK IPL-AUCTION</legend>
            <table  cellspacing="10px" cellpadding="5px">

                <form action="submission.jsp" method="get">

                    <tr><td>Team</td><td><select name="team" required>
                                <option >--select team--</option>
                                <option value="kkr">Kolkata Knight Riders</option>
                                <option value="csk">Chennai Super Kings</option>
                                <option value="mi">Mumbai Indians</option>
                                <option value="dd">Delhi DareDevils</option>
                                <option value="rcb">Royal Challengers Bangalore</option>
                                <option value="kxi">Kings XI Punjab</option>
                                <option value="srh">SunRisers Hyderabad</option>
                                <option value="rr">Rajasthan Royals</option>
								<option value="gjl">Gujrat Lions</option>
								<option value="rp">Rising Pune</option>
                            </select></td></tr>
                    <tr><td>Player Type</td><td><select name="player" required>
                                <option>--select team--</option>
                                <option value="batsman">Batsman</option>
                                <option value="bowler">Bowler</option>
                                <option value="all">All Rounder</option>

                            </select></td></tr>
                    <tr><td>Points</td><td><input type="text" name="points" required placeholder="points of player" id="points_1" onblur="validate_points();"></td></tr>
                    <tr><td>Sold In(Amt)</td><td><input type="text" name="balance" required placeholder="Amount at which player is brought" id="balance_1" onblur="validate_balance();"</td></tr>
                    <tr><td></td><td><input type="submit" name="sb" value="SOLD" style='background-color:#049aff;text-align:center;padding:5px;color:white; font-size:15px;'></td><td><input type="submit" name="sb" value="UNSOLD" style='background-color:#049aff;text-align:center;padding:5px;color:white; font-size:15px;'></td></tr>
                </form>
            </table>
        </fieldset>
        <table>

            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "password");
                Statement stmt1 = con.createStatement();
                ResultSet rs1 = stmt1.executeQuery("select * from teams_in"
                        + "fo order by points desc");
                while (rs1.next()) {
                    int bala = (600000000 - Integer.parseInt(rs1.getString("balance")));
                    out.println("<tr><td width='20%'>" + rs1.getString("Team_Name") + ""
                            + "</td>"
                            + "<td><font color='grey' size='3'>" + bala + "/-</font></td>"
                            + "<td align='center'><img src='images/logo/bat.png' width='20px' height='20px'>&nbsp;X&nbsp;<font color='#f3be30' size='5'>" + rs1.getString("Batsman") + "</font></td>"
                            + "<td><img src='images/logo/ball.png' width='20px' height='20px'>&nbsp;X&nbsp;<font color='#f3be30' size='5'>" + rs1.getString("Bowler") + "</font></td>"
                            + "<td align='center'><img src='images/logo/all.png' width='20px' height='20px'>&nbsp;X&nbsp;<font color='#f3be30' size='5'>" + rs1.getString("All_Rounder") + "</font></td></td>"
                            + "<td id='point' width='10%'  align='center' ><font color='black' size='5'>" + rs1.getString("Points") + "</font></td></tr>"
                            + "<tr><td align='center'></td></tr>"
                            + "<tr></tr>");

                }%>
            <%

            %>

        </table>
    </center>
</body>
</html>
