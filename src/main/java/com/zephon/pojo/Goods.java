package com.zephon.pojo;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.pojo
 * @date 19-5-27 下午1:07
 * @Copyright ©
 */
public class Goods {
    private int id;
    private String name;
    private Double price;
    private String detail;
    private String type;
    private String picture;
    private Integer sales;

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", detail='" + detail + '\'' +
                ", type='" + type + '\'' +
                ", picture='" + picture + '\'' +
                ", sales=" + sales +
                '}';
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}
