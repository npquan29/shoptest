/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import model.ChartData;
import model.Order;
import model.User;

/**
 *
 * @author lap
 */
public class OrderDAO extends DBContext {

    public ArrayList<Order> getAll() {
        String sql = "select * from `order`";
        ArrayList<Order> list = new ArrayList<>();
        UserDAO udb = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order x = new Order();
                x.setId(rs.getString("ID"));
                x.setOrderDate(rs.getString("orderDate"));
                x.setTotal(rs.getDouble("total"));
                x.setPayment(rs.getInt("payment"));
                x.setBankID(rs.getString("bankID"));
                x.setBankName(rs.getString("bankName"));
                x.setAccountNum(rs.getString("accountNum"));
                x.setReceiver(rs.getString("fullname"));
                x.setAddress(rs.getString("address"));
                x.setPhone(rs.getString("phone"));
                x.setCostShip(rs.getDouble("costShip"));
                x.setStatus(rs.getInt("status"));
                User u = udb.getUserByID(rs.getString("userID"));
                x.setUser(u);
                list.add(x);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Order> getListOrderByUser(User user) {
        String sql = "select * from `order` where userID = ?";
        ArrayList<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getId());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order x = new Order();
                x.setId(rs.getString("ID"));
                x.setOrderDate(rs.getString("orderDate"));
                x.setTotal(rs.getDouble("total"));
                x.setPayment(rs.getInt("payment"));
                x.setBankID(rs.getString("bankID"));
                x.setBankName(rs.getString("bankName"));
                x.setAccountNum(rs.getString("accountNum"));
                x.setReceiver(rs.getString("fullname"));
                x.setAddress(rs.getString("address"));
                x.setPhone(rs.getString("phone"));
                x.setCostShip(rs.getDouble("costShip"));
                x.setStatus(rs.getInt("status"));
                x.setUser(user);
                list.add(x);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Order getOrderByID(String id) {
        String sql = "select * from `order` where ID = ?";
        UserDAO udb = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order x = new Order();
                x.setId(rs.getString("ID"));
                x.setOrderDate(rs.getString("orderDate"));
                x.setTotal(rs.getDouble("total"));
                x.setPayment(rs.getInt("payment"));
                x.setBankID(rs.getString("bankID"));
                x.setBankName(rs.getString("bankName"));
                x.setAccountNum(rs.getString("accountNum"));
                x.setReceiver(rs.getString("fullname"));
                x.setAddress(rs.getString("address"));
                x.setPhone(rs.getString("phone"));
                x.setCostShip(rs.getDouble("costShip"));
                x.setStatus(rs.getInt("status"));
                User u = udb.getUserByID(rs.getString("userID"));
                x.setUser(u);
                return x;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertOrder(Order order) {
        String sql = "insert into `order` values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order.getId());
            st.setString(2, order.getOrderDate());
            st.setDouble(3, order.getTotal());
            st.setInt(4, order.getPayment());
            st.setString(5, order.getBankID());
            st.setString(6, order.getBankName());
            st.setString(7, order.getAccountNum());
            st.setString(8, order.getReceiver());
            st.setString(9, order.getAddress());
            st.setString(10, order.getPhone());
            st.setDouble(11, order.getCostShip());
            st.setInt(12, order.getStatus());
            st.setString(13, order.getUser().getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateOrder(Order x) {
        String sql = "update `order` set status = ? where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, x.getStatus());
            st.setString(2, x.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Trả về ngày, tổng tiền các đơn hàng của ngày đó
    public ArrayList<ChartData> getDailyTotal(int month) {
        String sql = "SELECT DAY(orderDate) as day, SUM(total) as total "
                + "FROM `order` WHERE MONTH(orderDate) = ? "
                + "GROUP BY DAY(orderDate)";

        ArrayList<ChartData> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (month != -1) {
                st.setInt(1, month);
            } else {
                st.setInt(1, LocalDate.now().getMonthValue());
            }
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int day = rs.getInt("day");
                double total = rs.getDouble("total");

                ChartData chartdata = new ChartData(day, total);
                list.add(chartdata);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    // Trả về tổng tiền đơn hàng trong tháng
    public double getTotalRevenueInCurrentMonth(int month) {
        String sql = "SELECT SUM(total) as total FROM `order` WHERE MONTH(orderDate) = ?";
        double total = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (month != -1) {
                st.setInt(1, month);
            } else {
                st.setInt(1, LocalDate.now().getMonthValue());
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getDouble("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }

    // Số lượng sản phẩm bán được trong tháng
    public int getTotalItemsSoldInMonth(int month) {
        String sql = "SELECT SUM(orderitem.quantity) as total "
                + "FROM `order` JOIN orderitem ON order.ID = orderitem.orderID "
                + "WHERE MONTH(order.orderDate) = ? "
                + "GROUP BY MONTH(order.orderDate)";
        int total = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (month != -1) {
                st.setInt(1, month);
            } else {
                st.setInt(1, LocalDate.now().getMonthValue());
            }

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }

    // Tổng doanh thu
    public double getRevenue() {
        String sql = "SELECT SUM(total) as total FROM `order`";
        double total = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getDouble("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }
    
    // Lợi nhuận trong tháng
    public double getProfitInMonth(int month) {
        String sql = "SELECT SUM(profit) as total "
                + "FROM "
                + "(SELECT (SUM(quantity) * (item.sellPrice - item.costPrice)) as profit, item.ID "
                + "FROM `order` "
                + "JOIN orderitem ON `order`.ID = orderitem.orderID "
                + "JOIN item ON item.ID = orderitem.itemID WHERE MONTH(`order`.orderDate) = ? "
                + "GROUP BY item.ID) as Y";
        double total = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            if (month != -1) {
                st.setInt(1, month);
            } else {
                st.setInt(1, LocalDate.now().getMonthValue());
            }

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }

}
