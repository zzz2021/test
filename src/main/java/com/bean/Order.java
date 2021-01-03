package com.bean;

import java.util.Date;

public class Order {
	private Integer id;
	private int b_id;
	private int g_id;
	private int count;
	private int state;
	private String ordate;
	public Order(){}
	public Order(Integer id, int b_id, int g_id, int count, int state, String ordate) {
		this.id = id;
		this.b_id = b_id;
		this.g_id = g_id;
		this.count = count;
		this.state = state;
		this.ordate = ordate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getOrdate() {
		return ordate;
	}

	public void setOrdate(String ordate) {
		this.ordate = ordate;
	}
}
