<%-- 
    Document   : addHistory
    Created on : Dec 18, 2017, 7:39:50 PM
    Author     : MSI
--%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<HTML><HEAD><TITLE></TITLE></HEAD>
<BODY>
<H1 ALIGN="CENTER">Add Prescription</H1>
<% String matric1 = request.getParameter("matric"); %>
<% Connection con = ConnectionManager.createConnection();
            String FirstNameDB = "";
            String LastNameDB = "";
            String Fullname = "";
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT FirstName,LastName from users WHERE matric = '"+ matric1 +"'");
            
            while (rs.next ()){
                FirstNameDB = rs.getString("FirstName");
                LastNameDB = rs.getString("LastName");
                Fullname = FirstNameDB+" "+LastNameDB;
            }

        %>

<FORM ACTION="givePrescription" method="post">
    Name: <% out.print(Fullname); %><br>
    Matric: <% out.print(matric1); %><br>
    
    <input type="hidden" value="<% out.print(matric1); %>" name='mat'>
  <select name="ubat">
    <option value="1">Cough Syrup</option>
    <option value="2">Panadol</option>
    <option value="3">Dental Floss</option>
    <option value="4">Lozenge</option>
  </select>
  <br><br>
  

    
  
  <CENTER><INPUT TYPE="SUBMIT"></CENTER>
</FORM>

</BODY></HTML>