package com.dto;

public class CartDTO {

	private int num;
	private String userid;
	private String gcode;
	private String gname;
	private int gprice;
	private String gsize;
	private String gcolor;
	private int gamount;
	private String gimage;

	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartDTO(int num, String userid, String gcode, String gname, int gprice, String gsize, String gcolor,
			int gamount, String gimage) {
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

	@Override
	public String toString() {
		return "CartDTO [num=" + num + ", userid=" + userid + ", gcode=" + gcode + ", gname=" + gname + ", gprice="
				+ gprice + ", gsize=" + gsize + ", gcolor=" + gcolor + ", gamount=" + gamount + ", gimage=" + gimage
				+ "]";
	}

}
