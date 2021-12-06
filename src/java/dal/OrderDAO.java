/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Cart;
import model.Item;
import model.Order;

/**
 *
 * @author WacMac
 */
public class OrderDAO extends DBContext {
      
      public void addOrder(Order order, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            //add vào bảng Order
            String sql = "insert into [Orders] values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order.getUser());
            st.setString(2, date);
            st.setDouble(3, order.getTotal());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Add vao order");
        }
        try {
            //lấy ra id của Order vừa add
            String sql1 = "select top 1 ID from [Orders] order by ID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            //add vào bảng orderdetail
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into OrderDetails values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setString(2, i.getProduct().getPid());
                    
                    st2.setInt(3, i.getQuantity());
                    st2.setInt(4, i.getPrice());
                    st2.executeUpdate();
                }
            }

        } catch (SQLException e) {
            System.out.println("Them vao detail nhung o ngoai");
        }

        //update so luong trong bang Product sau khi ban
        String sql3 = "update Product set quantity = quantity - ? "
                + "where ProductID = ?";
        for (Item i : cart.getItems()) {
            try {
                PreparedStatement st3 = connection.prepareStatement(sql3);

                st3.setInt(1, i.getQuantity());
                st3.setString(2, i.getProduct().getPid());
                st3.executeUpdate();
            } catch (SQLException e) {
                System.out.println("update storage");
            }
        }
    }

    public int getOrderNum(String username) {
        int orderNum = 0;
        String sql = "SELECT userName, COUNT(OrderId) AS orderNum FROM dbo.[Order] WHERE userName = ? AND MONTH(Date) = MONTH(GETDATE()) GROUP BY userName";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                orderNum = rs.getInt(2);
            }
        } catch (SQLException ex) {
            System.out.println("lay so luong don hang");
        }
        return orderNum;
    }
}
