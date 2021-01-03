package com.bean;

import org.springframework.web.multipart.MultipartFile;

public class Goods {
	private Integer id;
	private String gname;
	private Double goprice;
	private Double grprice;
	private Integer gstore;
	private String gpicture;
	private Integer goodstype_id;
	private int status;
	public Goods(){}

	public Goods(Integer id, String gname, Double goprice, Double grprice, Integer gstore, String gpicture, Integer goodstype_id, int status) {
		this.id = id;
		this.gname = gname;
		this.goprice = goprice;
		this.grprice = grprice;
		this.gstore = gstore;
		this.gpicture = gpicture;
		this.goodstype_id = goodstype_id;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Double getGoprice() {
		return goprice;
	}

	public void setGoprice(Double goprice) {
		this.goprice = goprice;
	}

	public Double getGrprice() {
		return grprice;
	}

	public void setGrprice(Double grprice) {
		this.grprice = grprice;
	}

	public Integer getGstore() {
		return gstore;
	}

	public void setGstore(Integer gstore) {
		this.gstore = gstore;
	}

	public String getGpicture() {
		return gpicture;
	}

	public void setGpicture(String gpicture) {
		this.gpicture = gpicture;
	}

	public Integer getGoodstype_id() {
		return goodstype_id;
	}

	public void setGoodstype_id(Integer goodstype_id) {
		this.goodstype_id = goodstype_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
