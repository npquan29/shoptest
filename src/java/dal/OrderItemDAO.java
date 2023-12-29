/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Item;
import model.Order;
import model.OrderItem;

/**
 *
 * @author lap
 */
public class OrderItemDAO extends DBContext{
    
    public ArrayList<OrderItem> getListItemByOrder(Order order){
        String sql = "select * from orderitem where orderID = ?";
        ArrayList<OrderItem> list = new ArrayList<>();
        ItemDAO idb = new ItemDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order.getId());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                OrderItem x = new OrderItem();
                x.setOrder(order);
                Item it = idb.getItemByID(rs.getString("itemID"));
                x.setItem(it);
                x.setQuantity(rs.getInt("quantity"));
                list.add(x);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }   
    
    public void insertOrderItem(OrderItem x){
        String sql = "insert into orderitem values (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getOrder().getId());
            st.setString(2, x.getItem().getId());
            st.setInt(3, x.getQuantity());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
}
