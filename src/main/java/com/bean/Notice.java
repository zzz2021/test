package com.bean;

public class Notice {
	private Integer id;
	private String ntitle;
	private String ncontent;
	private String ntime;//YYYY-MM-DD HH:MM:SS

	public Notice(){}

	public Notice(Integer id, String ntitle, String ncontent, String ntime) {
		this.id = id;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ntime = ntime;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNtime() {
		return ntime;
	}
	public void setNtime(String ntime) {
		this.ntime = ntime;
	}
}
