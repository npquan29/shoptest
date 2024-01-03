/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author lap
 */
public class UserDAO extends DBContext{
    
    public ArrayList<User> getAllCustomers(){
        String sql  = "select * from `user` where role = 1";
        ArrayList<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                String id = rs.getString("ID");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String image = rs.getString("image");
                int role = rs.getInt("role");
                User x = new User(id, username, password, fullname, email, address, phone, image, role);
                list.add(x);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public ArrayList<User> getAllAccounts(){
        String sql = "select * from `user`";
        ArrayList<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                String id = rs.getString("ID");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String image = rs.getString("image");
                int role = rs.getInt("role");
                User x = new User(id, username, password, fullname, email, address, phone, image, role);
                list.add(x);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public User getUserByID(String id){
        String sql = "select * from user where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                String id_DB = rs.getString("ID");
                String username_DB = rs.getString("username");
                String password_DB = rs.getString("password");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String image = rs.getString("image");
                int role = rs.getInt("role");
                User x = new User(id, username_DB, password_DB, fullname, email, address, phone, image, role);
                return x;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public User getUserByUsername(String username){
        String sql = "select * from `user` where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                String id_DB = rs.getString("ID");
                String username_DB = rs.getString("username");
                String password_DB = rs.getString("password");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String image = rs.getString("image");
                int role = rs.getInt("role");
                User x = new User(id_DB, username_DB, password_DB, fullname, email, address, phone, image, role);
                return x;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public User checkUser(String username, String password){
        String sql = "select * from user where username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                String id = rs.getString("ID");
                String username_DB = rs.getString("username");
                String password_DB = rs.getString("password");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String image = rs.getString("image");
                int role = rs.getInt("role");
                User x = new User(id, username_DB, password_DB, fullname, email, address, phone, image, role);
                return x;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public boolean existUser(String username){
        String sql = "select * from user where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public void insert(User x){
        String sql = "insert into `user` values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getId());
            st.setString(2, x.getUsername());
            st.setString(3, x.getPassword());
            st.setString(4, x.getFullname());
            st.setString(5, x.getEmail());
            st.setString(6, x.getAddress());
            st.setString(7, x.getPhone());
            st.setInt(8, x.getRole());
            st.setString(9, x.getImage());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void changePass(User x){
        String sql = "update user set password = ? where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getPassword());
            st.setString(2, x.getUsername());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateUser(User x){
        String sql = "update user set fullname = ?, email = ?, address = ?, phone = ?, image = ? where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getFullname());
            st.setString(2, x.getEmail());
            st.setString(3, x.getAddress());
            st.setString(4, x.getPhone());
            st.setString(5, x.getImage());
            st.setString(6, x.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteUser(String id){
        String sql = "delete from `user` where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
