/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

import java.util.List;
import connection.ConnectionManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import connection.ConnectionManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

/**
 *
 * @author kerol
 */
public class PrescriptionBean {

    private String name, descr;
    private int quantity;

    public PrescriptionBean() {
    }



    public List dataList(String id) {
        ArrayList list = new ArrayList();

        try {
            Connection con = ConnectionManager.createConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from prescription where id='" + id + "'");
            while (rs.next()) {
                list.add(rs.getString("name"));
                list.add(rs.getString("descr"));
                list.add(rs.getString("quantity"));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public String getDescr() {
        return descr;
    }

    public int getQuantity() {
        return quantity;
    }

}
