/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.ChartData;
import org.json.JSONObject;

/**
 *
 * @author lap
 */
public class ReportServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ReportServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportServlet at " + request.getContextPath () + "</h1>");
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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        OrderDAO odb = new OrderDAO();
        
        int month = Integer.valueOf(request.getParameter("month"));
        
        //Get chart's data
        ArrayList<ChartData> orderStats = odb.getDailyTotal(month);
   
        ArrayList<ChartData> allDays = new ArrayList<>();
        for (int day = 1; day <= 31; day++) {
            boolean dayExists = false;
            for (ChartData orderStat : orderStats) {
                if (orderStat.getDay() == day) {
                    allDays.add(orderStat);
                    dayExists = true;
                    break;
                }
            }
            if (!dayExists) {
                allDays.add(new ChartData(day, 0));
            }
        }
        
        //Get total revenue in month
        double totalMonthRevenue = odb.getTotalRevenueInCurrentMonth(month);
        
        //Get total item sold
        int totalItemSold = odb.getTotalItemsSoldInMonth(month);
        
        JSONObject resultObject = new JSONObject();
        resultObject.put("monthTotal", totalMonthRevenue);
        resultObject.put("chartData", allDays);
        resultObject.put("totalItemSold", totalItemSold);
         if(month != -1){
            double totalProfit = odb.getProfitInMonth(month);
            resultObject.put("totalProfit", totalProfit);
        } else {
            double totalRevenue = odb.getRevenue();  
            resultObject.put("totalRevenue", totalRevenue);
        }
        
        out.println(resultObject.toString());
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
        processRequest(request, response);
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
