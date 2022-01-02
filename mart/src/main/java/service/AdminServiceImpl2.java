package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import asist.AdminDAO2;
import domain.MemberVo;

@Service
public class AdminServiceImpl2 implements AdminService2  {
	
	@Inject
	AdminDAO2 dao;
	
	@Override
	public void memberWrite(MemberVo vo) throws Exception {
		dao.memberWrite(vo);
		
		
	}
}