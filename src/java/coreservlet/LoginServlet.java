/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

//LoginServlet.java
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.LoginBean;
import coreservlet.LoginDao;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginServlet() {
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        LoginBean loginBean = new LoginBean();
        loginBean.setUserName(userName);
        loginBean.setPassword(password);
        loginBean.setfirstname(firstName);
        loginBean.setlastname(lastName);
        LoginDao loginDao = new LoginDao();
        try {
            String userValidate = loginDao.authenticateUser(loginBean);
            if (userValidate.equals("1")) {
                System.out.println("Doctor's Home");
                HttpSession session = request.getSession(); //Creating a session
                session.setAttribute("currentSessionUser", userName); //setting session attribute
                request.setAttribute("userName", userName);
                request.getRequestDispatcher("/drIndex.jsp").forward(request, response);
            } else if (userValidate.equals("2")) {
                System.out.println("Patient's Home");
                HttpSession session = request.getSession();
                session.setAttribute("currentSessionUser", userName);
                request.setAttribute("userName", userName);
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.getRequestDispatcher("/patientIndex.jsp").forward(request, response);
            } else if (userValidate.equals("3")) {
                System.out.println("Staff's Home");
                HttpSession session = request.getSession();
                session.setAttribute("currentSessionUser", userName);
                request.setAttribute("userName", userName);
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.getRequestDispatcher("/staffIndex.jsp").forward(request, response);
            } else {
                System.out.println("Error message = " + userValidate);
                request.setAttribute("errMessage", userValidate);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (IOException e1) {
            e1.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    } //End of doPost()
}
