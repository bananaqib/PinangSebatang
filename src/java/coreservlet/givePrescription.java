/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

import connection.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 *
 * @author kerol
 */
@WebServlet(name = "givePrescription", urlPatterns = {"/givePrescription"})
public class givePrescription extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet givePrescription</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet givePrescription at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String meesage = "masalah while";
//        String redirectURL1 = "test_error.jsp?error_meesage=asasa";
        String namePresc;
        String ubat = request.getParameter("ubat");
        String mat = request.getParameter("mat");
        Date dt = new Date();

        try {
            Connection con = ConnectionManager.createConnection();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st3 = con.createStatement();
            ResultSet rs = st.executeQuery("select * from prescription where id='" + ubat + "'");

            ResultSet rs1 = st1.executeQuery("select idappointment from profile where matric='" + mat + "'");

            while (rs.next()) {
                namePresc = rs.getString("name");

                PreparedStatement pst, pst2;
                pst = con.prepareStatement("insert into medical (matric, prescription, date) values(?,?,?)");

                pst.setString(1, mat);
                pst.setString(2, namePresc);
                pst.setString(3, dt.toString());

                ResultSet rs3 = st3.executeQuery("select * from prescription where id='" + ubat + "'");
                int rs33 = 0;
                while (rs3.next()) {

                    rs33 = rs3.getInt("quantity");

                }
                rs33 = rs33 - 1;

                pst2 = con.prepareStatement("update prescription set quantity ='" + rs33 + "' where id=?");

                pst2.setString(1, ubat);

//                    String redirectURL1 = "test_error.jsp?error_meesage=asasa";
//                    response.sendRedirect(redirectURL1);
                int i = pst.executeUpdate();
                int q = pst2.executeUpdate();

                if (i != 0 && q != 0) {

                    if (rs1.next()) {
                        String id = rs1.getString("idappointment");
                        out.println("<script type=\'text/javascript\'>");
                        out.println("alert('Prescription Successfully added');");
                        out.println("location='viewHistoryServlet?ID="+id+"'");
                        out.println("</script>");
                    }
                } else {
                    out.println("failed to insert the data");
                }

            }

//            request.getRequestDispatcher("/viewPrescription.jsp").forward(request, response);
        } catch (Exception e) {
            out.println(e);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
