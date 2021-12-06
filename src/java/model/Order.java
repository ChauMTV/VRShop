/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author WacMac
 */
public class Order implements Serializable{
    private int id;
    private String user;
    private String OrderDate;
    private int total;
    public Order() {
    }

    public Order(int id, String user, int total) {
        this.id = id;
        this.user = user;
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        this.OrderDate = sdf.format(date);
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", user=" + user + ", OrderDate=" + OrderDate + ", total=" + total + '}';
    }
    
}
