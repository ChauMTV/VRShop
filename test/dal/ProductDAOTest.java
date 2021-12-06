/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author WacMac
 */
public class ProductDAOTest {
    
    public ProductDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getProductAll method, of class ProductDAO.
     */
    @Test
    public void testGetProductAll() {
        System.out.println("getProductAll");
        ProductDAO instance = new ProductDAO();
        int count = 15;
        String first = "1";
        String last ="15";
   
        List<Product> result = instance.getProductAll();
        assertEquals(count, result.size());
        assertEquals(first, result.get(0).getPid());
        assertEquals(last, result.get(14).getPid());
        // TODO review the generated test code and remove the default call to fail.
        System.out.println(result.get(0));
        System.out.println(result.get(14));
    }

//    /**
//     * Test of getProductByPage method, of class ProductDAO.
//     */
//    @Test
//    public void testGetProductByPage() {
//        System.out.println("getProductByPage");
//        List<Product> list = null;
//        int start = 0;
//        int end = 0;
//        ProductDAO instance = new ProductDAO();
//        List<Product> expResult = null;
//        List<Product> result = instance.getProductByPage(list, start, end);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//      
//    }
//
//    /**
//     * Test of getProductTop method, of class ProductDAO.
//     */
    @Test
    public void testGetProductTop() {
        System.out.println("getProductTop");
        ProductDAO instance = new ProductDAO();
        int expResult = 7;
        int result = instance.getProductTop().size();
        assertEquals(expResult, result);
        
        // TODO review the generated test code and remove the default call to fail.
      
    }
//
//    /**
//     * Test of delete method, of class ProductDAO.
//     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        String id = "1";
        ProductDAO instance = new ProductDAO();
        int expResult = 1;
        int result = instance.delete(id);
        assertNotEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
      
    }
//
//    /**
//     * Test of SearchProduct method, of class ProductDAO.
//     */
    @Test
    public void testSearchProduct() {
        System.out.println("SearchProduct");
        String key = "Oculus Quest";
        ProductDAO instance = new ProductDAO();
        List<Product> expResult = new ArrayList<>();
        Product p = new Product();
        p.setPid("1");
        p.setPname("Oculus Quest");
        p.setManufacturer("Facebook");
        p.setPrice(14900000);
        p.setImage("images/quest.jpg");
        p.setReleaseDate("2019-04-12");
        p.setDescript("Quest");
        p.setQuantity(3);
        p.setCid(1);
        List<Product> result = instance.SearchProduct(key);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
      
    }
//
//    /**
//     * Test of getProductBrand method, of class ProductDAO.
//     */
    @Test
    public void testGetProductBrand() {
        System.out.println("getProductBrand");
        int brandId = 1;
        ProductDAO instance = new ProductDAO();
        int expResult =4 ;
        List<Product> result = instance.getProductBrand(brandId);
        assertEquals(expResult, result.size());
        // TODO review the generated test code and remove the default call to fail.
      
    }

//    /**
//     * Test of deleteproduct method, of class ProductDAO.
//     */
    @Test
    public void testDeleteproduct() {
        System.out.println("deleteproduct");
        String id = "";
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.deleteproduct(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
      
    }

//    /**
//     * Test of updateProduct method, of class ProductDAO.
//     */
    @Test
    public void testUpdateProduct() {
        System.out.println("updateProduct");
        Product p = null;
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.updateProduct(p);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
      
    }

//    /**
//     * Test of getProductbyId method, of class ProductDAO.
//     */
    @Test
    public void testGetProductbyId() {
        System.out.println("getProductbyId");
        String id = "2";
        ProductDAO instance = new ProductDAO();
        Product expResult = new Product("1", "Oculus Quest 2", "Oculus", "Facebook", 8900000, "images/quest 2.jpg", "2020-11-20", "Oculus Quest", 7, 1);
        Product result = instance.getProductbyId(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
      
    }
//
//    /**
//     * Test of getProductCRUD method, of class ProductDAO.
//     */
    @Test
    public void testGetProductCRUD() {
        System.out.println("getProductCRUD");
        ProductDAO instance = new ProductDAO();
        List<Product> expResult = null;
        List<Product> result = instance.getProductCRUD();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
      
    }
//
//    /**
//     * Test of add method, of class ProductDAO.
//     */
//    @Test
//    public void testAdd() {
//        System.out.println("add");
//        Product p = null;
//        ProductDAO instance = new ProductDAO();
//        int expResult = 0;
//        int result = instance.add(p);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//      
//    }
//
//    /**
//     * Test of main method, of class ProductDAO.
//     */
//    @Test
//    public void testMain() {
//        System.out.println("main");
//        String[] args = null;
//        ProductDAO.main(args);
//        // TODO review the generated test code and remove the default call to fail.
//      
//    }
    
}
