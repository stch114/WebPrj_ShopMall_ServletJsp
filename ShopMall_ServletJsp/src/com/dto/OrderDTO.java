package com.dto;

public class OrderDTO {

	private int num;
	private String userid;
	private String gcode;
	private String gname;
	private int gprice;
	private String gsize;
	private String gcolor;
	private int gamount;
	private String gimage;
	private String ordername;
	private String post;
	private String addr1;
	private String addr2;
	private String phone1;
	private String phone2;
	private String phone3;
	private String paymethod;
	private String orderday;

	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(int num, String userid, String gcode, String gname, int gprice, String gsize, String gcolor,
			int gamount, String gimage, String ordername, String post, String addr1, String addr2, String phone1,
			String phone2, String phone3, String paymethod, String orderday) {
		super();
		this.num = num;
		this.userid = userid;
		this.gcode = gcode;
		this.gname = gname;
		this.gprice = gprice;
		this.gsize = gsize;
		this.gcolor = gcolor;
		this.gamount = gamount;
		this.gimage = gimage;
		this.ordername = ordername;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.paymethod = paymethod;
		this.orderday = orderday;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getGcode() {
		return gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public String getGsize() {
		return gsize;
	}

	public void setGsize(String gsize) {
		this.gsize = gsize;
	}

	public String getGcolor() {
		return gcolor;
	}

	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}

	public int getGamount() {
		return gamount;
	}

	public void setGamount(int gamount) {
		this.gamount = gamount;
	}

	public String getGimage() {
		return gimage;
	}

	public void setGimage(String gimage) {
		this.gimage = gimage;
	}

	public String getOrdername() {
		return ordername;
	}

	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getPaymethod() {
		return paymethod;
	}

	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}

	public String getOrderday() {
		return orderday;
	}

	public void setOrderday(String orderday) {
		this.orderday = orderday;
	}

	@Override
	public String toString() {
		return "OrderDTO [num=" + num + ", userid=" + userid + ", gcode=" + gcode + ", gname=" + gname + ", gprice="
				+ gprice + ", gsize=" + gsize + ", gcolor=" + gcolor + ", gamount=" + gamount + ", gimage=" + gimage
				+ ", ordername=" + ordername + ", post=" + post + ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", paymethod=" + paymethod + ", orderday="
				+ orderday + "]";
	}

}