package service;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import domain.MemberVo;


public interface MemberService {

	public void signup(MemberVo vo) throws Exception;
	
	public MemberVo login(MemberVo vo) throws Exception;

	public void logout(HttpSession session) throws Exception;
	
}
