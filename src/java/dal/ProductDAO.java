/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author WacMac
 */
public class ProductDAO extends DBContext {
    public List<Product> getProductAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.ProductID,p.ProductName,p.ProductModel,p.Manufacturer,p.Price,p.ReleaseDate,p.image,p.Description,p.Quantity,p.cid FROM dbo.Product p";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getString("ProductID"));
                p.setPname(rs.getString("ProductName"));
                p.setPmodel(rs.getString("ProductModel"));
                p.setManufacturer(rs.getString("Manufacturer"));
                p.setPrice(rs.getInt("Price"));
                p.setReleaseDate(rs.getString("ReleaseDate"));
                p.setImage(rs.getString("image"));
                p.setDescript(rs.getString("Description"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCid(rs.getInt("cid"));
                list.add(p);   }
        } catch (SQLException e) {
            System.out.println(e);     }
        return list;  }

    public List<Product> getProductByPage(List<Product> list,
            int start, int end) {
        List<Product> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(list.get(i)); }
        return t; }

    public List<Product> getProductTop() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.ProductID,p.ProductName,p.image,p.Price,p.Description from Product p where p.ProductID<=7 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getString("ProductID"));
                p.setPname(rs.getString("ProductName"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("Price"));
                p.setDescript(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int delete(String id) {
        String sql = "delete from product where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);      
        }
        return 0;  
    }

    public List<Product> SearchProduct(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + " WHERE p.ProductName LIKE '%" + key + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getString("ProductID"));
                p.setPname(rs.getString("ProductName"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescript(rs.getString("Description"));
                list.add(p);        
            }
        } catch (SQLException e) 
        {            
            System.out.println(e);  
        }
   return list;  
    }

    public List<Product> getProductBrand(int brandId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.ProductID,p.ProductName,p.ProductModel,p.Manufacturer,p.Price,p.ReleaseDate,p.image,p.Description,p.Quantity,p.cid,c.id,c.brand FROM dbo.Product p,dbo.Category c \n"
                + " WHERE p.cid=c.id AND c.id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getString("ProductID"));
                p.setPname(rs.getString("ProductName"));
                p.setPmodel(rs.getString("ProductModel"));
                p.setManufacturer(rs.getString("Manufacturer"));
                p.setPrice(rs.getInt("Price"));
                p.setReleaseDate(rs.getString("ReleaseDate"));
                p.setImage(rs.getString("image"));
                p.setDescript(rs.getString("Description"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCid(rs.getInt("cid"));
                list.add(p);          }
        } catch (SQLException e) {
            System.out.println(e);     }
        return list; }

    public int deleteproduct(String id) {
        String sql = "delete from Product \n"
                + "where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);     
        }
        return 0;  
    }

   

    public int updateProduct(Product p) {
        //chuan duong dan sql
        String sql = "Update Product set ProductName=?,ProductModel=?,price=?,\n" 
                 +"quantity=?,[Description]=?,cid=?,[image]=?,Manufacturer=?,ReleaseDate=? "
                + "where ProductID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getPname());
            st.setString(2, p.getPmodel());
            st.setInt(3, p.getPrice());
            st.setInt(4, p.getQuantity());
            st.setString(5, p.getDescript());
            st.setInt(6, p.getCid());
            st.setString(7, p.getImage());
            st.setString(8, p.getManufacturer());
            st.setString(9, p.getReleaseDate());
            st.setString(10, p.getPid());
            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    

    public Product getProductbyId(String id) {
        String sql = "select * from Product where ProductID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getString("ProductID"));
                p.setPname(rs.getString("ProductName"));
                p.setPmodel(rs.getString("ProductModel"));
                p.setManufacturer(rs.getString("Manufacturer"));
                p.setPrice(rs.getInt("price"));
                p.setImage(rs.getString("image"));
                p.setReleaseDate(rs.getString("ReleaseDate"));
                p.setDescript(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCid(rs.getInt("cid"));
                return p;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductCRUD() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.ProductID,p.ProductModel, p.ProductName,p.Manufacturer,p.image,  p.price,p.ReleaseDate , p.description, p.quantity,p.cid, c.id, c.brand\n"
                + " FROM dbo.Product p, dbo.Category c WHERE p.cid=c.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getString("ProductID"));
                p.setPname(rs.getString("ProductName"));
                p.setPmodel(rs.getString("ProductModel"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescript(rs.getString("description"));
                p.setManufacturer(rs.getString("Manufacturer"));
                p.setReleaseDate(rs.getString("ReleaseDate"));
                p.setCid(rs.getInt("cid"));
                list.add(p);
            }

        } catch (SQLException e) {
        }
        return list;
    }

    public int add(Product p) {
        String sql = "insert into Product values(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getPid());
            st.setString(2, p.getPname());
            st.setString(3, p.getPmodel());
            st.setString(4, p.getManufacturer());
            st.setInt(5, p.getPrice());
            st.setString(6, p.getImage());
            st.setString(7, p.getReleaseDate());
            st.setString(8, p.getDescript());
            st.setInt(9, p.getQuantity());
            st.setInt(10, p.getCid());
            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);      }
        return 0;  }
    public static void main(String[] args) {
        ProductDAO db = new ProductDAO();
        db.add(new Product("1", "Oculus Quest", "Oculus","Facebook",14900000,"images/quest.jpg","2019-04-12","Quest",3,1));
//            System.out.println(db.deleteproduct("30"));
System.out.println(db.getProductBrand(4));
    }
}
