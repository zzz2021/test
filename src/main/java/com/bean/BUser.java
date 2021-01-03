package com.bean;

public class BUser {
    private Integer bid;
    private String bemail;
    private String bname;
    private String bpwd;
    private int sex;
    private String phone;
    private String address;
    public BUser(){}
    public BUser(Integer bid, String bemail, String bname, String bpwd, int sex, String phone, String address) {
        this.bid = bid;
        this.bemail = bemail;
        this.bname = bname;
        this.bpwd = bpwd;
        this.sex = sex;
        this.phone = phone;
        this.address = address;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getBemail() {
        return bemail;
    }

    public void setBemail(String bemail) {
        this.bemail = bemail;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBpwd() {
        return bpwd;
    }

    public void setBpwd(String bpwd) {
        this.bpwd = bpwd;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
