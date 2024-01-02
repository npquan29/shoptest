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
import java.util.HashMap;
import model.Category;
import model.Item;

/**
 *
 * @author lap
 */
public class ProductsServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsServlet at " + request.getContextPath() + "</h1>");
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
        CategoryDAO cdb = new CategoryDAO();
        ItemDAO idb = new ItemDAO();

        // Danh sách tham số từ URL
        String name = request.getParameter("name");
        String[] categoryParam = request.getParameterValues("category");
        String[] priceParam = request.getParameterValues("price");
        String sortType = request.getParameter("sortType");
        String numberPerPage = request.getParameter("numberPerPage");

        // Xử lý đường dẫn URL phân trang và thẻ select
        String url = "";

        // CheckBox Price
        ArrayList<String> priceList = new ArrayList<>();
        priceList.add("0$ - 500$");
        priceList.add("500$ - 1000$");
        priceList.add("1000$ - 1500$");
        priceList.add("1500$ +");

        // Select SortType
        ArrayList<String> sortList = new ArrayList<>();
        sortList.add("Default");
        sortList.add("Name: A - Z");
        sortList.add("Name: Z - A");
        sortList.add("Price: Low to High");
        sortList.add("Price: High to Low");

        // Select NumberPerPage
        ArrayList<String> perPageList = new ArrayList<>();
        perPageList.add("6");
        perPageList.add("9");
        perPageList.add("12");

        ArrayList<Category> listCategory = cdb.getAll();
        ArrayList<Item> listItem = new ArrayList<>();
        HashMap<String, Integer> mpCat = new HashMap<>();
        HashMap<String, Integer> mpPrice = new HashMap<>();

        // Lấy SortType và NumberPerPage
        if (sortType == null) {
            sortType = "1";
        }
        if (numberPerPage == null) {
            numberPerPage = "6";
        }

        // Lấy name để tìm kiếm theo tên
        if(name != null && !name.equals("")){
            url += "name=" + name + "&";
        }
        
        // Đánh dấu categoryID và nối categoryID vào URL 
        if (categoryParam != null) {
            mpCat = getMap(categoryParam);
            for(int i = 0; i < categoryParam.length; i++){
                url += "category=" + categoryParam[i] + "&";
            }
        }
        
        // Lấy danh sách sản phẩm theo danh mục và giá, sortType
        if(priceParam != null){
            mpPrice = getMap(priceParam);
            for(int i = 0; i < priceParam.length; i++){
                url += "price=" + priceParam[i] + "&";
            }
            if(priceParam.length < 4){
                for(int i = 0; i < priceParam.length; i++){
                    ArrayList<Item> listTMP = idb.getItemsByPrice(categoryParam, name, priceParam[i], sortType);
                    listItem.addAll(listTMP);
                }
            }
            else{
                ArrayList<Item> listNoPrice = idb.getItemsByPrice(categoryParam, name, "", sortType);
                listItem.addAll(listNoPrice);
            }
        }
        else{
            ArrayList<Item> listNoPrice = idb.getItemsByPrice(categoryParam, name, "", sortType);
            listItem.addAll(listNoPrice);
        }
        
        // Nối sortType và numberPerPage vào URL
        url += "sortType=" + sortType + "&";
        url += "numberPerPage=" + numberPerPage;

        // Đánh dấu những Checkbox đã được chọn trước đó
        boolean isCheckedCat[] = isCheckCategory(mpCat, listCategory);
        boolean isCheckedPrice[] = isCheckPrice(mpPrice);
       
        // Phân trang sản phẩm
        int numPerPage = Integer.valueOf(numberPerPage);
        String currentPage = request.getParameter("page");
        int page = (currentPage == null) ? 1 : Integer.valueOf(currentPage);
        int start, end, size = listItem.size();
        start = ((page - 1) * numPerPage);
        end = Math.min(page * numPerPage, size);
        int numPages = (size % numPerPage == 0) ? (size / numPerPage) : ((size / numPerPage) + 1);
        ArrayList<Item> listPerPage = idb.getListByPage(listItem, start, end);
        
        // SetAttribute cho JSP
        request.setAttribute("listPrice", priceList);
        request.setAttribute("listSort", sortList);
        request.setAttribute("listPerPage", perPageList);
        request.setAttribute("isCheckCat", isCheckedCat);
        request.setAttribute("isCheckPrice", isCheckedPrice);
        request.setAttribute("url", url);
        request.setAttribute("curPage", page);
        request.setAttribute("numPages", numPages);
        request.setAttribute("numItem", listItem.size());
        request.setAttribute("key", name);
        request.setAttribute("listCat", listCategory);
        request.setAttribute("listItem", listPerPage);
        
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    // Đánh dấu phần tử xuất hiện trong param bằng Map
    private HashMap<String, Integer> getMap(String[] list) {
        HashMap<String, Integer> mp = new HashMap<>();
        for (String x : list) {
            mp.put(x, 1);
        }
        return mp;
    }
    
    // Đánh dấu danh mục nào được chọn trước đó
    private boolean[] isCheckCategory(HashMap<String, Integer> mp, ArrayList<Category> list){
        boolean isCheck[] = new boolean[list.size()];
        if(!mp.isEmpty()){
            for(int i = 0; i < list.size(); i++){
                if(mp.containsKey(list.get(i).getId())){
                    isCheck[i] = true;
                }
                else{
                    isCheck[i] = false;
                }
            }
        }
        else{
            for(int i = 0; i < list.size(); i++){
                isCheck[i] = false;
            }
        }
        return isCheck;
    }
    
    // Đánh dấu mức giá nào được chọn trước đó
    private boolean[] isCheckPrice(HashMap<String, Integer> mp){
        ArrayList<String> list = new ArrayList<>();
        list.add("1"); list.add("2");
        list.add("3"); list.add("4");
        boolean isCheck[] = new boolean[list.size()];
        if(!mp.isEmpty()){
            for(int i = 0; i < list.size(); i++){
                if(mp.containsKey(list.get(i))){
                    isCheck[i] = true;
                }
                else{
                    isCheck[i] = false;
                }
            }
        }
        else{
            for(int i = 0; i < list.size(); i++){
                isCheck[i] = false;
            }
        }
        return isCheck;
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
