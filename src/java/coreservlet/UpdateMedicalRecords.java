package coreservlet;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdateMedicalRecords", urlPatterns = {"/UpdateMedicalRecords"})
public class UpdateMedicalRecords extends HttpServlet {

    private ServletConfig config;

    //Setting JSP page
    String page = "medicalRecord.jsp";
    String Status = "Accepted";
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
        Connection connection2 = null;
        ResultSet rs;
        response.setContentType("text/html");
        List dataList = new ArrayList();
        List dataList1 = new ArrayList();

        String connectionURL1 = "jdbc:mysql://localhost:3306/logintest";
        String connectionURL2 = "jdbc:mysql://localhost:3306/logintest";
        Connection connection1 = null;
        ResultSet rs1;
        ResultSet rs2;

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
            String sql = "select * from appointment WHERE status= '" + Status + "' && doctor='" + Doctor + "'"; //compare status Accepted and Doctor fullname in appointment table
            Statement s = connection.createStatement();
            s.executeQuery(sql);
            rs = s.getResultSet();

            while (rs.next()) {

                //Add records into data list
                dataList.add(rs.getInt("idappointment")); //set result into array
                dataList.add(rs.getString("username"));
                dataList.add(rs.getString("patient_name"));
                dataList.add(rs.getString("matric"));
                dataList.add(rs.getString("type"));
                dataList.add(rs.getString("date"));
                dataList.add(rs.getString("description"));

            }
            Class.forName("com.mysql.jdbc.Driver");

            // Get a Connection to the database
            connection2 = DriverManager.getConnection(connectionURL2, "root", "1234");

            //Select the data from the database
            String sql2 = "select * from appointment WHERE status= '" + Status + "' && doctor='" + Doctor + "'"; //getting idappointment for View later on...
            Statement s2 = connection2.createStatement();
            s2.executeQuery(sql2);
            rs2 = s2.getResultSet();

            while (rs2.next()) {

                //Add records into data list
                dataList1.add(rs2.getString("matric")); // set matric in array

            }
        } catch (Exception e) {

            System.out.println("Exception is ;" + e);

        }

        request.setAttribute("data", dataList); //set attribute for data array
        request.setAttribute("matric", dataList1); //set attribute for id array

        //Disptching request
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);//forward to page medicalRecord.jsp

        if (dispatcher != null) {

            dispatcher.forward(request, response);

        }

    }

}
