/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlet;

/**
 *
 * @author kerol
 */
public class PrescriptionBean {
    private String name, descr;
    private int quantity;
      
    public PrescriptionBean() {
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
