package com.prj.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.prj.vo.Criteria;
import com.prj.vo.FileSaveVo;
import com.prj.dao.InsaDao;
import com.prj.util.AlreadyExistingEmailException;
import com.prj.util.AlreadyExistingIdException;
import com.prj.util.Pagination;
import com.prj.util.RegisterRequest;
import com.prj.util.SaveWord;
import com.prj.vo.MemberVo;
import com.prj.vo.UserVo;

@Service
public class InsaServiceImpl implements InsaService {
	@Inject
	private InsaDao dao;
	
	@Override
	public void write(MemberVo vo) throws Exception {
		dao.write(vo);		
	}
	
	@Override
	public void modify(MemberVo vo) throws Exception {
		dao.modify(vo);
	}
	
	@Override
	public MemberVo detail(int id) throws Exception {
		return dao.detail(id);
	}
	
	@Override
	public List<MemberVo> listPage(Pagination cri) throws Exception {
		return dao.listPage(cri);
	}
	
	@Override
	public int listCount(SaveWord cri) throws Exception {
		return dao.listCount(cri);
	}

	@Override
	public void delete(int id) throws Exception {
		dao.delete(id);	
	}
	
	@Override
	public void insertFile(FileSaveVo vo) throws Exception {
		dao.insertFile(vo);		
	}
	
	   @Override
	    public String register(RegisterRequest regReq) throws Exception {
		   
	        UserVo id = dao.selectById(regReq.getId());
	        if(id!=null) {
	        	return "id_duble";
	        }		  
		   
	        UserVo email = dao.selectByEmail(regReq.getEmail());
	        if(email!=null) {
	           return "email_duble";
	        }

	        dao.insertUser(regReq);
	        return "success";
	    }

	
}
