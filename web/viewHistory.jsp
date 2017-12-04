<%@page language="java" import="java.util.*" %>

<html>
<head>
<title>View Medical History</title>
</head>
<body> 
<table border="1" >
    <tr><td ><b>Name</b></td><td ><%=request.getAttribute("username1")%></td></tr>
<tr><td ><b>Name</b></td><td ><%=request.getAttribute("patient_name1")%></td></tr>
<tr><td ><b>Address</b></td><td ><%=request.getAttribute("address1")%></td></tr>
<tr><td ><b>Matric</b></td><td ><%=request.getAttribute("matric1")%></td></tr>
<tr><td ><b>Phone No</b></td><td ><%=request.getAttribute("phone1")%></td></tr>
<tr><td ><b>Appointment Type</b></td><td ><%=request.getAttribute("app_type1")%></td></tr>
<tr><td ><b>Appointment Description</b></td><td ><%=request.getAttribute("app_desc1")%></td></tr>
<tr><td ><b>Prescription History</b></td><td ></td></tr>
</table>
<%}%>
</body>
</html>
