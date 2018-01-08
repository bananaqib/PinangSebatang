/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

import connection.ConnectionManager;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "viewHistoryServlet", urlPatterns = {"/viewHistoryServlet"})

public class viewHistoryServlet extends HttpServlet {

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
        String matric = request.getParameter("matric");
//int id = Integer.parseInt(request.getParameter("ID"));
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String idappointmentDB = "";
        String usernameDB = "";
        String patient_nameDB = "";
        String addressDB = "";
        String matricDB = "";
        String phoneDB = "";
        String app_typeDB = "";
        String app_descDB = "";

        try {
            con = ConnectionManager.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select * from profile WHERE matric = '" + matric + "'");
            while (resultSet.next()) {
                idappointmentDB = resultSet.getString("idappointment");
                usernameDB = resultSet.getString("username");
                patient_nameDB = resultSet.getString("patient_name");
                addressDB = resultSet.getString("address");
                matricDB = resultSet.getString("matric");
                phoneDB = resultSet.getString("phone");


                if (matricDB.equals(matric)) {
                    request.setAttribute("idappointment1", idappointmentDB);
                    request.setAttribute("username1", usernameDB);
                    request.setAttribute("patient_name1", patient_nameDB);
                    request.setAttribute("address1", addressDB);
                    request.setAttribute("matric1", matricDB);
                    request.setAttribute("phone1", phoneDB);


                    request.getRequestDispatcher("/viewHistory.jsp").forward(request, response);
                }

//if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("1"))
//return "1";
//else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("2"))
//return "2";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
