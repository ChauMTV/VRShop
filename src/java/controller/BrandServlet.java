/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BrandDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.brand;

/**
 *
 * @author WacMac
 */
public class BrandServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BrandServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BrandServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           
         String id_raw=request.getParameter("id");
        int id;
        if(id_raw==null){
            id=1;
        }else
            id=Integer.parseInt(id_raw);
        
        ProductDAO db = new ProductDAO();
        List<Product> list = db.getProductBrand(id);
        
         int size=list.size();
        //so phan tu trong mot trang
        int numperPage=8;
        //so trang
        int numPage=size/numperPage+(size%numperPage==0?0:1);
        //trang ma nguoi dung chon
        String spage=request.getParameter("page");
        int page;
        if(spage==null){
            //lucs dau moi chay
            page = 1;
        }else{
            page = Integer.parseInt(spage);
        }
        //phan tu dau tien va cuoi cung cua trang thu page
        int start,end;
        start=(page-1)*numperPage;
        end=Math.min(size, page*numperPage);
        //danh sach phan tu thu page
        List<Product> arr = db.getProductByPage(list, start, end);
        
        request.setAttribute("num", numPage);
        request.setAttribute("page", page);
        request.setAttribute("data", arr);
        
        BrandDAO brd = new BrandDAO();
        List<brand> blist = brd.getBrand();
        
        request.setAttribute("cats", blist);
        request.setAttribute("id", id);
        request.getRequestDispatcher("ProductBrand.jsp").forward(request, response);
        
    }

    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
