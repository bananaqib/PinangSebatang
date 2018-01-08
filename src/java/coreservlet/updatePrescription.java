/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

import bean.PrescriptionBean;
import connection.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kerol
 */
@WebServlet(name = "updatePrescription", urlPatterns = {"/updatePrescription"})
public class updatePrescription extends HttpServlet {

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
            out.println("<title>Servlet updatePrescription</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updatePrescription at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        PrescriptionBean p = new PrescriptionBean();
        List list = p.dataList(id);
        Iterator itr;
        for (itr = list.listIterator(); itr.hasNext();) {
            request.setAttribute("name", itr.next());
            request.setAttribute("descr", itr.next());
            request.setAttribute("quantity", itr.next());
        }

        request.setAttribute("id", id);
        RequestDispatcher rd = request.getRequestDispatcher("/updatePrescription.jsp");
        rd.forward(request, response);
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
        String name, descr, id;
        PrintWriter out = response.getWriter();
        int qty;
        id = request.getParameter("id");
        name = request.getParameter("name");
        qty = Integer.parseInt(request.getParameter("qty"));
        descr = request.getParameter("descr");
        try {
            Connection con = ConnectionManager.createConnection();
            PreparedStatement pst = con.prepareStatement("update prescription set name = ?, descr = ?, quantity = ? where id=" + id);
            pst.setString(1, name);
            pst.setString(2, descr);
            pst.setInt(3, qty);
            int i = pst.executeUpdate();
            if (i != 0) {
                showConfirmation(request, out);
            } else {
                out.println("failed to insert the data");
            }

//            request.getRequestDispatcher("/viewPrescription.jsp").forward(request, response);
        } catch (Exception e) {
            out.println(e);
        }
    }

    private void showConfirmation(HttpServletRequest request,
            PrintWriter out) {
        out.println("<script type=\'text/javascript\'>");
        out.println("alert('Prescription Successfully added');");
        out.println("location='./viewPrescription.jsp'");
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
