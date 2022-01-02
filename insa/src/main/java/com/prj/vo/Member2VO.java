package com.prj.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

public class Member2VO extends LoginVO {

    @Pattern(regexp = "^[a-z | A-Z]{3,6}[0-9]{3,6}$")
    private String user_id;
    
    @Pattern(regexp="^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$")
    private String password;
    
    private String sign_date;

    @Email()
    private String email;

    private String ip;

    @Pattern(regexp = "^(01[1|6|7|8|9|0])-(\\d{3,4})-(\\d{4})$")
    private String phone;

    @Pattern(regexp = "^[가-힣]{2,6}$")
    private String name;

    private String birth_day;

    private String solar_birth_yn;

    @Pattern(regexp = "^[가-힣]+[가-힣\\s]*$")
    private String address;
    private String write_date;


}
