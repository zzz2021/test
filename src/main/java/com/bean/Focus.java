package com.bean;

import java.util.Date;

public class Focus {
   private Integer id;
   private int bid;
   private int gid;
   private String gname;
   private String gpicture;
   private Double gprice;
   private String focustime;
    public Focus(){}
    public Focus(Integer id, int bid, int gid, String gname, String gpicture, Double gprice, String focustime) {
        this.id = id;
        this.bid = bid;
        this.gid = gid;
        this.gname = gname;
        this.gpicture = gpicture;
        this.gprice = gprice;
        this.focustime = focustime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGpicture() {
        return gpicture;
    }

    public void setGpicture(String gpicture) {
        this.gpicture = gpicture;
    }

    public Double getGprice() {
        return gprice;
    }

    public void setGprice(Double gprice) {
        this.gprice = gprice;
    }

    public String getFocustime() {
        return focustime;
    }

    public void setFocustime(String focustime) {
        this.focustime = focustime;
    }
}
