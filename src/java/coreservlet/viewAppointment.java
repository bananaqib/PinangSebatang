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
import connection.ConnectionManager;
import java.util.*;

@WebServlet(name = "viewAppointment", urlPatterns = {"/viewAppointment"})

public class viewAppointment extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

//        String type, descr, date, doctor, idappointmentDB;
        HttpSession session = request.getSession(true);

        String usernamedb1 = (String) session.getAttribute("currentSessionUser");

        List list = new ArrayList();

        try {
            Connection con = ConnectionManager.createConnection();
            Statement st = con.createStatement();
            st.executeQuery("SELECT * FROM appointment WHERE username='" + usernamedb1 + "'");
            ResultSet rs = st.getResultSet();
            while (rs.next()) {
                list.add(rs.getString("type"));
                list.add(rs.getString("description"));
                list.add(rs.getString("date"));
                list.add(rs.getString("doctor"));
                list.add(rs.getString("status"));

            }
            request.setAttribute("data", list);
            request.getRequestDispatcher("/myAppointment.jsp").forward(request, response);

        } catch (Exception e2) {
            e2.printStackTrace();
        } finally {
            out.close();
        }
    }

}
