package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import asist.AdminDAO2;
import domain.MemberVo;


@Service
public class AdminService2 {
	@Inject
	AdminDAO2 dao;
	public void write(MemberVo vo) {
		dao.memberWrite(vo);
			
	}
	
}