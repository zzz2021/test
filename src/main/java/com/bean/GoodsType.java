package com.bean;

public class GoodsType {
	private Integer id;
	private String typename;
	public GoodsType(){}
	public GoodsType(Integer id, String typename) {
		this.id = id;
		this.typename = typename;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	
}
