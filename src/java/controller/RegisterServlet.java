/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Customer;

/**
 *
 * @author ADMIN
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String u=request.getParameter("user");
        String p=request.getParameter("pass");
        String f=request.getParameter("fullname");
        String phone= request.getParameter("phone");
        String ad=request.getParameter("address");
        String email=request.getParameter("email");
        String re_pass=request.getParameter("re_pass");
        AccountDAO db=new AccountDAO();
        Account a=db.getAccount(u, p);
        Customer mail =db.checkAccountExist(email);
        Customer ph = db.checkPhoneNumberExist(phone);
        if (u.isEmpty() || p.isEmpty() || f.isEmpty() || email.isEmpty() || phone.isEmpty() || ad.isEmpty()) {
            request.setAttribute("errorRegister", "B???n ch??a ??i???n h???t th??ng tin");
            request.getRequestDispatcher("register.jsp").forward(request, response);     
        }
        else if(a!=null){
            request.setAttribute("error","t??i kho???n "+ u +" ???? t???n t???i");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else if(!p.equals(re_pass)){
            request.setAttribute("error1", "M???t kh???u nh???p l???i kh??ng tr??ng v???i m???t kh???u ???? nh???p!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
         }
        else if(mail!=null){
            request.setAttribute("error2", "Mail ???? t???n t???i, xin vui l??ng nh???p mail kh??c");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }else if(ph!=null){
             request.setAttribute("error3", "S??? ??i???n tho???i ???? c?? t??i kho???n li??n k???t vui l??ng ki???m tra");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        
        
       else{
            db.create(new Account(u, p,"user"));
            request.setCharacterEncoding("UTF-8");
            db.insertAccountinfo(new Customer(u, f, phone, ad, email));
            response.sendRedirect("login.jsp");
        }
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
