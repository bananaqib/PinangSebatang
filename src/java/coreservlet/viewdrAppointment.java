/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "viewdrAppointment", urlPatterns = {"/viewdrAppointment"})
public class viewdrAppointment extends HttpServlet {

    private ServletConfig config;

    //Setting JSP page
    String page = "drAppointment.jsp";
    //String Status = "";
    String Doctor = "";

    /**
     *
     * @param config
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig config)
            throws ServletException {

        this.config = config;

    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        String currentuser = (String) session.getAttribute("currentSessionUser"); //set current session user to a variable
        //Establish connection to MySQL database
        String firstNameDB = "";
        String lastNameDB = "";

        String connectionURL = "jdbc:mysql://localhost:3306/logintest";
        Connection connection = null;
        ResultSet rs;
        response.setContentType("text/html");
        List dataList = new ArrayList();
        List dataList1 = new ArrayList();

        String connectionURL1 = "jdbc:mysql://localhost:3306/logintest";
        String connectionURL2 = "jdbc:mysql://localhost:3306/logintest";
        Connection connection1 = null;
        ResultSet rs1;

        try {

            // Load the database driver
            Class.forName("com.mysql.jdbc.Driver");

            // Get a Connection to the database
            connection1 = DriverManager.getConnection(connectionURL1, "root", "1234");

            //Select the data from the database
            String sql1 = "select FirstName, LastName from users WHERE username='" + currentuser + "'"; //getting firstname and lastname from database
            Statement s = connection1.createStatement();
            s.executeQuery(sql1);
            rs1 = s.getResultSet();

            while (rs1.next()) {

                //Add records into data list
                firstNameDB = rs1.getString("FirstName");
                lastNameDB = rs1.getString("LastName");

                Doctor = firstNameDB + " " + lastNameDB; //combine firstname and lastname
            }

            rs1.close();
            s.close();

        } catch (Exception e) {

            System.out.println("Exception is ;" + e);

        }

        try {

            // Load the database driver
            Class.forName("com.mysql.jdbc.Driver");

            // Get a Connection to the database
            connection = DriverManager.getConnection(connectionURL, "root", "1234");

            //Select the data from the database
            String sql = "select * from appointment WHERE doctor='" + Doctor + "'"; //compare status Accepted and Doctor fullname in appointment table
            Statement s = connection.createStatement();
            s.executeQuery(sql);
            rs = s.getResultSet();

            while (rs.next()) {

                //Add records into data list
                dataList.add(rs.getInt("idappointment")); //set result into array                
                dataList.add(rs.getString("patient_name"));
                dataList.add(rs.getString("date"));
                dataList.add(rs.getString("type"));
                dataList.add(rs.getString("matric"));
                dataList.add(rs.getString("description"));
                dataList.add(rs.getString("status"));

                dataList1.add(rs.getString("idappointment"));

            }
            Class.forName("com.mysql.jdbc.Driver");


        } catch (Exception e) {

            System.out.println("Exception is ;" + e);

        }

        request.setAttribute("data", dataList); //set attribute for data array
        request.setAttribute("data1", dataList1); //set attribute for data array
        request.setAttribute("doc", Doctor); //set attribute for id array

        //Disptching request
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);//forward to page medicalRecord.jsp

        if (dispatcher != null) {

            dispatcher.forward(request, response);

        }

    }

}
