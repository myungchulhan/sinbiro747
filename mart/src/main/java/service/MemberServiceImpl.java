package service;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import asist.MemberDAO;
import domain.MemberVo;


@Service
public class MemberServiceImpl implements MemberService  {

	@Inject
	private MemberDAO dao;
	
	//매핑
	private static String namespace = "com.mart.mappers.memberMapper";
	
	@Override
	public void signup(MemberVo vo) throws Exception {
		dao.signup(vo);
	}	
		
	@Override
	public MemberVo login(MemberVo vo) throws Exception {
		return dao.login(vo);			
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();		
		
	}	
	
}
