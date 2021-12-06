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
public class Product implements Serializable{
    private String pid;
    private String pname;
    private String pmodel;
    private String manufacturer;
    private int price;
    private String image;
    private String releaseDate;
    private String descript;
    private int quantity;
    private int cid;

    public Product() {
    }

    public Product(String pid, String pname, String pmodel, String manufacturer, int price, String image, String releaseDate, String descript, int quantity, int cid) {
        this.pid = pid;
        this.pname = pname;
        this.pmodel = pmodel;
        this.manufacturer = manufacturer;
        this.price = price;
        this.image = image;
        this.releaseDate = releaseDate;
        this.descript = descript;
        this.quantity = quantity;
        this.cid = cid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPmodel() {
        return pmodel;
    }

    public void setPmodel(String pmodel) {
        this.pmodel = pmodel;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "Product{" + "pid=" + pid + ", pname=" + pname + ", pmodel=" + pmodel + ", manufacturer=" + manufacturer + ", price=" + price + ", image=" + image + ", releaseDate=" + releaseDate + ", descript=" + descript + ", quantity=" + quantity + ", cid=" + cid + '}';
    }

    
 
}
