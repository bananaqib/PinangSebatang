<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>View Medical History</title>
</head>
<body> 
<table border="1" >
<tr><td ><b>Username</b></td><td ><%=request.getAttribute("username1")%></td></tr>
<tr><td ><b>Name</b></td><td ><%=request.getAttribute("patient_name1")%></td></tr>
<tr><td ><b>Address</b></td><td ><%=request.getAttribute("address1")%></td></tr>
<tr><td ><b>Matric</b></td><td ><%=request.getAttribute("matric1")%></td></tr>
<tr><td ><b>Phone No</b></td><td ><%=request.getAttribute("phone1")%></td></tr>
<tr><td ><b>Appointment Type</b></td><td ><%=request.getAttribute("app_type1")%></td></tr>
<tr><td ><b>Appointment Description</b></td><td ><%=request.getAttribute("app_desc1")%></td></tr>

 <%
            String mat = (String)request.getAttribute("matric1");
            
            Connection con = ConnectionManager.createConnection();
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from medical WHERE matric = '"+ mat +"'");
        %>


<tr><td ><b>Prescription History</b></td> 
     
    <%  while (rs.next()) {
                                                        String matricdb = rs.getString("matric");
                                                        String prescdb = rs.getString("prescription");
                                                        String date = rs.getString("date");                                                
         %>  
    
    
<td><%= prescdb %> &nbsp; <%= date %> <%}%></td>
                                    
                                     


</tr>
</table>

</body>
</html>
