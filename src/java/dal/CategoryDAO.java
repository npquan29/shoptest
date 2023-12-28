/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author lap
 */
public class CategoryDAO extends DBContext{
    public ArrayList<Category> getAll(){
        String sql = "select * from category";
        ArrayList<Category> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category x = new Category(rs.getString(1), rs.getString(2));
                list.add(x);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Category get(String id){
        String sql = "select * from category where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category x = new Category(rs.getString(1), rs.getString(2));
                return x;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
