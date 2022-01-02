package com.prj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.prj.vo.Criteria;
import com.prj.vo.FileSaveVo;
import com.prj.dao.InsaDao;
import com.prj.vo.MemberVo;
import com.prj.util.Pagination;
import com.prj.util.RegisterRequest;
import com.prj.util.SaveWord;

public interface InsaService {
	
	public void write(MemberVo vo) throws Exception;
	
	public void modify(MemberVo vo) throws Exception;
	
	public MemberVo detail(int id) throws Exception;
	
	public List<MemberVo> listPage(Pagination cri) throws Exception;
	
	public int listCount(SaveWord cri) throws Exception;
	
	public void delete(int id) throws Exception;
	
	public void insertFile(FileSaveVo vo) throws Exception;
	
	public String register(RegisterRequest regReq) throws Exception;

}
