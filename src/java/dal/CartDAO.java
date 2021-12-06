/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Cart;
import model.Item;
import model.Product;
import dal.DBContext;

/**
 *
 * @author WacMac
 */
public class CartDAO extends DBContext {
      public Cart getCart(String userName) {
        Cart cart = new Cart(userName);
        String sql = "SELECT * FROM dbo.Product p INNER JOIN cart c ON p.ProductID = c.ProductID where [user] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
                int quantity = rs.getInt(14);
                int price = p.getPrice();
                Item t = new Item(p, quantity, price);
                cart.addItem(t);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cart;
    }
      public static void main(String[] args) {
        CartDAO db = new CartDAO();
          System.out.println(db.getCart("sa"));
    }

    public void updateCart(Cart cart) {
        String sql1 = "DELETE FROM dbo.cart WHERE [user] = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, cart.getUsername());
            st1.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        for (int i = 0; i > cart.getItems().size(); i++) {
            String sql2 = "INSERT INTO dbo.cart VALUES (?,?,?,?,?)";
            Item t = cart.getItems().get(i);
            try {
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setString(1, t.getProduct().getImage());
                st2.setString(2, cart.getUsername());
                st2.setString(3, t.getProduct().getPid());
                st2.setInt(4, t.getQuantity());
                st2.setInt(5, t.getPrice());
                st2.executeUpdate();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

}
