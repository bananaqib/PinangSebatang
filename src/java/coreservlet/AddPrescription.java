/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import coreservlet.PrescriptionBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import connection.ConnectionManager;
import java.sql.PreparedStatement;

/**
 *
 * @author kerol
 */
@WebServlet(name = "AddPrescription", urlPatterns = {"/AddPrescription"})
public class AddPrescription extends HttpServlet {

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
            out.println("<title>Servlet AddPrescription</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPrescription at " + request.getContextPath() + "</h1>");
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
        String name, descr;
        PrintWriter out = response.getWriter();
        int qty;
        name = request.getParameter("name");
        qty = Integer.parseInt(request.getParameter("qty"));
        descr = request.getParameter("descr");
        try {
            Connection con = ConnectionManager.createConnection();
            PreparedStatement pst = con.prepareStatement("insert into appointment(name, descr, quantity,) values(?,?,?)");
            pst.setString(1, name);
            pst.setString(2, descr);
            pst.setInt(3, qty);

            showConfirmation(request, out);
//            request.getRequestDispatcher("/viewPrescription.jsp").forward(request, response);
        } catch (Exception e) {
            out.println(e);
        }

    }

    private void showConfirmation(HttpServletRequest request,
            PrintWriter out) {
        out.println("<script type=\'text/javascript\'>");
        out.println("alert('Book Succesfully added');");
        out.println("location='./bookForm.jsp'");
        out.println("</script>");
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
