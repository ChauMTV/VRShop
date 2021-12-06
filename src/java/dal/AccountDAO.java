/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import com.sun.tools.ws.wsdl.document.jaxws.Exception;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Customer;

/**
 *
 * @author WacMac
 */
public class AccountDAO extends DBContext {
    public Account getAccount(String user, String pass){
         String sql="select * from account where username=? and password=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return new Account(rs.getString("username"), 
                        rs.getString("password"),rs.getString("role"));   }
        }catch(SQLException e){
            System.out.println(e);  }
        return null; }
    public int create(Account a){
        String sql="insert into account values(?,?,?)";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, "user");         
            return st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);    }
        return 0;  }
    public int insertAccountinfo(Customer c){
        String sql= "insert into customer values(?,?,?,?,?)";
        try{
            PreparedStatement st =connection.prepareStatement(sql);
            st.setString(1, c.getUsername());
            st.setString(2, c.getFullname());
            st.setString(3, c.getPhone());
            st.setString(4, c.getAddress());
            st.setString(5, c.getEmail());
            return st.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e);         
        }
        return 0; 
    }
    public Customer checkAccountExist(String email) {
        Customer u = new Customer();
        try {
            String query = "select * from Customer c where c.email =?";
            PreparedStatement pd = connection.prepareStatement(query);
            pd.setString(1, email);
            ResultSet rs = pd.executeQuery();
            while (rs.next()) {
                String username = rs.getString("UserName");
                String fullname = rs.getString("Fullname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                u.setAddress(address);
                u.setEmail(email);
                u.setFullname(fullname);
                u.setPhone(phone);
                u.setUsername(username);
                return u; 
            }     
        } catch (SQLException e) {
            System.out.println(e);  
        }
        return null; 
    }

    public Customer checkPhoneNumberExist(String phone) {
        Customer u = new Customer();
        try {
            String query = "select * from Customer c where c.phone =?";
            PreparedStatement pd = connection.prepareStatement(query);
            pd.setString(1, phone);
            ResultSet rs = pd.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                u.setAddress(address);
                u.setFullname(fullname);
                u.setPhone(phone);
                u.setUsername(username);
                return u; }
        } catch (SQLException e) {
            System.out.println(e); }
        return null; }
    
    public static void main(String[] args) {
        AccountDAO db = new AccountDAO();     
        Account a = db.getAccount("sa", "123");
            System.out.println(a.getUsername());
        if(a.getUsername().equals("sa")){
            System.out.printf("Yes");
        }else
            System.out.printf("No");
    }
    }

