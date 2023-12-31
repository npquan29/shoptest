/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartItemDAO;
import dal.ItemDAO;
import dal.OrderDAO;
import dal.OrderItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import model.CartItem;
import model.Item;
import model.Order;
import model.OrderItem;
import model.User;

/**
 *
 * @author lap
 */
public class PlaceOrderServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet PlaceOrderServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlaceOrderServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("home");
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String method = request.getParameter("payment");
        String bankCode = request.getParameter("bankCode");
        String bankName = request.getParameter("bankName");
        String accNum = request.getParameter("accountNum");
        
        int payMethod = (method == null) ? 1 : Integer.valueOf(method);
        if(bankCode == null) bankCode = "";
        if(bankName == null) bankName = "";
        if(accNum == null) accNum = "";
        
        HttpSession session = request.getSession();
        CartItemDAO cidb = new CartItemDAO();
        User u = (User) session.getAttribute("account");
        ArrayList<CartItem> listItems = cidb.getListItemsByUser(u);
        double totalMoney = cidb.getTotalMoney(listItems) + 30;
        String id = createOrderID(u);
        String orderDate = getDate();
        
        Order order = new Order(id, orderDate, totalMoney, payMethod, bankCode, bankName, accNum, fullname, address, phone, 30, 1, u);
        OrderDAO odb = new OrderDAO();
        odb.insertOrder(order);
        
        OrderItemDAO oidb = new OrderItemDAO();
        ItemDAO idb = new ItemDAO();
        for(CartItem x : listItems){
            OrderItem oit = new OrderItem();
            oit.setItem(x.getItem());
            oit.setOrder(order);
            oit.setQuantity(x.getQuantity());
            oidb.insertOrderItem(oit);
            Item it = x.getItem();
            int num = -1 * x.getQuantity();
            idb.updateQuantity(it, num);
        }
        cidb.deleteCart(u);
        session.setAttribute("numInCart", 0);
        request.getRequestDispatcher("complete.jsp").forward(request, response);
    }
    
    private String getDate(){
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(currentDate);
        return formattedDate;
    }
    
    private String createOrderID(User u){
//        int length = 10;
//        String digits = "0123456789";
//        String res = "";
//
//        Random random = new Random();
//        for (int i = 0; i < length; i++) {
//            int index = random.nextInt(digits.length());
//            res += digits.charAt(index);
//        }
//        res = "OD" + res;
//        return res;
        OrderDAO odb = new OrderDAO();
        ArrayList<Order> list = odb.getListOrderByUser(u);
        String res = "OD";
        String id = String.format("%05d", list.size() + 1);
        res += id + u.getId();
        return res;
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
