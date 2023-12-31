/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Comment;
import model.Item;
import model.User;

/**
 *
 * @author lap
 */
public class CommentDAO extends DBContext{
    
    public ArrayList<Comment> getCommentsByItem(Item it){
        ArrayList<Comment> list = new ArrayList<>();
        String sql = "select * from `comment` where itemID = ?";
        UserDAO udb = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, it.getId());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Comment c = new Comment();
                c.setId(rs.getString("ID"));
                c.setContent(rs.getString("content"));
                c.setDate(rs.getString("createDate"));
                c.setRating(rs.getInt("rating"));
                c.setItem(it);
                User u = udb.getUserByID(rs.getString("userID"));
                c.setUser(u);
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void insertComment(Comment c){
        String sql = "insert into `comment` values (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getId());
            st.setString(2, c.getContent());
            st.setString(3, c.getDate());
            st.setInt(4, c.getRating());
            st.setString(5, c.getItem().getId());
            st.setString(6, c.getUser().getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
}
