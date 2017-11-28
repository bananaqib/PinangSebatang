/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "viewAppointment", urlPatterns = {"/viewAppointment"})

public class viewAppointment extends HttpServlet {
       public void doGet(HttpServletRequest request, HttpServletResponse response)
                     throws ServletException, IOException {
              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              
              HttpSession session = request.getSession(true);
              String usernamedb1 = (String)session.getAttribute("currentSessionUser");                     
              try{
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest","root","1234");               
                     PreparedStatement ps=con.prepareStatement("select * from appointment where username=?");
                     ps.setString(1,usernamedb1);                   
                     out.print("<table width=25% border=1>");
                     out.print("<center><h1>Result:</h1></center>");
                     ResultSet rs=ps.executeQuery();                
                     /* Printing column names */
                     ResultSetMetaData rsmd=rs.getMetaData();
                     while(rs.next())
                        {
                     out.print("<tr>");
                     out.print("<td>"+rsmd.getColumnName(1)+"</td>");
                        out.print("<td>"+rs.getString(1)+"</td></tr>");
                        out.print("<tr><td>"+rsmd.getColumnName(2)+"</td>");
                        out.print("<td>"+rs.getString(2)+"</td></tr>");
                        out.print("<tr><td>"+rsmd.getColumnName(3)+"</td>");
                        out.print("<td>"+rs.getString(3)+"</td></tr>");
                        out.print("<tr><td>"+rsmd.getColumnName(4)+"</td>");
                        out.print("<td>"+rs.getString(4)+"</td></tr>");    
                        out.print("<tr><td>"+rsmd.getColumnName(5)+"</td>");
                        out.print("<td>"+rs.getString(5)+"</td></tr>");   
                        out.print("<tr><td>"+rsmd.getColumnName(6)+"</td>");
                        out.print("<td>"+rs.getString(6)+"</td></tr>");   
                        out.print("<tr><td>"+rsmd.getColumnName(7)+"</td>");
                        out.print("<td>"+rs.getString(7)+"</td></tr>");   
                        out.print("<tr><td>"+rsmd.getColumnName(8)+"</td>");
                        out.print("<td>"+rs.getString(8)+"</td></tr>");   
                        out.print("<tr><td>"+rsmd.getColumnName(9)+"</td>");
                        out.print("<td>"+rs.getString(9)+"</td></tr>");   
                     }
                     out.print("</table>");
 
              }catch (Exception e2)
                {
                    e2.printStackTrace();
                }
 
              finally{out.close();
                }
       }
 
} 
