/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.CartItem;
import model.Item;
import model.User;

/**
 *
 * @author lap
 */
public class CartItemDAO extends DBContext {

    public CartItem getItemByUser(User user, String itemID) {
        String sql = "select * from cartitem where itemID = ? and userID = ?";
        ItemDAO idb = new ItemDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, itemID);
            st.setString(2, user.getId());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                CartItem ci = new CartItem();
                ci.setId(rs.getString("cartID"));
                ci.setUser(user);
                Item it = idb.getItemByID(itemID);
                ci.setItem(it);
                ci.setQuantity(rs.getInt("quantity"));
                return ci;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<CartItem> getListItemsByUser(User x){
        String sql = "select * from cartitem where userID = ?";
        ArrayList<CartItem> list = new ArrayList<>();
        ItemDAO idb = new ItemDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getId());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                CartItem ci = new CartItem();
                ci.setId(rs.getString("cartID"));
                Item it = idb.getItemByID(rs.getString("itemID"));
                ci.setItem(it);
                ci.setUser(x);
                ci.setQuantity(rs.getInt("quantity"));
                list.add(ci);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public double getTotalMoney(ArrayList<CartItem> list){
        double res = 0;
        for(CartItem x : list){
            res += (x.getQuantity() * x.getItem().getSell());
        }
        return res;
    }

    public void insertCartItem(CartItem x) {
        String sql = "insert into cartitem values (?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getId());
            st.setString(2, x.getItem().getId());
            st.setString(3, x.getUser().getId());
            st.setInt(4, x.getQuantity());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateQuantity(CartItem x, int num){
        String sql = "update cartitem set quantity = quantity + ? where cartID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, num);
            st.setString(2, x.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteCartItem(User user, Item it){
        String sql = "delete from cartitem where itemID = ? and userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, it.getId());
            st.setString(2, user.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteCart(User user){
        String sql = "delete from cartitem where userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
