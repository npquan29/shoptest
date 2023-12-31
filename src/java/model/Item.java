/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lap
 */
public class Item {

    private String id;
    private String name;
    private int stock;
    private double cost;
    private double sell;
    private String image;
    private double rating;
    private String description;
    private Category category;

    public Item() {
    }

    public Item(String id, String name, int stock, double cost, double sell, String image, double rating, String description, Category category) {
        this.id = id;
        this.name = name;
        this.stock = stock;
        this.cost = cost;
        this.sell = sell;
        this.image = image;
        this.rating = rating;
        this.description = description;
        this.category = category;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public double getSell() {
        return sell;
    }

    public void setSell(double sell) {
        this.sell = sell;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

}
