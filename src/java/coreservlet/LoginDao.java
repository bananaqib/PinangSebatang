/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;
//LoginDao.java

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import bean.LoginBean;
import connection.ConnectionManager;

public class LoginDao {

    public String authenticateUser(LoginBean loginBean) {
        String userName = loginBean.getUserName();
        String password = loginBean.getPassword();
        String firstName = loginBean.getfirstname();
        String lastName = loginBean.getlastname();
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        String roleDB = "";
        String firstNameDB = "";
        String lastNameDB = "";

        try {
            con = ConnectionManager.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select username,password,role,FirstName,LastName from users");
            while (resultSet.next()) {
                userNameDB = resultSet.getString("username");
                passwordDB = resultSet.getString("password");
                roleDB = resultSet.getString("role");
                firstNameDB = resultSet.getString("FirstName");
                lastNameDB = resultSet.getString("LastName");
                if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("1")) {
                    return "1";
                } else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("2")) {
                    return "2";
                } else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("3")) {
                    return "3";
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
}
