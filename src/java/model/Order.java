/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lap
 */
public class Order {

    private String id;
    private String orderDate;
    private double total;
    private int payment;
    private String bankID;
    private String bankName;
    private String accountNum;
    private String receiver;
    private String address;
    private String phone;
    private double costShip;
    private int status;
    private User user;

    public Order() {
    }

    public Order(String id, String orderDate, double total, int payment, String bankID, String bankName, String accountNum, String receiver, String address, String phone, double costShip, int status, User user) {
        this.id = id;
        this.orderDate = orderDate;
        this.total = total;
        this.payment = payment;
        this.bankID = bankID;
        this.bankName = bankName;
        this.accountNum = accountNum;
        this.receiver = receiver;
        this.address = address;
        this.phone = phone;
        this.costShip = costShip;
        this.status = status;
        this.user = user;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public String getBankID() {
        return bankID;
    }

    public void setBankID(String bankID) {
        this.bankID = bankID;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getAccountNum() {
        return accountNum;
    }

    public void setAccountNum(String accountNum) {
        this.accountNum = accountNum;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getCostShip() {
        return costShip;
    }

    public void setCostShip(double costShip) {
        this.costShip = costShip;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
