<%@page language="java" import="java.util.*" %>

<html>
<head>
<title>Update Medical Record</title>
</head>
<body> 
<table border="1" width="303">
<tr>
<td ><b>ID</b></td>
<td ><b>USERNAME</b></td>
<td ><b>PATIENT NAME</b></td>
<td ><b>MATRIC</b></td>
<td ><b>TYPE</b></td>
<td ><b>DATE</b></td>
<td ><b>DESCRIPTION</b></td>
<td ><b>VIEW</b></td>
</tr>
<%Iterator itr;%>
<% List data=(List)request.getAttribute("data");
for (itr=data.iterator(); itr.hasNext(); )
{
%>
<tr>
<td ><%=itr.next()%></td>
<td ><%=itr.next()%></td>
<td ><%=itr.next()%></td>
<td ><%=itr.next()%></td>
<td ><%=itr.next()%></td>
<td ><%=itr.next()%></td>
<td ><%=itr.next()%></td>
<%}%>
<%Iterator itr1;%>
<% List ID=(List)request.getAttribute("id");
for (itr1=ID.iterator(); itr1.hasNext(); )
{%>
<td><a href = "viewHistory.jsp?id=<%=itr1.next()%>">View</a></td><%}%>
</tr>

</table>
</body>
</html>