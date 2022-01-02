package com.prj.vo;

import java.util.Date;

public class MemberVo {
	/*
	 * id number(10) not null, name varchar2(20) , age number(3) , gender
	 * varchar2(1), part varchar2(10) , hobby varchar2(100) , reg_date date default
	 * sysdate
	 */
	
	private int id;
	private String name;
	private int age;
	private String gender;
	private String part;
	private String hobby;
	private Date reg_date;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
