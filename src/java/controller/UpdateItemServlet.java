/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.ItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Category;
import model.Item;

/**
 *
 * @author lap
 */
public class UpdateItemServlet extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateItemServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateItemServlet at " + request.getContextPath () + "</h1>");
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
        String itemID = request.getParameter("itemID");
        ItemDAO idb = new ItemDAO();
        Item it = idb.getItemByID(itemID);
        CategoryDAO cdb = new CategoryDAO();
        ArrayList<Category> list = cdb.getAll();
        request.setAttribute("list", list);
        request.setAttribute("item", it);
        request.getRequestDispatcher("updateItem.jsp").forward(request, response);
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
        String itemID = request.getParameter("itemID");
        String name = request.getParameter("name");
        String stock_raw = request.getParameter("stock");
        String costPrice_raw = request.getParameter("costPrice");
        String sellPrice_raw = request.getParameter("sellPrice");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String categoryID = request.getParameter("categoryID");
        
        int stock = (stock_raw == null) ? 1 : Integer.valueOf(stock_raw);
        double costPrice = (costPrice_raw == null) ? 500 : Double.valueOf(costPrice_raw);
        double sellPrice = (sellPrice_raw == null) ? 650 : Double.valueOf(sellPrice_raw);
        
        CategoryDAO cdb = new CategoryDAO();
        Category cate = cdb.get(categoryID);
        Item it = new Item(itemID, name, stock, costPrice, sellPrice, image, 0, description, cate);
        ItemDAO idb = new ItemDAO();
        idb.updateItem(it);
        response.sendRedirect("listItemManager");
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
