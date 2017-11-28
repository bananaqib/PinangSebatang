/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

import connection.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import coreservlet.LoginBean;
import java.sql.*;

/**
 *
 * @author kerol
 */
@WebServlet(name = "createAppointmentServlet", urlPatterns = {"/createAppointmentServlet"})
public class createAppointmentServlet extends HttpServlet {

public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException{
response.setContentType("text/html");
PrintWriter pw = response.getWriter();

String connectionURL = "jdbc:mysql://localhost:3306/logintest";
Connection connection;
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;

String firstNameDB = "";
String lastNameDB = "";
String matricDB = "";


HttpSession session = request.getSession(true);
String usernamedb1 = (String)session.getAttribute("currentSessionUser");

try{
    
con = ConnectionManager.createConnection();
statement = con.createStatement();
resultSet = statement.executeQuery("select FirstName,LastName,matric from users WHERE username = '"+usernamedb1+"'");
while(resultSet.next())
{
firstNameDB = resultSet.getString("FirstName");
lastNameDB = resultSet.getString("LastName");
matricDB = resultSet.getString("matric");
}

String apmntMatric = matricDB;
String apmntfullName = firstNameDB+" "+lastNameDB;
String apmntType = request.getParameter("appType");
String apmntDate = request.getParameter("appDate");
String apmntDoc = request.getParameter("appDoc");
String apmntDescr = request.getParameter("appDescr");
String apmntStatus = "Pending";

Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL, "root", "1234");
PreparedStatement pst = connection.prepareStatement("insert into appointment(username,patient_name,matric,type,date,doctor,description,status) values(?,?,?,?,?,?,?,?)");
pst.setString(1,usernamedb1);
pst.setString(2,apmntfullName);
pst.setString(3,apmntMatric);
pst.setString(4,apmntType);
pst.setString(5,apmntDate);
pst.setString(6,apmntDoc);
pst.setString(7,apmntDescr);
pst.setString(8,apmntStatus);
int i = pst.executeUpdate();
if(i!=0){
pw.println("Successfully insert data");
request.getRequestDispatcher("/patientIndex.jsp").forward(request, response);
}
else{
pw.println("failed to insert the data");
}
}
catch (Exception e){
pw.println(e);
}
}
}
