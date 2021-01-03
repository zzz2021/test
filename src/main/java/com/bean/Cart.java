package com.bean;

public class Cart {
    private Integer id;
    private String goods_name;
    private int buser_id;
    private int goods_id;
    private int goodsNum;
    private String picture;
    private Double price;
    private Double total;

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Cart(){}

    public Cart(Integer id, String goods_name, int buser_id, int goods_id, int goodsNum, String picture, Double price) {
        this.id = id;
        this.goods_name = goods_name;
        this.buser_id = buser_id;
        this.goods_id = goods_id;
        this.goodsNum = goodsNum;
        this.picture = picture;
        this.price = price;
        this.total=this.goodsNum*this.price;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public int getBuser_id() {
        return buser_id;
    }

    public void setBuser_id(int buser_id) {
        this.buser_id = buser_id;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public int getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(int goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
