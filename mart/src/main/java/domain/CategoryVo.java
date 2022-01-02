package domain;

import java.util.Date;

public class CategoryVo {
	/*
	"CATENAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"CATECODE" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"CATECODEREF" VARCHAR2(30 BYTE),
    */
	private String cateName;
	private String cateCode;
	private String cateCodeRef;
	private String level;
	
	
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	
	

	
}
