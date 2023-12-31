/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommentDAO;
import dal.ItemDAO;
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
import model.Comment;
import model.Item;
import model.User;

/**
 *
 * @author lap
 */
public class CommentServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        if (id == null) {
            response.sendRedirect("home");
        } else {
            ItemDAO idb = new ItemDAO();
            Item it = idb.getItemByID(id);
            request.setAttribute("item", it);
            request.getRequestDispatcher("comment.jsp").forward(request, response);
        }
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
        String id = request.getParameter("id");
        String comment = request.getParameter("comment");
        String rating = request.getParameter("rating");

        int star = (rating == null) ? 5 : Integer.valueOf(rating);

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        ItemDAO idb = new ItemDAO();
        Item it = idb.getItemByID(id);
        CommentDAO cdb = new CommentDAO();
        ArrayList<Comment> list = cdb.getCommentsByItem(it);
        String commentID = createCommentID(list, it);
        String createDate = getDate();
        Comment c = new Comment(commentID, comment, createDate, star, it, u);
        CommentDAO cmdb = new CommentDAO();
        cmdb.insertComment(c);
        ArrayList<Comment> listNew = cdb.getCommentsByItem(it);
        idb.updateRating(it, getRating(listNew));
        response.sendRedirect("home");
    }

    private String createCommentID(ArrayList<Comment> list, Item it) {
        String res = "CM";
        String id = String.format("%05d", list.size() + 1);
        res += id + it.getId();
        return res;
    }

    private String getDate() {
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(currentDate);
        return formattedDate;
    }
    
    private double getRating(ArrayList<Comment> list){
        double res = 0;
        for(Comment x : list){
            res += (x.getRating() * 1.0 / list.size());
        }
        double roundedNumber = Math.round(res * 10.0) / 10.0;
        return roundedNumber;
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
