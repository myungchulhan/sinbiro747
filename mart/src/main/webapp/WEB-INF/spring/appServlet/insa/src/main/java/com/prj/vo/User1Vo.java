package com.prj.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.*;


public class User1Vo {
	
	  private Integer no;
	   

	  private String name;
	   
	  @NotEmpty
	  @Email
	  private String email;
	   
	  @NotEmpty
	  @Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}")
	  private String pwd;
	   
	  @NotEmpty
	  private String gender;
	   
	  private String regDate;

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	  
	  
	

}
