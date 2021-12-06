/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author WacMac
 */
public class Customer implements Serializable{
    private String username;
    private String fullname;
    private String phone;
    private String address;
    private String email;

    public Customer() {
    }

    public Customer(String username, String fullname, String phone, String address, String email) {
        this.username = username;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Customer{" + "username=" + username + ", fullname=" + fullname + ", phone=" + phone + ", address=" + address + ", email=" + email + '}';
    }

  
}
