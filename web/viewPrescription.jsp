<%-- 
    Document   : viewPrescription
    Created on : Dec 18, 2017, 5:33:49 PM
    Author     : kerol
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="connection.ConnectionManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width=25% border=1>
            <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Quantity</th>                                               
            </tr>
            <%
                Connection con = ConnectionManager.createConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from prescription");;
                while (rs.next()) {
//                    String name = rs.getString("name");
//                    String prescdb = rs.getString("prescription");
//                    String date = rs.getString("date");                    
                    int count = 0;
                    String id = rs.getString("id");
            %>
            <tr>
                <td><%= count%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("quantity")%></td>
                <td><%=rs.getString("descr")%></td>                
                <td><a href=<%= "\"updatePrescription?id=" + id + "\""%>>Update</a></td>
                <% count++;
                    }%>
            </tr>                             
        </table>
    </body>
</html>
