<%-- 
    Document   : submission
    Created on : Oct 15, 2015, 5:37:47 PM
    Author     : ravishankar dubey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,javax.servlet.RequestDispatcher,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            try {
				
                String Query = "";
                String query_1 = "";
                String type = "";
                String type1 = "";
                String team = "";
                String point = "";
                String bal = "";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "password");

                {
					if(request.getParameter("sb").equals("SOLD"))
					{

							if (request.getParameterValues("player") != null) {
								String Player[] = request.getParameterValues("player");
								for (String eml : Player) {
									type = type + eml;
								}
								//  ses.setAttribute("type",type);
							}
							point = request.getParameter("points");
							bal = request.getParameter("balance");

							if (request.getParameterValues("team") != null) {
								String Team[] = request.getParameterValues("team");
								for (String eml : Team) {
									team = team + eml;
								}
								
						  //ses.setAttribute("team",team);

							}
							if (type.equals("batsman")) {

								Query = "Update teams_info set Batsman=Batsman+1,Points=Points+'" + point + "',balance=balance+'" + bal + "'where Team_Name='" + team + "'";
								query_1 = "Update player set batsman=batsman-1";
							}
							if (type.equals("bowler")) {

								Query = "Update teams_info set Bowler=Bowler+1,Points=Points+'" + point + "',balance=balance+'" + bal + "'where Team_Name='" + team + "'";
								query_1 = "Update player set bowler=bowler-1";
							}
							if (type.equals("all")) {
								Query = "Update teams_info set All_Rounder=All_Rounder+1,Points=Points+'" + point + "',balance=balance+'" + bal + "'where Team_Name='" + team + "'";
								query_1 = "Update player set all_rounder=all_rounder-1";
							}
							 if (Query.equals("") == false) {
					
									Statement stmt = con.createStatement();
									
									int i = stmt.executeUpdate(Query);
									int j = stmt.executeUpdate(query_1);
								   
								}
					}
					if(request.getParameter("sb").equals("UNSOLD"))
					{
							if (request.getParameterValues("player") != null) {
								String Player[] = request.getParameterValues("player");
								for (String eml : Player) {
									type = type + eml;
								}
							}
							
							if (type.equals("batsman")) {

								Query = "Update player set batsman=batsman-1";
								query_1 = "Update player set unsold_batsman=unsold_batsman+1";
							}
							if (type.equals("bowler")) {
								Query = "Update player set bowler=bowler-1";
								query_1 = "Update player set unsold_bowler=unsold_bowler+1";
							}
							if (type.equals("all")) {
								Query = "Update player set all_rounder=all_rounder-1";
								query_1 = "Update player set unsold_all_rounder=unsold_all_rounder+1";
							}
							 if (Query.equals("") == false) {
									Statement stmt = con.createStatement();
									int i =stmt.executeUpdate(Query);
									int j = stmt.executeUpdate(query_1);
									}
					
                   
					}

                }
				
               
				
                
                session.invalidate();
                RequestDispatcher rd = request.getRequestDispatcher("admin_panel.jsp");
                rd.forward(request, response);

            } catch (Exception e) {
            }
        %>
    </body>
</html>
